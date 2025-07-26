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
test "Autofire" {
    const current_time: core.TimeSinceBoot = 100;
    const base_layer = comptime [_]core.KeyDef{ A, B, C, D };
    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};
    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};
    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });

    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(1, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
    try std.testing.expectEqual(0, 1); // todo
}
