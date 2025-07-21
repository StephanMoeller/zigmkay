const std = @import("std");
const core = @import("core.zig");

pub fn CreateProcessorType(comptime keymap_dimensions: core.KeymapDimensions, comptime keymap: *const [keymap_dimensions.layer_count][keymap_dimensions.key_count]core.KeyDef) type {
    return struct {
        const Self = @This();
        layers_activations: core.LayerActivations = .{},
        current_undecided_matrix_change_or_null: ?core.MatrixStateChange = null,

        // release_map is used to keep track of what to do when a key is released as the layer activations may have changed since is was pressed
        var release_map: [28]KeyReleaseAction = [_]KeyReleaseAction{KeyReleaseAction.None} ** 28;

        // The currently activated modifiers
        var modifiers: core.Modifiers = .{};

        pub fn Process(
            self: *Self,
            input_matrix_changes: *core.MatrixStateChangeQueue,
            output_usb_commands: *core.OutputCommandQueue,
            current_time: core.TimeSinceBoot,
        ) !void {
            // This flow is designed to ensure it won't matter if one call Process once with a full queue or multiple times with single or no items in the queue.
            // This decreases the number of test combinations required to be run.
            while (input_matrix_changes.Count() > 0) {
                const next_change = try input_matrix_changes.dequeue();
                try time_elapsed(self, next_change.time, output_usb_commands);
                try self.process_one(next_change, output_usb_commands);
            }
            try time_elapsed(self, current_time, output_usb_commands);
        }

        fn time_elapsed(self: *Self, current_time: core.TimeSinceBoot, output_usb_commands: *core.OutputCommandQueue) !void {
            if (self.current_undecided_matrix_change_or_null) |current_undecided_matrix_change| {
                const pending_key_def = determine_key_def(self, current_undecided_matrix_change.key_index);
                if (current_time - current_undecided_matrix_change.time > pending_key_def.tap_hold.tapping_term_ms) {
                    // Pressed, timeout => hold
                    self.current_undecided_matrix_change_or_null = null;
                    try apply_hold(self, pending_key_def.tap_hold.hold, current_undecided_matrix_change, output_usb_commands);
                }
            }
        }
        fn process_one(self: *Self, current_event: core.MatrixStateChange, output_usb_commands: *core.OutputCommandQueue) !void {
            // todo: hold-support
            // todo: take layouts into concideration here
            // todo: combo support
            //
            // Handle any pending if exists
            if (self.current_undecided_matrix_change_or_null) |pending_change| {
                self.current_undecided_matrix_change_or_null = null; // currently it is expected to all pending to be decided when the next even happens but later it may take a list of events to really decide the final action
                if (pending_change.pressed and current_event.pressed == false and pending_change.key_index == current_event.key_index) {
                    // same key has been released => tap
                    const pending_key_def = determine_key_def(self, pending_change.key_index);
                    try apply_tap(pending_key_def.tap_hold.tap, current_event, output_usb_commands);
                } else {
                    // all other cases currently also trigger a tap but is isolated in this code for the above logic to remain as it is a known case
                    const pending_key_def = determine_key_def(self, pending_change.key_index);
                    try apply_tap(pending_key_def.tap_hold.tap, current_event, output_usb_commands);
                }
            }

            // Handle new event
            if (current_event.pressed) {
                const pressed_key_def = determine_key_def(self, current_event.key_index);
                switch (pressed_key_def) {
                    .tap_only => |tap| {
                        try apply_tap(tap, current_event, output_usb_commands);
                    },
                    .hold_only => |hold| {
                        try apply_hold(self, hold, current_event, output_usb_commands);
                    },
                    .tap_hold => |tap_and_hold| {
                        _ = tap_and_hold;
                        self.current_undecided_matrix_change_or_null = current_event;
                    },
                    .transparent => {},
                    .none => {},
                }
            } else {
                warn("1 released");
                // in special cases, tapping is all done at press time, hence no release action (eg when a key should be tapped with a modifier applied to it)
                switch (release_map[current_event.key_index]) {
                    .None => {
                        warn("1 released c");
                    },
                    .ReleaseTap => |tap_def| {
                        warn("1 released a");
                        try output_usb_commands.enqueue(core.OutputCommand{ .KeyCodeRelease = tap_def.tap_keycode });
                        release_map[current_event.key_index] = KeyReleaseAction.None;
                    },
                    .ReleaseHold => |hold_def| {
                        warn("1 released B");
                        if (hold_def.hold_modifiers != null) {
                            // Cancel the hold modifier(s)
                            modifiers = modifiers.remove(hold_def.hold_modifiers.?);
                            try output_usb_commands.enqueue(.{ .ModifiersChanged = modifiers });
                        }
                        if (hold_def.hold_layer != null) {
                            self.layers_activations.deactivate(hold_def.hold_layer.?);
                        }
                        release_map[current_event.key_index] = KeyReleaseAction.None;
                    },
                }
            }
        }

        fn apply_tap(tap: core.TapDef, event: core.MatrixStateChange, output_queue: *core.OutputCommandQueue) !void {
            if (tap.tap_modifiers) |tap_modifiers| {
                warn("tap with modifier - all done at once");
                // temporarily apply the modifiers on the key def and then switch back to the current modifiers afterwards
                try output_queue.enqueue(.{ .ModifiersChanged = tap_modifiers });
                try output_queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
                try output_queue.enqueue(.{ .KeyCodeRelease = tap.tap_keycode });
                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
            } else {
                warn("tap with modifier - release set");
                release_map[event.key_index] = KeyReleaseAction{ .ReleaseTap = tap };
                try output_queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
            }
        }
        fn apply_hold(self: *Self, hold: core.HoldDef, event: core.MatrixStateChange, output_queue: *core.OutputCommandQueue) !void {
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
        fn warn(comptime msg: []const u8) void {
            _ = msg;
            //std.log.warn(msg, .{});
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
