const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const helpers = @import("processing.test_helpers.zig");
const init_test_with_combos = helpers.init_test_with_combos;

const a = 4;
const b = 5;
const c = 6;
const d = 7;
const e = 8;
const f = 9;
const g = 10;
const h = 11;
const i = 12;

const A = helpers.TAP(a);
const B = helpers.TAP(b);
const C = helpers.TAP(c);
const D = helpers.TAP(d);
const E = helpers.TAP(e);
const F = helpers.TAP(f);
const G = helpers.TAP(g);
const H = helpers.TAP(h);
const I = helpers.TAP(i);
test "combo is hold/tap: combo released fast => tap" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const combo_timeout = core.TimeSpan{ .ms = 30 };

    const combos = comptime [_]core.Combo2Def{.{
        .key_indexes = .{ 1, 2 },
        .layer = 0,
        .timeout = combo_timeout,
        .key_def = helpers.MT(core.TapDef{ .tap_keycode = h }, .{ .left_shift = true }, .{ .ms = 150 }),
    }};
    const base_layer = comptime [_]core.KeyDef{ A, B, C };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };

    var o = init_test_with_combos(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap, &combos){};
    try o.press_key(1, current_time);
    try o.press_key(2, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    current_time = current_time.add_ms(140);
    try o.release_key(1, current_time);

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = h }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = h }, try o.actions_queue.dequeue());

    try std.testing.expectEqual(0, o.actions_queue.Count());
}

test "combo is hold/tap: combo released slowly => hold" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const combo_timeout = core.TimeSpan{ .ms = 30 };

    const combos = comptime [_]core.Combo2Def{.{
        .key_indexes = .{ 1, 2 },
        .layer = 0,
        .timeout = combo_timeout,
        .key_def = helpers.MT(core.TapDef{ .tap_keycode = h }, .{ .left_shift = true }, .{ .ms = 150 }),
    }};
    const base_layer = comptime [_]core.KeyDef{ A, B, C };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };

    var o = init_test_with_combos(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap, &combos){};
    try o.press_key(1, current_time);
    current_time = current_time.add_us(1);
    try o.press_key(2, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    current_time = current_time.add_ms(160);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try o.release_key(1, current_time);
    try o.release_key(2, current_time);

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());

    try std.testing.expectEqual(0, o.actions_queue.Count());
}
