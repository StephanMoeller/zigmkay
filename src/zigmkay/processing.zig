const std = @import("std");
const core = @import("core.zig");

pub fn CreateProcessor() Processor {
    return Processor{};
}

const LC = 0x00E0;
const LS = 0x00E1;
const LA = 0x00E2;
const LG = 0x00E3;
const RC = 0x00E4;
const RS = 0x00E5;
const RA = 0x00E6;
const RG = 0x00E7;

pub const Processor = struct {
    KeyCount: usize = 0,
    var release_map: [28]?core.KeyDef = [_]?core.KeyDef{null} ** 28;
    var modifiers: core.Modifiers = .{};
    var layers: core.LayerActivations = .{};
    var previous_key: core.KeyDef = .{};

    pub fn Process(
        self: Processor,
        comptime KeyCount: usize,
        comptime LayerCount: usize,
        keymap: *const [LayerCount][KeyCount]core.KeyDef,
        input: *core.KeyboardStateChangeQueue,
        output_queue: *core.OutputCommandQueue,
    ) !void {
        _ = self;
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
                var layer_index: usize = @as(usize, LayerCount - 1);
                while (layer_index > 0) {
                    //            std.log.warn("\ntesting: {}\n", .{layer_index});
                    if (layers.is_layer_active(layer_index)) {
                        pressed_key_def = keymap[layer_index][next_event.key_index];

                        //              std.log.warn("\nfound: {}\n", .{layer_index});
                        break;
                    }
                    layer_index -= 1;
                }

                if (pressed_key_def.has_tap()) {
                    const uses_modifiers = pressed_key_def.tap_modifiers != null;
                    if (uses_modifiers) {
                        // temporarily apply the modifiers on the key def and then switch back to the current modifiers afterwards
                        try output_queue.enqueue(.{ .ModifiersChanged = pressed_key_def.tap_modifiers.? });
                        try output_queue.enqueue(.{ .KeyCodePress = pressed_key_def.tap_keycode });
                        try output_queue.enqueue(.{ .KeyCodeRelease = pressed_key_def.tap_keycode });
                        try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
                    } else {
                        release_map[next_event.key_index] = pressed_key_def;
                        try output_queue.enqueue(.{ .KeyCodePress = pressed_key_def.tap_keycode });
                    }
                }
                if (pressed_key_def.has_hold()) {
                    if (pressed_key_def.hold_modifiers != null) {
                        // Apply the hold modifier(s)
                        modifiers = modifiers.add(pressed_key_def.hold_modifiers.?);
                        try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
                    }
                    if (pressed_key_def.hold_layer != null) {
                        layers.activate(pressed_key_def.hold_layer.?);
                    }

                    release_map[next_event.key_index] = pressed_key_def;
                }
            } else {
                const released_key = release_map[next_event.key_index];
                if (released_key != null) { // in special cases, tapping is all done at press time, hence no release action (eg when a key should be tapped with a modifier applied to it)
                    release_map[next_event.key_index] = null;
                    if (released_key.?.has_tap()) {
                        try output_queue.enqueue(core.OutputCommand{ .KeyCodeRelease = released_key.?.tap_keycode });
                    }
                    if (released_key.?.has_hold()) {
                        if (released_key.?.hold_modifiers != null) {
                            // Cancel the hold modifier(s)
                            modifiers = modifiers.remove(released_key.?.hold_modifiers.?);
                            try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
                        }
                        if (released_key.?.hold_layer != null) {
                            layers.deactivate(released_key.?.hold_layer.?);
                        }
                    }
                }
                // TODO:
                // key_def should not be read from the layout but be the exact key that was pressed to ensure a layer switch
                // between press and release will still trigger releasing of the original key and not the one on the new layer
            }
        }
    }
};
