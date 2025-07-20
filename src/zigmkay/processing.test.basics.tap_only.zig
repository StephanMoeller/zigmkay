const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const TestObjects = struct {
    matrix_change_queue: core.MatrixStateChangeQueue,
    actions_queue: core.OutputCommandQueue,
    processor: zigmkay.processing.Processor,
};
fn init_test() TestObjects {
    return TestObjects{
        .matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create(),
        .actions_queue = zigmkay.core.OutputCommandQueue.Create(),
        .processor = zigmkay.processing.CreateProcessor(),
    };
}
// test stuff
test "TAP - single key press" {
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const base_layer = [_]core.KeyDef{ A, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.matrix_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(1, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
}

test "TAP - single key release" {
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const base_layer = [_]core.KeyDef{ A, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.matrix_change_queue, &o.actions_queue, current_time);

    try std.testing.expectEqual(1, o.actions_queue.Count()); // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
}

test "TAP - multiple simple tap events" {
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const base_layer = [_]core.KeyDef{ A, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });
    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 });
    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.matrix_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(5, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
}

test "TAP_WITH_MOD - single key press" {
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const shiftedA = core.KeyDef.TAP_WITH_MOD(0x04, .{ .left_shift = true });
    const base_layer = [_]core.KeyDef{ shiftedA, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    // define some input events
    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.matrix_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(4, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = 0x04 }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = 0x04 }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
}

test "TAP_WITH_MOD - with other keys" {
    // with other keys pressed between press and release
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const shiftedA = core.KeyDef.TAP_WITH_MOD(0x04, .{ .left_shift = true });
    const normalB = core.KeyDef.TAP(0x05);
    const base_layer = [_]core.KeyDef{ shiftedA, normalB, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 }); // Press A + shift
    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 }); // Press B
    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 }); // Release A + shift
    try o.matrix_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 }); // Release B

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.matrix_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(6, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
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
