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
test "activate, key1, key2" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const combo_timeout = core.TimeSpan{ .ms = 30 };

    const base_layer = comptime [_]core.KeyDef{ A, B, C };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };
    const combos = comptime [_]core.Combo2Def{.{ .key_indexes = .{ 1, 2 }, .layer = 0, .timeout = combo_timeout, .key_def = G }};

    var o = init_test_with_combos(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap, &combos){};
    try o.press_key(1, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(0, o.actions_queue.Count());

    current_time = current_time.add_ms(combo_timeout.ms - 1); // pressed within timeout
    try o.press_key(2, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = g }, try o.actions_queue.dequeue());

    try std.testing.expectEqual(0, o.actions_queue.Count());

    // ensure nothing happens when releasing second key
    current_time = current_time.add_us(1);
    try o.release_key(2, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(0, o.actions_queue.Count());

    // ensure released when releasing first key
    current_time = current_time.add_us(1);
    try o.release_key(1, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = g }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
test "different layer from current" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const combo_timeout = core.TimeSpan{ .ms = 30 };

    const base_layer = comptime [_]core.KeyDef{ A, B, C };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };
    const combos = comptime [_]core.Combo2Def{.{ .key_indexes = .{ 1, 2 }, .layer = 1, .timeout = combo_timeout, .key_def = G }};

    var o = init_test_with_combos(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap, &combos){};
    try o.press_key(1, current_time);
    try o.press_key(0, current_time);
    try o.press_key(2, current_time);

    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());

    try o.release_key(1, current_time);
    try o.release_key(0, current_time);
    try o.release_key(2, current_time);

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}

test "activate, key2, key1" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const combo_timeout = core.TimeSpan{ .ms = 30 };

    const base_layer = comptime [_]core.KeyDef{ A, B, C };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };
    const combos = comptime [_]core.Combo2Def{.{ .key_indexes = .{ 1, 2 }, .layer = 0, .timeout = combo_timeout, .key_def = G }};

    var o = init_test_with_combos(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap, &combos){};
    try o.press_key(2, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(0, o.actions_queue.Count());
    current_time = current_time.add_ms(25);
    try o.press_key(1, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = g }, try o.actions_queue.dequeue());

    try std.testing.expectEqual(0, o.actions_queue.Count());

    // ensure nothing happens when releasing second key
    current_time = current_time.add_us(1);
    try o.release_key(1, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(0, o.actions_queue.Count());

    // ensure released when releasing first key
    current_time = current_time.add_us(1);
    try o.release_key(2, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = g }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}

test "tap-only: key1 timeout" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const combo_timeout = core.TimeSpan{ .ms = 30 };

    const base_layer = comptime [_]core.KeyDef{ A, B, C };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };
    const combos = comptime [_]core.Combo2Def{.{ .key_indexes = .{ 1, 2 }, .layer = 0, .timeout = combo_timeout, .key_def = G }};

    var o = init_test_with_combos(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap, &combos){};
    try o.press_key(1, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(0, o.actions_queue.Count());

    current_time = current_time.add_ms(combo_timeout.ms + 1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());

    try o.release_key(1, current_time);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
test "key2 timeout" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const combo_timeout = core.TimeSpan{ .ms = 30 };

    const base_layer = comptime [_]core.KeyDef{ A, B, C };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };
    const combos = comptime [_]core.Combo2Def{.{ .key_indexes = .{ 1, 2 }, .layer = 0, .timeout = combo_timeout, .key_def = G }};

    var o = init_test_with_combos(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap, &combos){};
    try o.press_key(2, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(0, o.actions_queue.Count());

    current_time = current_time.add_ms(combo_timeout.ms + 1); // pressed within timeout
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());

    try o.release_key(2, current_time);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
test "other key inbetween" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const combo_timeout = core.TimeSpan{ .ms = 30 };

    const base_layer = comptime [_]core.KeyDef{ A, B, C };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };
    const combos = comptime [_]core.Combo2Def{.{ .key_indexes = .{ 1, 2 }, .layer = 0, .timeout = combo_timeout, .key_def = G }};

    var o = init_test_with_combos(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap, &combos){};
    try o.press_key(1, current_time);
    try o.press_key(0, current_time);
    try o.press_key(2, current_time);

    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());

    current_time = current_time.add_ms(combo_timeout.ms + 1); // this will timeout the press of the last key, c
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());

    try o.release_key(1, current_time);
    try o.release_key(0, current_time);
    try o.release_key(2, current_time);

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());

    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
test "activate with tap/hold on one of the keys, key1, key2" {
    var current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    const combo_timeout = core.TimeSpan{ .ms = 30 };

    const a_shift = comptime helpers.MT(core.TapDef{ .tap_keycode = a }, .{ .left_shift = true }, .{ .ms = 150 });
    const b_shift = comptime helpers.MT(core.TapDef{ .tap_keycode = b }, .{ .left_shift = true }, .{ .ms = 150 });
    const c_shift = comptime helpers.MT(core.TapDef{ .tap_keycode = c }, .{ .left_shift = true }, .{ .ms = 150 });
    const base_layer = comptime [_]core.KeyDef{ a_shift, b_shift, c_shift };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };
    const combos = comptime [_]core.Combo2Def{.{ .key_indexes = .{ 1, 2 }, .layer = 0, .timeout = combo_timeout, .key_def = G }};

    var o = init_test_with_combos(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap, &combos){};
    try o.press_key(1, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(0, o.actions_queue.Count());

    current_time = current_time.add_ms(combo_timeout.ms - 1); // pressed within timeout
    try o.press_key(2, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = g }, try o.actions_queue.dequeue());

    try std.testing.expectEqual(0, o.actions_queue.Count());

    // ensure nothing happens when releasing second key
    current_time = current_time.add_us(1);
    try o.release_key(2, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(0, o.actions_queue.Count());

    // ensure released when releasing first key
    current_time = current_time.add_us(1);
    try o.release_key(1, current_time);
    current_time = current_time.add_us(1);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = g }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
