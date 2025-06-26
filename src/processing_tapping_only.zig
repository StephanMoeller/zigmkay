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
    const input_ev = [_]core.InputEvent{.{ .key_pressed = 1 }};
    const keymap = [_][KeyCount]core.KeyDef{.{ A, B, C, D }};

    const actions = core.Process(input_ev, keymap);
    try std.testing.expectEqual(actions.len, 1);
}
