const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const TestObjects = struct {
    keyboard_change_queue: core.KeyboardStateChangeQueue,
    actions_queue: core.OutputCommandQueue,
    processor: zigmkay.processing.Processor,
};
fn init_test() TestObjects {
    return TestObjects{
        .keyboard_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create(),
        .actions_queue = zigmkay.core.OutputCommandQueue.Create(),
        .processor = zigmkay.processing.CreateProcessor(),
    };
}
// test stuff
test "tapping - single key press" {
    var o = init_test();

    const base_layer = [_]core.KeyDef{ A, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(1, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "tapping - single key release" {
    var o = init_test();

    const base_layer = [_]core.KeyDef{ A, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue);

    try std.testing.expectEqual(1, o.actions_queue.Count()); // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count()); // expect event removed from input_events
}

test "tapping - multiple simple tap events" {
    var o = init_test();
    const base_layer = [_]core.KeyDef{ A, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(5, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "tapping - with modifiers - single key press" {
    var o = init_test();

    const shiftedA = core.KeyDef.TAP_WITH_MOD(0x04, .{ .left_shift = true });
    const base_layer = [_]core.KeyDef{ shiftedA, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    // define some input events
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(4, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = 0x04 }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = 0x04 }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "tapping - with tap modifiers - with other key pressed between press and release" {
    var o = init_test();

    const shiftedA = core.KeyDef.TAP_WITH_MOD(0x04, .{ .left_shift = true });
    const normalB = core.KeyDef.TAP(0x05);
    const base_layer = [_]core.KeyDef{ shiftedA, normalB, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 }); // Press A + shift
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 }); // Press B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 }); // Release A + shift
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 }); // Release B

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(6, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = A.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = A.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = B.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = B.tap_keycode }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "hold mod - single hold" {
    var o = init_test();

    const hold_left_shift = core.KeyDef.HOLD_MOD(core.Modifiers{ .left_shift = true });
    const base_layer = [_]core.KeyDef{ hold_left_shift, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 }); // Press left shift
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 }); // Press B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 }); // Release B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 }); // Release left shift

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = B.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = B.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "hold mod - multiple hold mods at the same time" {
    var o = init_test();

    const hold_left_shift = core.KeyDef.HOLD_MOD(core.Modifiers{ .left_shift = true });
    const hold_left_alt = core.KeyDef.HOLD_MOD(core.Modifiers{ .left_alt = true });
    const base_layer = [_]core.KeyDef{ hold_left_shift, hold_left_alt, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 }); // Press left shift
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 }); // Press left alt
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 }); // Press C
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 2 }); // Release C
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 }); // Release left shift first (to mix things up)
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 }); // Release left alt

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true, .left_alt = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = C.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = C.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_alt = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "hold mod - combined with modified taps - ensure tap mods will be applied temporarily and then cancelled again after the tap while hold mods are kept" {
    var o = init_test();

    const c_with_left_gui = core.KeyDef.TAP_WITH_MOD(0x06, .{ .left_gui = true });
    const hold_left_shift = core.KeyDef.HOLD_MOD(core.Modifiers{ .left_shift = true });
    const hold_left_alt = core.KeyDef.HOLD_MOD(core.Modifiers{ .left_alt = true });
    const base_layer = [_]core.KeyDef{ hold_left_shift, hold_left_alt, c_with_left_gui, D, E };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 }); // Press left shift
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 }); // Press left alt
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 3 }); // Press D
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 3 }); // Release D

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 }); // Press gui+C
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 2 }); // Release gui+C

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 4 }); // Press E
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 4 }); // Release E

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 }); // Release left alt
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 }); // Release left shift

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true, .left_alt = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = D.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = D.tap_keycode }, try o.actions_queue.dequeue());

    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_gui = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = C.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = C.tap_keycode }, try o.actions_queue.dequeue());

    // now expect shifting back to previous mods
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true, .left_alt = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = E.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = E.tap_keycode }, try o.actions_queue.dequeue());

    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

const a = 0x04;
const b = 0x05;
const c = 0x06;
const d = 0x07;
const e = 0x08;
const A = core.KeyDef.TAP(a);
const B = core.KeyDef.TAP(b);
const C = core.KeyDef.TAP(c);
const D = core.KeyDef.TAP(d);
const E = core.KeyDef.TAP(e);

const dummy_time = core.TimeStamp{ .time_us_since_boot = 0 };
