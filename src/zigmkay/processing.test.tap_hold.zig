const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const init_test = @import("processing.test_helpers.zig").init_test;
test "MT tap within tapping term - no modifier on tap" {
    var current_time: core.TimeSinceBoot = 100;
    const tapping_terms_ms: u16 = 250;
    const mo_layer1_cWithLeftAlt = comptime core.KeyDef.MT(core.TapDef{ .tap_keycode = c, .tap_modifiers = null }, core.HoldDef{ .hold_modifiers = .{ .left_shift = true } }, tapping_terms_ms);

    const base_layer = comptime [_]core.KeyDef{ mo_layer1_cWithLeftAlt, B, A };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };

    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};
    // Ensure nothing happens at first press when the key has multiple functions (both tap and hold)
    try o.press_key(0, current_time);

    // Now ensure that a tap will happen when releasing within tapping term
    current_time += 10; // within tapping term
    try o.release_key(0, current_time);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);

    // expect A pressed as no layer switch is expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}

test "MT hold case: release after tapping term => hold" {
    var current_time: core.TimeSinceBoot = 100;
    const tapping_terms_ms: u16 = 250;
    const mo_layer1_cWithLeftAlt = comptime core.KeyDef.MT(core.TapDef{ .tap_keycode = c, .tap_modifiers = null }, core.HoldDef{ .hold_modifiers = .{ .left_shift = true } }, tapping_terms_ms);

    const base_layer = comptime [_]core.KeyDef{ mo_layer1_cWithLeftAlt, B, A };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };

    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};
    // Ensure nothing happens at first press when the key has multiple functions (both tap and hold)
    try o.press_key(0, current_time);

    // Now ensure that a tap will happen when releasing within tapping term
    current_time += tapping_terms_ms + 1; // within tapping term
    try o.release_key(0, current_time);

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);

    // expect A pressed as no layer switch is expected
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_alt = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}

test "MT hold case: timeout => hold" {
    var current_time: core.TimeSinceBoot = 100;
    const tapping_terms_ms: u16 = 250;
    const mo_layer1_cWithLeftAlt = comptime core.KeyDef.MT(core.TapDef{ .tap_keycode = c, .tap_modifiers = null }, core.HoldDef{ .hold_modifiers = .{ .left_shift = true } }, tapping_terms_ms);

    const base_layer = comptime [_]core.KeyDef{ mo_layer1_cWithLeftAlt, B, A };
    const layer_1 = comptime [_]core.KeyDef{ D, E, F };
    const keymap = comptime [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };

    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};
    // Ensure nothing happens at first press when the key has multiple functions (both tap and hold)
    try o.press_key(0, current_time);

    // Now ensure that a tap will happen when releasing within tapping term
    current_time += tapping_terms_ms + 1; // within tapping term

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);

    // expect A pressed as no layer switch is expected
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_alt = true } }, try o.actions_queue.dequeue());
    //try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}

test "tap/hold mod - case: tap" {
    // Tap and release within tapping term
}

test "tap/hold layer - case: hold" {
    // Tap and release within tapping term
}
test "tap/hold mod - case: hold" {
    // Tap and release within tapping term
}
const a = 0x04;
const b = 0x05;
const c = 0x06;
const d = 0x07;
const e = 0x08;
const f = 0x09;
const g = 0x10;

const A = core.KeyDef.TAP(a);
const B = core.KeyDef.TAP(b);
const C = core.KeyDef.TAP(c);
const D = core.KeyDef.TAP(d);
const E = core.KeyDef.TAP(e);
const F = core.KeyDef.TAP(f);
const G = core.KeyDef.TAP(g);

const dummy_time = core.TimeStamp{ .time_us_since_boot = 0 };
