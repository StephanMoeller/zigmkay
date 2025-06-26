const std = @import("std");
const core = @import("core.zig");

test "tapping - single layer, only tapping defined" {
    const a = 0x04;
    const b = 0x05;
    const c = 0x06;
    const d = 0x07;
    const A = core.TapOnly(a);
    const B = core.TapOnly(b);
    const C = core.TapOnly(c);
    const D = core.TapOnly(d);

    const KeyCount = 4;
    const LayerCount = 1;
    var input_ev = [_]core.InputEvent{.{ .key_pressed = 1 }};
    const keymap = [LayerCount][KeyCount]core.KeyDef{.{ A, B, C, D }};

    const actions = core.Process(KeyCount, LayerCount, &keymap, &input_ev[0..]);
    try std.testing.expectEqual(1, actions.len);
    try std.testing.expectEqual(b, actions[0].KeyCodePress);
}
