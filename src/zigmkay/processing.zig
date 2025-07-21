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

        fn apply_tap(tap: core.TapDef, event: core.MatrixStateChange, output_queue: *core.OutputCommandQueue) !void {
            const uses_modifiers = tap.tap_modifiers != null;
            if (uses_modifiers) {
                // temporarily apply the modifiers on the key def and then switch back to the current modifiers afterwards
                try output_queue.enqueue(.{ .ModifiersChanged = tap.tap_modifiers.? });
                try output_queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
                try output_queue.enqueue(.{ .KeyCodeRelease = tap.tap_keycode });
                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
            } else {
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
                //std.log.warn("\ntesting: {}\n", .{layer_index});
                // transparent support: ...
                if (self.layers_activations.is_layer_active(layer_index) and keymap[layer_index][key_index] != core.KeyDef.transparent) {
                    pressed_key_def = keymap[layer_index][key_index];
                    //std.log.warn("\nfound: {}\n", .{layer_index});
                    break;
                }
                layer_index -= 1;
            }
            return pressed_key_def;
        }
        pub fn Process(
            self: *Self,
            input: *core.MatrixStateChangeQueue,
            output_queue: *core.OutputCommandQueue,
            current_time: core.TimeSinceBoot,
        ) !void {
            // todo: hold-support
            // todo: take layouts into concideration here
            // todo: combo support
            //
            // idea: decide tap / hold / undecisive (wait some more)
            while (input.Count() > 0) {
                const current_event = try input.dequeue();
                if (current_event.pressed) {
                    const pressed_key_def = determine_key_def(self, current_event.key_index);
                    switch (pressed_key_def) {
                        .tap_only => |tap| {
                            try apply_tap(tap, current_event, output_queue);
                        },
                        .hold_only => |hold| {
                            try apply_hold(self, hold, current_event, output_queue);
                        },
                        .tap_hold => |tap_and_hold| {
                            const data = input.peek_all();

                            const next_event_time: core.TimeSinceBoot = if (data.len > 0) data[0].time else current_time;
                            const tapping_term_exceeded: bool = next_event_time - current_event.time > tap_and_hold.tapping_term_ms;

                            if (tapping_term_exceeded) {
                                try apply_hold(self, tap_and_hold.hold, current_event, output_queue);
                            }
                        },
                        .transparent => {},
                        .none => {},
                    }
                } else {
                    // in special cases, tapping is all done at press time, hence no release action (eg when a key should be tapped with a modifier applied to it)
                    switch (release_map[current_event.key_index]) {
                        .None => {},
                        .ReleaseTap => |tap_def| {
                            try output_queue.enqueue(core.OutputCommand{ .KeyCodeRelease = tap_def.tap_keycode });
                            release_map[current_event.key_index] = KeyReleaseAction.None;
                        },
                        .ReleaseHold => |hold_def| {
                            if (hold_def.hold_modifiers != null) {
                                // Cancel the hold modifier(s)
                                modifiers = modifiers.remove(hold_def.hold_modifiers.?);
                                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
                            }
                            if (hold_def.hold_layer != null) {
                                self.layers_activations.deactivate(hold_def.hold_layer.?);
                            }
                            release_map[current_event.key_index] = KeyReleaseAction.None;
                        },
                    }
                    // TODO:
                    // key_def should not be read from the layout but be the exact key that was pressed to ensure a layer switch
                    // between press and release will still trigger releasing of the original key and not the one on the new layer
                }
            }
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
