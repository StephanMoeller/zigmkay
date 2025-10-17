const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const helpers = @import("processing.test_helpers.zig");
const init_test = helpers.init_test;

const a = 4;
const b = 5;
const c = 6;
const d = 7;
const e = 8;
const f = 9;
const g = 10;

const A = helpers.TAP(a);
const B = helpers.TAP(b);
const C = helpers.TAP(c);
const D = helpers.TAP(d);
const E = helpers.TAP(e);
const F = helpers.TAP(f);
const G = helpers.TAP(g);
test "Permissive hold within timeout - tap on same side: expect tap chosen over hold" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const tapping_term: core.TimeSpan = .{ .ms = 250 };

    const A_shift = comptime helpers.MT(core.TapDef{ .key_press = .{ .tap_keycode = a } }, .{ .left_shift = true }, tapping_term);

    const base_layer = comptime [_]core.KeyDef{ A_shift, B, C };
    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};
    const dim = core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len };
    const sides = [dim.key_count]core.Side;
    var o = init_test(dim, &keymap){};
    // Ensure nothing happens at first press when the key has multiple functions (both tap and hold)
    try o.press_key(0, current_time);

    // Now ensure that a tap will happen when releasing within tapping term
    current_time = current_time.add_us(10); // within tapping term
    try o.release_key(0, current_time);
    try o.process(current_time);

    // expect A pressed as no layer switch is expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
test "Permissive hold within timeout - tap on opposite side: expect hold chosen over hold" {}
test "Permissive hold within timeout - tap on X side: expect hold chosen over hold" {}
test "Permissive hold on X side - tap on L, R and X side: expect hold chosen over hold" {}
test "Permissive hold with timeout - L, R and X sides: expect hold executed" {}
