const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const helpers = @import("processing.test_helpers.zig");
const init_test = helpers.init_test;

const a = 0x04;
const b = 0x05;
const c = 0x06;
const d = 0x07;
const e = 0x08;
const f = 0x09;
const g = 0x10;

const A = helpers.TAP(a);
const B = helpers.TAP(b);
const C = helpers.TAP(c);
const D = helpers.TAP(d);
const E = helpers.TAP(e);
const F = helpers.TAP(f);
const G = helpers.TAP(g);
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
    const _a = comptime helpers.MT(core.TapDef{ .tap_keycode = a }, .{ .left_shift = true }, tapping_term);
    const _b = comptime helpers.MT(core.TapDef{ .tap_keycode = b }, .{ .left_shift = true }, tapping_term);
    const _c = comptime helpers.MT(core.TapDef{ .tap_keycode = c }, .{ .left_shift = true }, tapping_term);
    const _d = comptime helpers.MT(core.TapDef{ .tap_keycode = d }, .{ .left_shift = true }, tapping_term);

    const base_layer = comptime [_]core.KeyDef{ _a, _b, _c, _d };

    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};

    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};
    try o.press_key(0, 1);
    try o.press_key(1, 2);
    try o.release_key(0, 3);
    try o.press_key(2, 4);
    try o.release_key(1, 5);
    try o.press_key(3, 6);
    try o.release_key(2, 7);
    try o.release_key(3, 8);

    const current_time: core.TimeSinceBoot = 100;
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

test "Rolling - with sudden shift usage" {
    // This test is supposed to spell out abCda with rolling behaviour combined with
    const tapping_term: u64 = 250;
    const key_a = comptime helpers.MT(core.TapDef{ .tap_keycode = a }, .{}, tapping_term);
    const key_b = comptime helpers.MT(core.TapDef{ .tap_keycode = b }, .{}, tapping_term);
    const key_c = comptime helpers.MT(core.TapDef{ .tap_keycode = c }, .{}, tapping_term);
    const key_d = comptime helpers.MT(core.TapDef{ .tap_keycode = d }, .{}, tapping_term);
    const key_e = comptime helpers.MT(core.TapDef{ .tap_keycode = e }, .{ .left_shift = true }, tapping_term);

    const base_layer = comptime [_]core.KeyDef{ key_a, key_b, key_c, key_d, key_e };

    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};

    // intexes
    const _a = 0;
    const _b = 1;
    const _c = 2;
    const _d = 3;
    const _e_with_shift = 4;

    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};
    try o.press_key(_a, 1);
    try o.press_key(_b, 2);
    try o.release_key(_a, 3);
    try o.release_key(_b, 5);
    try o.press_key(_e_with_shift, 4);
    try o.press_key(_c, 6);
    try o.release_key(_c, 7);
    try o.release_key(_e_with_shift, 8);
    try o.press_key(_d, 9);
    try o.press_key(_a, 10);
    try o.release_key(_d, 11);
    try o.release_key(_a, 12);

    const current_time: core.TimeSinceBoot = 100;
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = d }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = d }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
}
