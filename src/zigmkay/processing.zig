const std = @import("std");
const core = @import("core.zig");

pub fn CreateProcessorType(comptime keymap_dimensions: core.KeymapDimensions) type {
    return struct {
        const Self = @This();
        layers_activations: core.LayerActivations = .{},

        // release_map is used to keep track of what to do when a key is released as the layer activations may have changed since is was pressed
        var release_map: [28]KeyReleaseAction = [_]KeyReleaseAction{KeyReleaseAction.None} ** 28;

        // The currently activated modifiers
        var modifiers: core.Modifiers = .{};

        pub fn Process(
            self: *Self,
            keymap: *const [keymap_dimensions.layer_count][keymap_dimensions.key_count]core.KeyDef,
            input: *core.MatrixStateChangeQueue,
            output_queue: *core.OutputCommandQueue,
            current_time: core.TimeSinceBoot,
        ) !void {
            _ = current_time;
            // todo: hold-support
            // todo: take layouts into concideration here
            // todo: combo support
            //
            // idea: decide tap / hold / undecisive (wait some more)
            while (input.Count() > 0) {
                const next_event = try input.dequeue();
                if (next_event.pressed) {

                    // Find key on active position
                    var pressed_key_def = keymap[0][next_event.key_index];

                    var layer_index: usize = @as(usize, keymap_dimensions.layer_count - 1);
                    while (layer_index > 0) {
                        //std.log.warn("\ntesting: {}\n", .{layer_index});
                        // transparent support: ...
                        if (self.layers_activations.is_layer_active(layer_index) and keymap[layer_index][next_event.key_index] != core.KeyDef.transparent) {
                            pressed_key_def = keymap[layer_index][next_event.key_index];
                            //std.log.warn("\nfound: {}\n", .{layer_index});
                            break;
                        }
                        layer_index -= 1;
                    }
                    switch (pressed_key_def) {
                        .tap_only => |tap| {
                            const uses_modifiers = tap.tap_modifiers != null;
                            if (uses_modifiers) {
                                // temporarily apply the modifiers on the key def and then switch back to the current modifiers afterwards
                                try output_queue.enqueue(.{ .ModifiersChanged = tap.tap_modifiers.? });
                                try output_queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
                                try output_queue.enqueue(.{ .KeyCodeRelease = tap.tap_keycode });
                                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
                            } else {
                                release_map[next_event.key_index] = KeyReleaseAction{ .ReleaseTap = tap };
                                try output_queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
                            }
                        },
                        .hold_only => |hold| {
                            if (hold.hold_modifiers != null) {
                                // Apply the hold modifier(s)
                                modifiers = modifiers.add(hold.hold_modifiers.?);
                                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
                            }
                            if (hold.hold_layer != null) {
                                self.layers_activations.activate(hold.hold_layer.?);
                            }

                            release_map[next_event.key_index] = KeyReleaseAction{ .ReleaseHold = hold };
                        },
                        .tap_hold => |tap_and_hold| {
                            _ = tap_and_hold;
                        },
                        .transparent => {},
                        .none => {},
                    }
                } else {
                    // in special cases, tapping is all done at press time, hence no release action (eg when a key should be tapped with a modifier applied to it)
                    switch (release_map[next_event.key_index]) {
                        .None => {},
                        .ReleaseTap => |tap_def| {
                            try output_queue.enqueue(core.OutputCommand{ .KeyCodeRelease = tap_def.tap_keycode });
                            release_map[next_event.key_index] = KeyReleaseAction.None;
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
                            release_map[next_event.key_index] = KeyReleaseAction.None;
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
