const std = @import("std");
const core = @import("core.zig");

pub fn CreateProcessorType(
    comptime keymap_dimensions: core.KeymapDimensions,
    comptime keymap: *const [keymap_dimensions.layer_count][keymap_dimensions.key_count]core.KeyDef,
    comptime combos: []const core.Combo2Def,
    comptime custom: *const core.CustomFunctions,
) type {
    return struct {
        const Self = @This();
        layers_activations: core.LayerActivations = .{},

        // release_map is used to keep track of what to do when a key is released as the layer activations may have changed since is was pressed
        var release_map: [28]ReleaseMapEntry = [_]ReleaseMapEntry{ReleaseMapEntry.None} ** 28;

        // The currently activated modifiers
        var modifiers: core.Modifiers = .{};
        var previous_matrix_change: core.MatrixStateChange = undefined;

        var current_autofire: ?core.AutoFireDef = null;
        var next_autofire_trigger_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(0);

        var action_id: u64 = 0;
        pub fn Process(
            self: *Self,
            input_matrix_changes: *core.MatrixStateChangeQueue,
            output_usb_commands: *core.OutputCommandQueue,
            current_time: core.TimeSinceBoot,
        ) !void {
            while (true) {
                switch (try process_next(self, input_matrix_changes, output_usb_commands, current_time)) {
                    .DequeueAndRunAgain => |dequeue_info| {
                        action_id += 1;
                        try input_matrix_changes.dequeue_count(dequeue_info.dequeue_count);
                    },
                    .Stop => break,
                }
            }

            while (ProcessContinuation.DequeueAndRunAgain == try process_next(self, input_matrix_changes, output_usb_commands, current_time)) {}

            if (current_autofire) |autofire| {
                if (next_autofire_trigger_time.time_since_boot_us < current_time.time_since_boot_us) {
                    const unused_event = core.MatrixStateChange{ .pressed = false, .time = current_time, .key_index = 200 };
                    try apply_tap(autofire.tap, unused_event, output_usb_commands, TapReleaseMode.ForceInstant);
                    next_autofire_trigger_time = next_autofire_trigger_time.add(autofire.repeat_interval);
                }
            }
        }

        const ProcessContinuation = union(enum) {
            DequeueAndRunAgain: struct { dequeue_count: u8 },
            Stop,
        };

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
            current_autofire = null; // any press or release cancels any previous autofire
            if (head_event.pressed) {
                var head_key_def: core.KeyDef = undefined;
                var dequeue_count: u2 = undefined;
                if (decide_combo_or_single(self, data, current_time)) |res| {
                    head_key_def = res.key_def;
                    dequeue_count = res.consumed_event_count;
                } else {
                    return ProcessContinuation.Stop;
                }

                switch (head_key_def) {
                    .transparent => return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } }, // only happening if the base layer has a transparent key
                    .none => return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } },
                    .tap_only => |tap| {
                        try apply_tap(tap, head_event, output_usb_commands, TapReleaseMode.AwaitKeyReleased);

                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                    },
                    .tap_with_autofire => |tap_with_autofire| {
                        try apply_tap(tap_with_autofire.tap, head_event, output_usb_commands, TapReleaseMode.ForceInstant);
                        current_autofire = tap_with_autofire;
                        next_autofire_trigger_time = current_time.add(tap_with_autofire.initial_delay);
                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                    },
                    .hold_only => |hold| {
                        try apply_hold(self, hold, head_key_def, head_event, output_usb_commands);

                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                    },
                    .tap_hold => |tap_and_hold| {
                        for (data[dequeue_count..], dequeue_count..) |outer_ev, outer_index| {
                            if (outer_ev.time.time_since_boot_us < head_event.time.time_since_boot_us) {
                                @panic("this should never happen!");
                            }
                            const tapping_term_expired = outer_ev.time.time_since_boot_us > head_event.time.add(tap_and_hold.tapping_term).time_since_boot_us;
                            if (tapping_term_expired) {
                                try apply_hold(self, tap_and_hold.hold, head_key_def, head_event, output_usb_commands);
                                return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                            }

                            const key_was_released = !outer_ev.pressed;
                            if (key_was_released) {
                                // if released key was the pressed one, choose tap
                                if (outer_ev.key_index == head_event.key_index) {
                                    try apply_tap(tap_and_hold.tap, head_event, output_usb_commands, TapReleaseMode.AwaitKeyReleased);
                                    return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                                }
                                // if the key released was pressed before the head key, we are in a rolling writing mode, hence choose tap
                                var released_key_was_pressed_after_head = false;
                                for (data[dequeue_count..outer_index]) |inner_ev| {
                                    if (inner_ev.key_index == outer_ev.key_index) {
                                        released_key_was_pressed_after_head = true;
                                    }
                                }

                                if (released_key_was_pressed_after_head) {
                                    try apply_hold(self, tap_and_hold.hold, head_key_def, head_event, output_usb_commands);
                                    return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                                } else {
                                    try apply_tap(tap_and_hold.tap, head_event, output_usb_commands, TapReleaseMode.AwaitKeyReleased);
                                    return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                                }
                            }
                        }

                        // No decision made while looping through all events, finally check if time just passed without anything happened
                        // In this case, it's a hold.
                        const tapping_term_expired = current_time.time_since_boot_us > head_event.time.add(tap_and_hold.tapping_term).time_since_boot_us;
                        if (tapping_term_expired) {
                            try apply_hold(self, tap_and_hold.hold, head_key_def, head_event, output_usb_commands);
                            return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                        }

                        return ProcessContinuation.Stop;
                    },
                }
            } else {
                // handle release
                // in special cases, tapping is all done at press time, hence no release action (eg when a key should be tapped with a modifier applied to it)
                switch (release_map[head_event.key_index]) {
                    .None => {
                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = 1 } };
                    },
                    .Release => |release_info| {
                        switch (release_info.release_action) {
                            .ReleaseTap => |tap_def| {
                                try output_usb_commands.enqueue(core.OutputCommand{ .KeyCodeRelease = tap_def.tap_keycode });
                                release_map[head_event.key_index] = ReleaseMapEntry.None;
                                return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = 1 } };
                            },
                            .ReleaseHold => |hold_def| {
                                const hold = hold_def.hold;
                                if (hold.hold_modifiers != null) {
                                    // Cancel the hold modifier(s)
                                    modifiers = modifiers.remove(hold.hold_modifiers.?);
                                    try output_usb_commands.enqueue(.{ .ModifiersChanged = modifiers });
                                }
                                if (hold.hold_layer != null) {
                                    self.layers_activations.deactivate(hold.hold_layer.?);
                                }
                                release_map[head_event.key_index] = ReleaseMapEntry.None;

                                if (release_info.action_id_when_pressed == action_id - 1) {
                                    if (hold_def.retro_tap) |tap| {
                                        try apply_tap(tap, head_event, output_usb_commands, TapReleaseMode.ForceInstant);
                                    }
                                }
                                if (custom.on_hold_exit) |func| func(&self.layers_activations);
                                return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = 1 } };
                            },
                        }
                    },
                }
            }
        }

        fn decide_combo_or_single(self: *Self, data: []core.MatrixStateChange, current_time: core.TimeSinceBoot) ?NextKeyFindResult {

            //var combo: ?core.Combo2Def = null;
            const head_event = data[0];
            if (data.len > 1 and data[1].pressed == false) {
                // next key is not a press - no cases will ever return in a combo then
                return NextKeyFindResult{ .key_def = determine_key_def(self, head_event.key_index), .consumed_event_count = 1 };
            }

            const next_event_time: core.TimeSinceBoot = (if (data.len > 1) data[1].time else current_time);
            const time_elapsed_ms = (next_event_time.time_since_boot_us - head_event.time.time_since_boot_us) / 1000;

            for (combos) |combo_to_test| {
                if (!self.layers_activations.is_layer_active(combo_to_test.layer)) {
                    continue; // this combo's layers is not active
                }
                if (combo_to_test.timeout.ms < time_elapsed_ms) {
                    continue; // This combo has timed out
                }
                if (combo_to_test.key_indexes[0] != head_event.key_index and combo_to_test.key_indexes[1] != head_event.key_index) {
                    continue; // head not part of this combo
                }
                if (data.len > 1) {
                    const next_key_index = data[1];
                    if (combo_to_test.key_indexes[0] != next_key_index.key_index and combo_to_test.key_indexes[1] != next_key_index.key_index) {
                        continue; // Next event is not part of this combo
                    }

                    return NextKeyFindResult{ .key_def = combo_to_test.key_def, .consumed_event_count = 2 };
                } else {
                    // there are no more events - but this combo could be relevant
                    return null;
                }
            }

            return NextKeyFindResult{ .key_def = determine_key_def(self, head_event.key_index), .consumed_event_count = 1 };
        }

        const TapReleaseMode = enum { ForceInstant, AwaitKeyReleased };
        fn apply_tap(tap: core.TapDef, event: core.MatrixStateChange, output_queue: *core.OutputCommandQueue, release_mode: TapReleaseMode) !void {
            // features:
            //      modifiers must be changeable
            //      layers must be changeable
            //      firing key_presses and key_releases should be possible
            //      running code on ticks

            if (tap.tap_keycode == core.special_keycode_BOOT) {
                try output_queue.enqueue(core.OutputCommand.ActivateBootMode);
                return;
            }

            if (tap.tap_modifiers) |tap_modifiers| {
                // temporarily apply the modifiers on the key def and then switch back to the current modifiers afterwards
                try output_queue.enqueue(.{ .ModifiersChanged = tap_modifiers });
                try output_queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
                try output_queue.enqueue(.{ .KeyCodeRelease = tap.tap_keycode });
                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
            } else {
                try output_queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
                switch (release_mode) {
                    .AwaitKeyReleased => {
                        release_map[event.key_index] = .{
                            .Release = .{
                                .release_action = KeyReleaseAction{ .ReleaseTap = tap },
                                .action_id_when_pressed = action_id,
                            },
                        };
                    },
                    .ForceInstant => {
                        try output_queue.enqueue(.{ .KeyCodeRelease = tap.tap_keycode });
                    },
                }
            }
        }

        fn apply_hold(self: *Self, hold: core.HoldDef, key_def: core.KeyDef, event: core.MatrixStateChange, output_queue: *core.OutputCommandQueue) !void {
            warn("hold applied", .{});
            if (hold.hold_modifiers != null) {
                // Apply the hold modifier(s)
                modifiers = modifiers.add(hold.hold_modifiers.?);
                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
            }
            if (hold.hold_layer != null) {
                self.layers_activations.activate(hold.hold_layer.?);
            }

            var retro_tap: ?core.TapDef = null;
            switch (key_def) {
                .tap_hold => |tap_hold| {
                    if (tap_hold.retro_tapping) {
                        retro_tap = tap_hold.tap;
                    }
                },
                else => {},
            }
            release_map[event.key_index] = .{
                .Release = .{
                    .release_action = KeyReleaseAction{ .ReleaseHold = .{ .hold = hold, .retro_tap = retro_tap } },
                    .action_id_when_pressed = action_id,
                },
            };

            if (custom.on_hold_enter) |func| func(&self.layers_activations);
        }

        fn determine_key_def(self: *Self, key_index: usize) core.KeyDef {
            // Find key on active position
            var pressed_key_def = keymap[0][key_index]; // Start out picking the key from the base layer

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
    ReleaseTap: core.TapDef,
    ReleaseHold: struct { hold: core.HoldDef, retro_tap: ?core.TapDef },
};
const ReleaseMapEntry = union(enum) {
    Release: struct {
        action_id_when_pressed: u64,
        release_action: KeyReleaseAction,
    },
    None,
};
const NextKeyFindResult = struct {
    key_def: core.KeyDef,
    consumed_event_count: u2,
};
const ComboDecision = union(enum) {
    SingleKey: core.KeyDef,
    Undecided,
    Combo: core.KeyDef,
};
