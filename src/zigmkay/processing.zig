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
    var modifiers: core.Modifiers = .{};
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
        while (input.Count() > 0) {
            const next_event = try input.dequeue();
            const current_layer_index: usize = 0;
            const key_def = keymap[current_layer_index][next_event.key_index];
            const uses_modifiers = !key_def.tap_modifiers.empty();
            if (next_event.pressed) {
                if (uses_modifiers) {
                    try output_queue.enqueue(core.OutputCommand{ .ModifiersChanged = key_def.tap_modifiers });
                }
                try output_queue.enqueue(core.OutputCommand{ .KeyCodePress = key_def.tap_keycode });
                if (uses_modifiers) {
                    try output_queue.enqueue(core.OutputCommand{ .KeyCodeRelease = key_def.tap_keycode });
                    try output_queue.enqueue(core.OutputCommand{ .ModifiersChanged = modifiers });
                }
            } else {
                // TODO:
                // key_def should not be read from the layout but be the exact key that was pressed to ensure a layer switch
                // between press and release will still trigger releasing of the original key and not the one on the new layer
                if (!uses_modifiers) {
                    try output_queue.enqueue(core.OutputCommand{ .KeyCodeRelease = key_def.tap_keycode });
                }
            }
        }
    }
};
