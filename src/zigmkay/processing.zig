const std = @import("std");
const core = @import("core.zig");

pub fn CreateProcessorType(comptime keymap_dimensions: core.KeymapDimensions, comptime keymap: *const [keymap_dimensions.layer_count][keymap_dimensions.key_count]core.KeyDef) type {
    return struct {
        const Self = @This();
        layers_activations: core.LayerActivations = .{},

        // release_map is used to keep track of what to do when a key is released as the layer activations may have changed since is was pressed
        var release_map: [28]KeyReleaseAction = [_]KeyReleaseAction{KeyReleaseAction.None} ** 28;

        // The currently activated modifiers
        var modifiers: core.Modifiers = .{};
        var previous_matrix_change: core.MatrixStateChange = undefined;

        pub fn Process(
            self: *Self,
            input_matrix_changes: *core.MatrixStateChangeQueue,
            output_usb_commands: *core.OutputCommandQueue,
            current_time: core.TimeSinceBoot,
        ) !void {
            while (ProcessContinuation.DequeueOneAndRunAgain == try process_next(self, input_matrix_changes, output_usb_commands, current_time)) {
                _ = try input_matrix_changes.dequeue();
            }
        }

        const ProcessContinuation = enum { DequeueOneAndRunAgain, Stop };
        fn process_next(
            self: *Self,
            input_matrix_changes: *core.MatrixStateChangeQueue,
            output_usb_commands: *core.OutputCommandQueue,
            current_time: core.TimeSinceBoot,
        ) !ProcessContinuation {
            if (input_matrix_changes.Count() == 0) {
                return ProcessContinuation.Stop;
            }
            // This flow is designed to ensure it won't matter if one call Process once with a full queue or multiple times with single or no items in the queue.
            // This decreases the number of test combinations required to be run as all cases will result in changes being processed one by one
            const data = input_matrix_changes.peek_all();

            // Only decide for the head
            const head_event = data[0];

            if (head_event.pressed) {
                const head_key_def = determine_key_def(self, head_event.key_index);
                switch (head_key_def) {
                    .tap_only => |tap| {
                        try apply_tap(tap, head_event, output_usb_commands, TapReleaseMode.AwaitKeyReleased);
                        return ProcessContinuation.DequeueOneAndRunAgain;
                    },
                    .hold_only => |hold| {
                        try apply_hold(self, hold, head_key_def, head_event, output_usb_commands);
                        return ProcessContinuation.DequeueOneAndRunAgain;
                    },
                    .tap_hold => |tap_and_hold| {
                        for (data[1..], 1..) |outer_ev, outer_index| {
                            if (outer_ev.time < head_event.time) {
                                @panic("this should no happen!");
                            }
                            const tapping_term_expired = outer_ev.time - head_event.time > tap_and_hold.tapping_term_ms;
                            if (tapping_term_expired) {
                                try apply_hold(self, tap_and_hold.hold, head_key_def, head_event, output_usb_commands);
                                return ProcessContinuation.DequeueOneAndRunAgain;
                            }

                            if (!outer_ev.pressed) {
                                // if released key was the pressed one, choose tap
                                if (outer_ev.key_index == head_event.key_index) {
                                    warn("case 0", .{});
                                    try apply_tap(tap_and_hold.tap, head_event, output_usb_commands, TapReleaseMode.AwaitKeyReleased);
                                    return ProcessContinuation.DequeueOneAndRunAgain;
                                }
                                // if the key released was pressed before the head key, we are in a rolling writing mode, hence choose tap
                                var released_key_was_pressed_after_head = false;
                                for (data[1..outer_index]) |inner_ev| {
                                    if (inner_ev.key_index == outer_ev.key_index) {
                                        released_key_was_pressed_after_head = true;
                                    }
                                }

                                if (released_key_was_pressed_after_head) {
                                    try apply_hold(self, tap_and_hold.hold, head_key_def, head_event, output_usb_commands);
                                    return ProcessContinuation.DequeueOneAndRunAgain;
                                } else {
                                    try apply_tap(tap_and_hold.tap, head_event, output_usb_commands, TapReleaseMode.AwaitKeyReleased);
                                    return ProcessContinuation.DequeueOneAndRunAgain;
                                }
                            }
                        }

                        // No decision made while looping through all events, finally check if time just passed without anything happened
                        // In this case, it's a hold.
                        const tapping_term_expired = current_time - head_event.time > tap_and_hold.tapping_term_ms;
                        if (tapping_term_expired) {
                            try apply_hold(self, tap_and_hold.hold, head_key_def, head_event, output_usb_commands);
                            return ProcessContinuation.DequeueOneAndRunAgain;
                        }

                        warn("case 2", .{});
                        return ProcessContinuation.Stop;
                    },
                    .transparent => {
                        // only happening if the base layer has a transparent key - in this case handle as none
                        return ProcessContinuation.DequeueOneAndRunAgain;
                    },
                    .none => {
                        return ProcessContinuation.DequeueOneAndRunAgain;
                    },
                }
            } else {
                // handle release
                // in special cases, tapping is all done at press time, hence no release action (eg when a key should be tapped with a modifier applied to it)
                switch (release_map[head_event.key_index]) {
                    .None => {
                        warn("empty slot was released at key_index {}", .{head_event.key_index});
                        return ProcessContinuation.DequeueOneAndRunAgain;
                    },
                    .ReleaseTap => |tap_def| {
                        warn("1 released a", .{});
                        try output_usb_commands.enqueue(core.OutputCommand{ .KeyCodeRelease = tap_def.tap_keycode });
                        release_map[head_event.key_index] = KeyReleaseAction.None;
                        return ProcessContinuation.DequeueOneAndRunAgain;
                    },
                    .ReleaseHold => |hold_def| {
                        warn("1 released B", .{});
                        if (hold_def.hold_modifiers != null) {
                            // Cancel the hold modifier(s)
                            modifiers = modifiers.remove(hold_def.hold_modifiers.?);
                            try output_usb_commands.enqueue(.{ .ModifiersChanged = modifiers });
                        }
                        if (hold_def.hold_layer != null) {
                            self.layers_activations.deactivate(hold_def.hold_layer.?);
                        }
                        release_map[head_event.key_index] = KeyReleaseAction.None;

                        return ProcessContinuation.DequeueOneAndRunAgain;
                    },
                }
            }
        }

        const TapReleaseMode = enum { ForceInstant, AwaitKeyReleased };
        fn apply_tap(tap: core.TapDef, event: core.MatrixStateChange, output_queue: *core.OutputCommandQueue, release_mode: TapReleaseMode) !void {
            if (tap.tap_modifiers) |tap_modifiers| {
                warn("tap with modifier - all done at once", .{});
                // temporarily apply the modifiers on the key def and then switch back to the current modifiers afterwards
                try output_queue.enqueue(.{ .ModifiersChanged = tap_modifiers });
                try output_queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
                try output_queue.enqueue(.{ .KeyCodeRelease = tap.tap_keycode });
                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
            } else {
                warn("tap without modifier - release set - key: {}, at index: {}", .{ tap.tap_keycode, event.key_index });

                try output_queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
                switch (release_mode) {
                    .AwaitKeyReleased => {
                        release_map[event.key_index] = KeyReleaseAction{ .ReleaseTap = tap };
                    },
                    .ForceInstant => {
                        try output_queue.enqueue(.{ .KeyCodeRelease = tap.tap_keycode });
                    },
                }
            }
        }

        fn apply_hold(self: *Self, hold: core.HoldDef, key_def: core.KeyDef, event: core.MatrixStateChange, output_queue: *core.OutputCommandQueue) !void {
            _ = key_def;
            warn("hold applied", .{});
            if (hold.hold_modifiers != null) {
                // Apply the hold modifier(s)
                modifiers = modifiers.add(hold.hold_modifiers.?);
                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
            }
            if (hold.hold_layer != null) {
                self.layers_activations.activate(hold.hold_layer.?);
            }

            release_map[event.key_index] = KeyReleaseAction{ .ReleaseHold = hold };
        }
        fn determine_key_def(self: *Self, key_index: usize) core.KeyDef {
            // Find key on active position
            var pressed_key_def = keymap[0][key_index];

            var layer_index: usize = @as(usize, keymap_dimensions.layer_count - 1);
            while (layer_index > 0) {
                // transparent support: ...
                if (self.layers_activations.is_layer_active(layer_index) and keymap[layer_index][key_index] != core.KeyDef.transparent) {
                    pressed_key_def = keymap[layer_index][key_index];
                    break;
                }
                layer_index -= 1;
            }
            return pressed_key_def;
        }
        fn warn(comptime msg: []const u8, args: anytype) void {
            _ = msg;
            _ = args;
            //std.log.warn(msg, args);
        }
    };
}

const LC = 0x00E0;
const LS = 0x00E1;
const LA = 0x00E2;
const LG = 0x00E3;
const RC = 0x00E4;
const RS = 0x00E5;
const RA = 0x00E6;
const RG = 0x00E7;

const KeyReleaseAction = union(enum) {
    None,
    ReleaseTap: core.TapDef,
    ReleaseHold: core.HoldDef,
};
