const std = @import("std");
const core = @import("core.zig");
const stats_collector = @import("stats_collector.zig");

pub fn CreateProcessorType(
    comptime keymap_dimensions: core.KeymapDimensions,
    comptime keymap: *const [keymap_dimensions.layer_count][keymap_dimensions.key_count]core.KeyDef,
    comptime sides: [keymap_dimensions.key_count]core.Side,
    comptime combos: []const core.Combo2Def,
    comptime custom: *const core.CustomFunctions,
) type {
    _ = sides;
    return struct {
        const Self = @This();

        input_matrix_changes: *core.MatrixStateChangeQueue,
        output_usb_commands: *core.OutputCommandQueue,

        layers_activations: core.LayerActivations = .{},
        stats: stats_collector.StatsCollector = .{},
        release_map: [keymap_dimensions.key_count]ReleaseMapEntry = [_]ReleaseMapEntry{ReleaseMapEntry.None} ** keymap_dimensions.key_count,
        current_autofire: ?core.AutoFireDef = null,
        current_autofire_key_index: core.KeyIndex = 0,
        next_autofire_trigger_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(0),
        current_action_id: u64 = 0,

        one_shot_hold_to_enable_before_next_tap: ?core.HoldDef = null,
        one_shot_hold_to_disable_after_next_release: ?core.HoldDef = null,

        pub fn Process(self: *Self, current_time: core.TimeSinceBoot) !void {
            _ = self.stats.register_tick(current_time);
            on_event(self, core.ProcessorEvent.Tick);

            while (true) {
                const data: []core.MatrixStateChange = self.input_matrix_changes.peek_all()[0..];
                switch (try process_next(self, data, current_time)) {
                    .DequeueAndRunAgain => |dequeue_info| {
                        try self.input_matrix_changes.dequeue_count(dequeue_info.dequeue_count);
                    },
                    .Stop => break,
                }
            }

            try tick_autofire(self, current_time);
        }

        fn process_next(self: *Self, data: []core.MatrixStateChange, current_time: core.TimeSinceBoot) !ProcessContinuation {
            self.current_action_id += 1;
            if (data.len == 0) {
                return ProcessContinuation.Stop;
            }

            const head_event = data[0];
            check_stop_autofire(self, head_event);
            if (head_event.pressed) {
                const next_key_info = decide_next_combo_or_single(self, data, current_time) catch {
                    return ProcessContinuation.Stop;
                };

                switch (next_key_info.key_def) {
                    .transparent => return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = next_key_info.consumed_event_count } }, // only happening if the base layer has a transparent key
                    .none => return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = next_key_info.consumed_event_count } },
                    .tap_only => |tap| {
                        try on_tap_decided(self, tap, head_event, TapReleaseMode.AwaitKeyReleased);
                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = next_key_info.consumed_event_count } };
                    },
                    .tap_with_autofire => |tap_with_autofire| {
                        try on_tap_decided(self, tap_with_autofire.tap, head_event, TapReleaseMode.ForceInstant);
                        activate_autofire(self, tap_with_autofire, head_event, current_time);
                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = next_key_info.consumed_event_count } };
                    },
                    .hold_only => |hold| {
                        try on_hold_decided(self, hold, next_key_info.key_def, head_event);
                        return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = next_key_info.consumed_event_count } };
                    },
                    .tap_hold => |tap_and_hold| {
                        const tail = data[next_key_info.consumed_event_count..];

                        // Iterate tail
                        for (tail, 0..) |ev, outer_idx| {

                            // Exceeding tapping term?
                            if (try head_event.time.up_til_ms(&ev.time) >= tap_and_hold.tapping_term.ms) {
                                try on_hold_decided(self, tap_and_hold.hold, next_key_info.key_def, head_event);
                                return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = next_key_info.consumed_event_count } };
                            }

                            if (ev.pressed) {
                                continue; // More pressed keys should not trigger anything
                            }

                            // Permissive hold?
                            for (tail[0..outer_idx]) |earlier_event| {
                                const press_and_release_same_key_detected = earlier_event.key_index == ev.key_index and earlier_event.pressed;
                                if (press_and_release_same_key_detected) {
                                    try on_hold_decided(self, tap_and_hold.hold, next_key_info.key_def, head_event);
                                    return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = next_key_info.consumed_event_count } };
                                }
                            }

                            // Same key released within tapping term?
                            if (ev.key_index == head_event.key_index) {
                                try on_tap_decided(self, tap_and_hold.tap, head_event, TapReleaseMode.AwaitKeyReleased);
                                return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = next_key_info.consumed_event_count } };
                            }
                        }

                        // Exceeding tapping term?
                        if (try head_event.time.up_til_ms(&current_time) >= tap_and_hold.tapping_term.ms) {
                            try on_hold_decided(self, tap_and_hold.hold, next_key_info.key_def, head_event);
                            return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = next_key_info.consumed_event_count } };
                        }

                        return ProcessContinuation.Stop;
                    },
                }
            } else {
                // Next key is released
                switch (self.release_map[head_event.key_index]) {
                    .None => {},
                    .Release => |release_info| {
                        switch (release_info.release_action) {
                            .ReleaseTap => |tap| {
                                if (tap.key_press) |keycode_fire| {
                                    warn("releasing tap {}", .{keycode_fire.tap_keycode});
                                    on_event(self, .{ .OnTapExitBefore = .{ .tap = tap } });
                                    try self.output_usb_commands.release_key(keycode_fire);
                                    self.release_map[head_event.key_index] = ReleaseMapEntry.None;
                                    on_event(self, .{ .OnTapExitAfter = .{ .tap = tap } });
                                }
                            },
                            .ReleaseHold => |hold_def| {
                                on_event(self, .{ .OnHoldExitBefore = .{ .hold = hold_def.hold } });

                                try hold_remove_modifiers_and_layers(self, hold_def.hold);

                                if (release_info.action_id_when_pressed == self.current_action_id - 1) {
                                    if (hold_def.retro_tap) |tap| {
                                        try on_tap_decided(self, tap, head_event, TapReleaseMode.ForceInstant);
                                    }
                                }

                                self.release_map[head_event.key_index] = ReleaseMapEntry.None;
                                on_event(self, .{ .OnHoldExitAfter = .{ .hold = hold_def.hold } });
                            },
                        }
                    },
                }

                if (self.one_shot_hold_to_disable_after_next_release) |hold| {
                    try hold_remove_modifiers_and_layers(self, hold);
                    self.one_shot_hold_to_disable_after_next_release = null;
                }

                return ProcessContinuation{ .DequeueAndRunAgain = .{ .dequeue_count = 1 } }; // always only consuming one key release at at time
            }
        }

        const NextFindError = error{NotPossibleToDetermine};
        fn decide_next_combo_or_single(self: *Self, data: []core.MatrixStateChange, current_time: core.TimeSinceBoot) NextFindError!NextKeyFindResult {
            const head_event = data[0];
            if (data.len > 1 and data[1].pressed == false) {
                // next key is not a press - no cases will ever return in a combo then
                return NextKeyFindResult{ .key_def = determine_key_def(self, head_event.key_index), .consumed_event_count = 1 };
            }

            const next_event_time: core.TimeSinceBoot = (if (data.len > 1) data[1].time else current_time);
            const time_elapsed_ms = (next_event_time.time_since_boot_us - head_event.time.time_since_boot_us) / 1000;

            for (combos) |combo_to_test| {
                if (self.layers_activations.get_top_most_active_layer() != combo_to_test.layer) {
                    continue; // this combo's layers is not active
                }
                if (time_elapsed_ms > combo_to_test.timeout.ms) {
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
                    return NextFindError.NotPossibleToDetermine;
                }
            }

            return NextKeyFindResult{ .key_def = determine_key_def(self, head_event.key_index), .consumed_event_count = 1 };
        }

        const TapReleaseMode = enum { ForceInstant, AwaitKeyReleased };

        fn enter_tap(self: *Self, keycode_fire: core.KeyCodeFire) !void {
            if (keycode_fire.tap_keycode == core.special_keycode_BOOT) {
                try self.output_usb_commands.go_to_boot_mode();
                return;
            }
            if (keycode_fire.tap_keycode == core.special_keycode_PRINT_STATS) {
                const max_len = 2000;
                var buf: [max_len]u8 = undefined;
                const numAsString = try std.fmt.bufPrint(&buf, "SCANRATE lowest {} highest {} ", .{ self.stats.get_lowest_count(), self.stats.get_highest_count() });
                try self.output_usb_commands.print_string(numAsString);
                return;
            }
        }
        fn on_tap_decided(self: *Self, tap: core.TapDef, event: core.MatrixStateChange, release_mode: TapReleaseMode) !void {
            on_event(self, .{ .OnTapEnterBefore = .{ .tap = tap } });
            if (self.one_shot_hold_to_enable_before_next_tap) |hold| {
                try hold_apply_modifiers_and_layers(self, hold);
                self.one_shot_hold_to_disable_after_next_release = self.one_shot_hold_to_enable_before_next_tap;
                self.one_shot_hold_to_enable_before_next_tap = null;
            }
            if (tap.key_press) |keycode_fire| {
                try enter_tap(self, keycode_fire);
                switch (release_mode) {
                    .AwaitKeyReleased => {
                        try self.output_usb_commands.press_key(keycode_fire);
                        self.release_map[event.key_index] = .{
                            .Release = .{
                                .release_action = KeyReleaseAction{ .ReleaseTap = tap },
                                .action_id_when_pressed = self.current_action_id,
                            },
                        };
                    },
                    .ForceInstant => {
                        try self.output_usb_commands.tap_key(keycode_fire);
                    },
                }
            }
            if (tap.one_shot) |one_shot_hold| {
                self.one_shot_hold_to_enable_before_next_tap = one_shot_hold;
            }
            on_event(self, .{ .OnTapEnterAfter = .{ .tap = tap } });
        }

        fn hold_remove_modifiers_and_layers(self: *Self, hold: core.HoldDef) !void {
            if (hold.hold_modifiers != null) {
                // Cancel the hold modifier(s)
                var modifiers = self.output_usb_commands.get_current_modifiers();
                modifiers = modifiers.remove(hold.hold_modifiers.?);
                try self.output_usb_commands.set_mods(modifiers);
            }
            if (hold.hold_layer != null) {
                self.layers_activations.deactivate(hold.hold_layer.?);
            }
        }
        fn hold_apply_modifiers_and_layers(self: *Self, hold: core.HoldDef) !void {
            if (hold.hold_modifiers != null) {
                // Apply the hold modifier(s)
                var modifiers = self.output_usb_commands.get_current_modifiers();
                modifiers = modifiers.add(hold.hold_modifiers.?);
                try self.output_usb_commands.set_mods(modifiers);
            }
            if (hold.hold_layer != null) {
                self.layers_activations.activate(hold.hold_layer.?);
            }
        }

        fn on_hold_decided(self: *Self, hold: core.HoldDef, key_def: core.KeyDef, event: core.MatrixStateChange) !void {
            on_event(self, .{ .OnHoldEnterBefore = .{ .hold = hold } });
            try hold_apply_modifiers_and_layers(self, hold);

            var retro_tap: ?core.TapDef = null;
            switch (key_def) {
                .tap_hold => |tap_hold| {
                    if (tap_hold.retro_tapping) {
                        retro_tap = tap_hold.tap;
                    }
                },
                else => {},
            }
            self.release_map[event.key_index] = .{
                .Release = .{
                    .release_action = KeyReleaseAction{ .ReleaseHold = .{ .hold = hold, .retro_tap = retro_tap } },
                    .action_id_when_pressed = self.current_action_id,
                },
            };
            on_event(self, .{ .OnHoldEnterAfter = .{ .hold = hold } });
        }

        fn determine_key_def(self: *Self, key_index: usize) core.KeyDef {
            // Find key on active position
            var pressed_key_def = keymap[0][key_index]; // Start out picking the key from the base layer

            var layer_index: core.LayerIndex = keymap_dimensions.layer_count - 1;
            while (layer_index > 0) {
                // transparent support: ...
                if (self.layers_activations.is_layer_active(layer_index) and keymap[layer_index][key_index] != core.KeyDef.transparent) {
                    pressed_key_def = keymap[@as(usize, layer_index)][key_index];
                    break;
                }
                layer_index -= 1;
            }
            return pressed_key_def;
        }

        // AUTOFIRE START
        fn activate_autofire(self: *Self, tap_with_autofire: core.AutoFireDef, head_event: core.MatrixStateChange, current_time: core.TimeSinceBoot) void {
            self.current_autofire = tap_with_autofire;
            self.current_autofire_key_index = head_event.key_index;
            self.next_autofire_trigger_time = current_time.add(tap_with_autofire.initial_delay);
        }

        fn tick_autofire(self: *Self, current_time: core.TimeSinceBoot) !void {
            if (self.current_autofire) |autofire| {
                if (self.next_autofire_trigger_time.time_since_boot_us < current_time.time_since_boot_us) {
                    const unused_event = core.MatrixStateChange{ .pressed = false, .time = current_time, .key_index = 0 };
                    try on_tap_decided(self, autofire.tap, unused_event, TapReleaseMode.ForceInstant);
                    self.next_autofire_trigger_time = self.next_autofire_trigger_time.add(autofire.repeat_interval);
                }
            }
        }

        fn check_stop_autofire(self: *Self, head_event: core.MatrixStateChange) void {
            // check to se if autofire key was released
            if (self.current_autofire != null and self.current_autofire_key_index == head_event.key_index and head_event.pressed == false) {
                self.current_autofire = null;
            }
        }
        // AUTOFIRE END

        fn on_event(self: *Self, event: core.ProcessorEvent) void {
            custom.on_event(event, &self.layers_activations, self.output_usb_commands);
        }

        fn warn(comptime msg: []const u8, args: anytype) void {
            _ = msg;
            _ = args;
            //std.log.warn(msg, args);
        }
    };
}
const ProcessContinuation = union(enum) {
    DequeueAndRunAgain: struct { dequeue_count: u8 },
    Stop,
};
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
