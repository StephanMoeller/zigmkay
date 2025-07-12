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
            if (next_event.pressed) {
                const pressed_key_def = keymap[current_layer_index][next_event.key_index];
                if (pressed_key_def.tap_keycode == 1) {
                    try output_queue.enqueue(.{ .ModifiersChanged = .{ .left_shift = true } });
                    try output_queue.enqueue(.{ .KeyCodePress = 4 });
                    try output_queue.enqueue(.{ .KeyCodeRelease = 4 });
                    try output_queue.enqueue(.{ .ModifiersChanged = .{ .left_shift = false } });
                    try output_queue.enqueue(.{ .KeyCodePress = 5 });
                    try output_queue.enqueue(.{ .KeyCodeRelease = 5 });
                    try output_queue.enqueue(.{ .ModifiersChanged = .{ .left_shift = true } });
                    try output_queue.enqueue(.{ .KeyCodePress = 4 });
                    try output_queue.enqueue(.{ .KeyCodeRelease = 4 });
                    try output_queue.enqueue(.{ .ModifiersChanged = .{ .left_shift = false } });
                    try output_queue.enqueue(.{ .KeyCodePress = 5 });
                    try output_queue.enqueue(.{ .KeyCodeRelease = 5 });
                    try output_queue.enqueue(.{ .ModifiersChanged = .{ .left_shift = true } });
                    try output_queue.enqueue(.{ .KeyCodePress = 4 });
                    try output_queue.enqueue(.{ .KeyCodeRelease = 4 });
                    try output_queue.enqueue(.{ .ModifiersChanged = .{ .left_shift = false } });
                    try output_queue.enqueue(.{ .KeyCodePress = 5 });
                    try output_queue.enqueue(.{ .KeyCodeRelease = 5 });
                    try output_queue.enqueue(.{ .ModifiersChanged = .{ .left_shift = true } });
                    try output_queue.enqueue(.{ .KeyCodePress = 4 });
                    try output_queue.enqueue(.{ .KeyCodeRelease = 4 });
                    try output_queue.enqueue(.{ .ModifiersChanged = .{ .left_shift = false } });
                    try output_queue.enqueue(.{ .KeyCodePress = 5 });
                    try output_queue.enqueue(.{ .KeyCodeRelease = 5 });
                    try output_queue.enqueue(.{ .KeyCodePress = 0x0028 });
                    try output_queue.enqueue(.{ .KeyCodeRelease = 0x0028 });
                    continue;
                }
                const uses_modifiers = !pressed_key_def.tap_modifiers.empty();
                if (uses_modifiers) {
                    try output_queue.enqueue(.{ .ModifiersChanged = pressed_key_def.tap_modifiers });
                } else {
                    release_map[next_event.key_index] = pressed_key_def;
                }
                try output_queue.enqueue(.{ .KeyCodePress = pressed_key_def.tap_keycode });
                if (uses_modifiers) {
                    try output_queue.enqueue(.{ .KeyCodeRelease = pressed_key_def.tap_keycode });
                    try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
                }
            } else {
                const released_key = release_map[next_event.key_index];
                if (released_key != null) {
                    try output_queue.enqueue(core.OutputCommand{ .KeyCodeRelease = released_key.?.tap_keycode });
                    release_map[next_event.key_index] = null;
                }
                // TODO:
                // key_def should not be read from the layout but be the exact key that was pressed to ensure a layer switch
                // between press and release will still trigger releasing of the original key and not the one on the new layer
            }
        }
    }
};
