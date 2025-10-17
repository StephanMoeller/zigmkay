const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const helpers = @import("processing.test_helpers.zig");

const a = 4;
const b = 5;
const A = helpers.TAP(a);
const B = helpers.TAP(b);

test "Sides A: Permissive hold within timeout - tap on same side: expect tap chosen" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const tapping_term: core.TimeSpan = .{ .ms = 250 };

    const A_shift = comptime helpers.MT(core.TapDef{ .key_press = .{ .tap_keycode = a } }, .{ .left_shift = true }, tapping_term);

    const base_layer = comptime [_]core.KeyDef{ A_shift, B };
    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};
    const dim = core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len };
    const sides: [dim.key_count]core.Side = .{ .L, .L };
    var o = helpers.init_test_with_sides(dim, &keymap, sides){};

    try o.press_key(0, current_time);
    current_time = current_time.add_ms(10); // within tapping term
    try o.press_key(1, current_time);
    current_time = current_time.add_ms(10); // within tapping term
    try o.release_key(1, current_time);
    current_time = current_time.add_ms(10); // within tapping term
    try o.release_key(0, current_time);
    try o.process(current_time);

    // expect A pressed as no layer switch is expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
test "Sides B: Permissive hold within timeout - tap on opposite side: expect hold chosen" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const tapping_term: core.TimeSpan = .{ .ms = 250 };

    const A_shift = comptime helpers.MT(core.TapDef{ .key_press = .{ .tap_keycode = a } }, .{ .left_shift = true }, tapping_term);

    const base_layer = comptime [_]core.KeyDef{ A_shift, B };
    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};
    const dim = core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len };
    const sides: [dim.key_count]core.Side = .{ .L, .R };
    var o = helpers.init_test_with_sides(dim, &keymap, sides){};

    try o.press_key(0, current_time);
    current_time = current_time.add_ms(10); // within tapping term
    try o.press_key(1, current_time);
    current_time = current_time.add_ms(10); // within tapping term
    try o.release_key(1, current_time);
    current_time = current_time.add_ms(10); // within tapping term
    try o.release_key(0, current_time);
    try o.process(current_time);

    // expect A pressed as no layer switch is expected
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
test "Sides C: Permissive hold within timeout - tap on X side: expect hold chosen" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const tapping_term: core.TimeSpan = .{ .ms = 250 };

    const A_shift = comptime helpers.MT(core.TapDef{ .key_press = .{ .tap_keycode = a } }, .{ .left_shift = true }, tapping_term);

    const base_layer = comptime [_]core.KeyDef{ A_shift, B };
    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};
    const dim = core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len };
    const sides: [dim.key_count]core.Side = .{ .L, .X };
    var o = helpers.init_test_with_sides(dim, &keymap, sides){};

    try o.press_key(0, current_time);
    current_time = current_time.add_ms(10); // within tapping term
    try o.press_key(1, current_time);
    current_time = current_time.add_ms(10); // within tapping term
    try o.release_key(1, current_time);
    current_time = current_time.add_ms(10); // within tapping term
    try o.release_key(0, current_time);
    try o.process(current_time);

    // expect A pressed as no layer switch is expected
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
//test "Sides: Permissive hold on X side - tap on L, R and X side: expect hold chosen" {}
//test "Sides: Permissive hold with timeout - L, R and X sides: expect hold executed" {}
