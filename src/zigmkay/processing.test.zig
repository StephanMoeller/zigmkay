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

    try o.keyboard_change_queue.enqueue(.{ .pressed = true, .key_index = 1 });

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

    try o.keyboard_change_queue.enqueue(.{ .pressed = false, .key_index = 1 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue);

    try std.testing.expectEqual(1, o.actions_queue.Count()); // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count()); // expect event removed from input_events
}

test "tapping - multiple simple tap events" {
    var o = init_test();
    const base_layer = [_]core.KeyDef{ A, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .pressed = false, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .pressed = true, .key_index = 2 });
    try o.keyboard_change_queue.enqueue(.{ .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .pressed = false, .key_index = 0 });

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

    const shiftedA = core.KeyDef{ .tap_keycode = 0x04, .tap_modifiers = core.Modifiers{ .left_shift = true } };
    const base_layer = [_]core.KeyDef{ shiftedA, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    // define some input events
    try o.keyboard_change_queue.enqueue(.{ .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .pressed = false, .key_index = 0 });

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

test "tapping - with modifiers - with other key pressed between press and release" {
    var o = init_test();

    const shiftedA = core.KeyDef{ .tap_keycode = 0x04, .tap_modifiers = core.Modifiers{ .left_shift = true } };
    const normalB = core.KeyDef{ .tap_keycode = B.tap_keycode };
    const base_layer = [_]core.KeyDef{ shiftedA, normalB, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .pressed = true, .key_index = 0 }); // Press A + shift
    try o.keyboard_change_queue.enqueue(.{ .pressed = true, .key_index = 1 }); // Press B
    try o.keyboard_change_queue.enqueue(.{ .pressed = false, .key_index = 0 }); // Release A + shift
    try o.keyboard_change_queue.enqueue(.{ .pressed = false, .key_index = 1 }); // Release B

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

const a = 0x04;
const b = 0x05;
const c = 0x06;
const d = 0x07;
const A = TapOnly(a);
const B = TapOnly(b);
const C = TapOnly(c);
const D = TapOnly(d);
pub fn TapOnly(keycode: u8) core.KeyDef {
    return core.KeyDef{ .tap_keycode = keycode };
}
const dummy_time = core.TimeStamp{ .time_us_since_boot = 0 };
