const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const init_test = @import("processing.test_helpers.zig").init_test;
// test stuff
test "Rolling - only tap keys" {
    const current_time: core.TimeSinceBoot = 100;
    const base_layer = comptime [_]core.KeyDef{ A, B, C, D };
    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};
    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};

    try o.press_key(0, 1);
    try o.press_key(1, 2);
    try o.release_key(0, 3);
    try o.press_key(2, 4);
    try o.release_key(1, 5);
    try o.press_key(3, 6);
    try o.release_key(2, 5);
    try o.release_key(3, 6);

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = d }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = d }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
}

test "Rolling - tap/hold keys" {
    const tapping_term: u64 = 250;
    const _a = comptime core.KeyDef.MT(core.TapDef{ .tap_keycode = a }, core.HoldDef{ .hold_modifiers = .{ .left_shift = true } }, tapping_term);
    const _b = comptime core.KeyDef.MT(core.TapDef{ .tap_keycode = b }, core.HoldDef{ .hold_modifiers = .{ .left_shift = true } }, tapping_term);
    const _c = comptime core.KeyDef.MT(core.TapDef{ .tap_keycode = c }, core.HoldDef{ .hold_modifiers = .{ .left_shift = true } }, tapping_term);
    const _d = comptime core.KeyDef.MT(core.TapDef{ .tap_keycode = d }, core.HoldDef{ .hold_modifiers = .{ .left_shift = true } }, tapping_term);

    const base_layer = comptime [_]core.KeyDef{ _a, _b, _c, _d };

    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};

    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};
    try o.press_key(0, 1);
    try o.press_key(1, 2);
    try o.release_key(0, 3);
    try o.press_key(2, 4);
    try o.release_key(1, 5);
    try o.press_key(3, 6);
    try o.release_key(2, 5);
    try o.release_key(3, 6);

    const current_time: core.TimeSinceBoot = 100;
    try std.testing.expectEqual(1, 2);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
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
