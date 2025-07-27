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

const dummy_time = core.TimeStamp{ .time_us_since_boot = 0 };

// test stuff
test "Autofire - case A" {
    // release before start, expect only one
    const auto_fire_a = comptime core.KeyDef{ .tap_with_autofire = .{
        .initial_delay_ms = 1000,
        .repeat_interval_ms = 500,
        .tap = .{ .tap_keycode = a },
    } };
    const auto_fire_b = comptime core.KeyDef{ .tap_with_autofire = .{
        .initial_delay_ms = 1000,
        .repeat_interval_ms = 500,
        .tap = .{ .tap_keycode = a },
    } };

    const start_time_us: core.TimeSinceBoot = 100;
    const base_layer = comptime [_]core.KeyDef{ auto_fire_a, auto_fire_b, C, D };
    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};
    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};

    const key_a_idx = 0;

    try o.press_key(key_a_idx, start_time_us);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 1);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 50);
    try std.testing.expectEqual(0, o.actions_queue.Count());

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 1000); // 1 ms later
    try std.testing.expectEqual(0, o.actions_queue.Count());

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 998 * 1000); // 999 ms later
    try std.testing.expectEqual(0, o.actions_queue.Count());

    // Now release the key - and expect no autofire
    try o.release_key(key_a_idx, start_time_us + 999 + 1000);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 1001 * 1000); // 1001 ms later
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 2000 * 1000); // 2000 ms later

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
}

test "Autofire - case B" {
    // holding down and activating autofire
    const auto_fire_a = comptime core.KeyDef{ .tap_with_autofire = .{
        .initial_delay_ms = 1000,
        .repeat_interval_ms = 500,
        .tap = .{ .tap_keycode = a },
    } };
    const auto_fire_b = comptime core.KeyDef{ .tap_with_autofire = .{
        .initial_delay_ms = 1000,
        .repeat_interval_ms = 500,
        .tap = .{ .tap_keycode = a },
    } };
    const start_time_us: core.TimeSinceBoot = 100;
    const base_layer = comptime [_]core.KeyDef{ auto_fire_a, auto_fire_b, C, D };
    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};
    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};

    const key_a_idx = 0;

    try o.press_key(key_a_idx, start_time_us);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 1000); // 1 ms later
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 999 * 1000); // 999 ms later
    try std.testing.expectEqual(0, o.actions_queue.Count());

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 1001 * 1000);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 1499 * 1000);
    try std.testing.expectEqual(0, o.actions_queue.Count());

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 1501 * 1000);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    try o.release_key(key_a_idx, start_time_us + 1800);

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 1801);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 2020);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 5000);
    try std.testing.expectEqual(0, o.actions_queue.Count());
}

test "Autofire - case C" {
    // holding down and activating autofire, pressing another autofire key - expect new key to autofire
    const auto_fire_a = comptime core.KeyDef{ .tap_with_autofire = .{
        .initial_delay_ms = 1000,
        .repeat_interval_ms = 500,
        .tap = .{ .tap_keycode = a },
    } };
    const auto_fire_b = comptime core.KeyDef{ .tap_with_autofire = .{
        .initial_delay_ms = 1000,
        .repeat_interval_ms = 500,
        .tap = .{ .tap_keycode = b },
    } };

    const start_time_us: core.TimeSinceBoot = 100;
    const base_layer = comptime [_]core.KeyDef{ auto_fire_a, auto_fire_b, C, D };
    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};
    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};

    const key_a_idx = 0;
    const key_b_idx = 1;

    try o.press_key(key_a_idx, start_time_us);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 1000); // 1 ms later
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 999 * 1000); // 999 ms later
    try std.testing.expectEqual(0, o.actions_queue.Count());

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 1001 * 1000);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    try o.press_key(key_b_idx, start_time_us + 2200);

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 2201 * 1000);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 3199 * 1000);
    try std.testing.expectEqual(0, o.actions_queue.Count());

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 3202 * 1000);
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());

    try o.release_key(key_b_idx, start_time_us + 1800);
    try o.release_key(key_a_idx, start_time_us + 5000);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, start_time_us + 5000 * 1000);

    try std.testing.expectEqual(0, o.actions_queue.Count());
}
