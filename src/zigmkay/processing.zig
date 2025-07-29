const std = @import("std");
const core = @import("core.zig");

pub fn CreateProcessorType(
    comptime keymap_dimensions: core.KeymapDimensions,
    comptime keymap: *const [keymap_dimensions.layer_count][keymap_dimensions.key_count]core.KeyDef,
    comptime combos: []const core.Combo2Def,
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
                        warn("change count {}", .{input_matrix_changes.peek_all().len});
                        action_id += 1;
                        warn("dequeing {}", .{dequeue_info.dequeue_count});
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
                    next_autofire_trigger_time = next_autofire_trigger_time.add_ms(autofire.repeat_interval_ms);
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
                const combo_result = decide_combo(self, data, current_time);
                warn("combo result: {any}", .{combo_result});
                var head_key_def: core.KeyDef = undefined;
                var next_element_start_index: usize = undefined;
                switch (combo_result) {
                    .Undecided => {
                        return ProcessContinuation.Stop;
                    },
                    .NoCombo => {
                        head_key_def = determine_key_def(self, head_event.key_index);
                        next_element_start_index = 1;
                    },
                    .Combo => |combo| {
                        head_key_def = combo.key_def;
                        next_element_start_index = combo.key_indexes.len;
                        //head_key_def = combo.key_def;
                    },
                }

                const dequeue_count: u8 = @intCast(next_element_start_index);
                // yes:
                //   is the first the only one pressed?
                //   yes:
                //      has any combos that is is part of timed out?
                //      => not combo
                //   no:
                //      was the next key pressed part of a combo with the first key?
                //      yes:
                //          was the next key a press and within the timeout?
                //          => pick combo
                //      no: not combo
                //  no:
                //      => not combo

                //const head_key_def = if (combo != null) combo.key_def else determine_key_def(self, head_event.key_index);

                switch (head_key_def) {
                    .tap_only => |tap| {
                        try apply_tap(tap, head_event, output_usb_commands, TapReleaseMode.AwaitKeyReleased);

                        warn("case 0, dequeue count: {}", .{dequeue_count});
                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                    },
                    .tap_with_autofire => |tap_with_autofire| {
                        try apply_tap(tap_with_autofire.tap, head_event, output_usb_commands, TapReleaseMode.ForceInstant);
                        current_autofire = tap_with_autofire;
                        next_autofire_trigger_time = current_time.add_ms(tap_with_autofire.initial_delay_ms);
                        warn("starting autofire now. Current time: {}, next fire time set to {}, autofire set to {}", .{ current_time, next_autofire_trigger_time, tap_with_autofire.tap.tap_keycode });
                        warn("case 1", .{});
                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                    },
                    .hold_only => |hold| {
                        try apply_hold(self, hold, head_key_def, head_event, output_usb_commands);

                        warn("case 2", .{});
                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                    },
                    .tap_hold => |tap_and_hold| {
                        for (data[next_element_start_index..], next_element_start_index..) |outer_ev, outer_index| {
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
                                    warn("case 0", .{});
                                    try apply_tap(tap_and_hold.tap, head_event, output_usb_commands, TapReleaseMode.AwaitKeyReleased);
                                    return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                                }
                                // if the key released was pressed before the head key, we are in a rolling writing mode, hence choose tap
                                var released_key_was_pressed_after_head = false;
                                for (data[next_element_start_index..outer_index]) |inner_ev| {
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

                        warn("case 2", .{});
                        return ProcessContinuation.Stop;
                    },
                    .transparent => {
                        // only happening if the base layer has a transparent key - in this case handle as none
                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                    },
                    .none => {
                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = dequeue_count } };
                    },
                }
            } else {
                // handle release
                // in special cases, tapping is all done at press time, hence no release action (eg when a key should be tapped with a modifier applied to it)
                switch (release_map[head_event.key_index]) {
                    .None => {
                        warn("no release at {}", .{head_event.key_index});
                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = 1 } };
                    },
                    .Release => |release_info| {
                        switch (release_info.release_action) {
                            .ReleaseTap => |tap_def| {
                                try output_usb_commands.enqueue(core.OutputCommand{ .KeyCodeRelease = tap_def.tap_keycode });
                                release_map[head_event.key_index] = ReleaseMapEntry.None;
                                warn("release tap_def at key index {}", .{head_event.key_index});
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

                                // handle retro tapping
                                // TODO: RETRO on combos - ensure works no matter what key was released first
                                if (release_info.action_id_when_pressed == action_id - 1) {
                                    if (hold_def.retro_tap) |tap| {
                                        try apply_tap(tap, head_event, output_usb_commands, TapReleaseMode.ForceInstant);
                                    }
                                }

                                return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = 1 } };
                            },
                        }
                    },
                }
            }
        }

        fn decide_combo(self: *Self, data: []core.MatrixStateChange, current_time: core.TimeSinceBoot) ComboDecision {
            //var combo: ?core.Combo2Def = null;

            if (data.len > 1 and data[1].pressed == false) {
                warn("combo 1", .{});
                return ComboDecision.NoCombo; // next key is not a press - no cases will ever return in a combo then
            }

            const head_event = data[0];
            const next_event_time: core.TimeSinceBoot = (if (data.len > 1) data[1].time else current_time);
            const time_elapsed_ms = (next_event_time.time_since_boot_us - head_event.time.time_since_boot_us) / 1000;

            for (combos) |combo_to_test| {
                if (!self.layers_activations.is_layer_active(combo_to_test.layer)) {
                    warn("combo a", .{});
                    continue; // this combo's layers is not active
                }
                if (combo_to_test.timeout.ms < time_elapsed_ms) {
                    warn("combo c, time_elapsed_ms: {}, combo to test: {}", .{ time_elapsed_ms, combo_to_test.timeout.ms });
                    continue; // This combo has timed out
                }
                if (combo_to_test.key_indexes[0] != head_event.key_index and combo_to_test.key_indexes[1] != head_event.key_index) {
                    warn("combo b", .{});
                    continue; // head not part of this combo
                }
                if (data.len > 1) {
                    const next_key_index = data[1];
                    if (combo_to_test.key_indexes[0] != next_key_index.key_index and combo_to_test.key_indexes[1] != next_key_index.key_index) {
                        warn("combo d", .{});
                        continue; // Next event is not part of this combo
                    }

                    return ComboDecision{ .Combo = combo_to_test };
                } else {
                    // there are no more events - but this combo could be relevant
                    return ComboDecision{ .Undecided = {} };
                }
            }

            warn("combo 2", .{});
            return ComboDecision.NoCombo;
        }

        const TapReleaseMode = enum { ForceInstant, AwaitKeyReleased };
        fn apply_tap(tap: core.TapDef, event: core.MatrixStateChange, output_queue: *core.OutputCommandQueue, release_mode: TapReleaseMode) !void {
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
const ComboDecision = union(enum) {
    NoCombo,
    Undecided,
    Combo: core.Combo2Def,
};
