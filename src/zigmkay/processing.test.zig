const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

// test stuff
test "tapping - single key press" {
    const KeyCount = 4;
    const LayerCount = 1;

    // define some input events
    var keyboard_state_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create();
    var actions_queue = core.OutputCommandQueue.Create();

    try keyboard_state_change_queue.enqueue(.{ .pressed = true, .key_index = 1 });
    const keymap = [LayerCount][KeyCount]core.KeyDef{.{ A, B, C, D }};

    const processor = zigmkay.CreateProcessor();
    try processor.Process(KeyCount, LayerCount, &keymap, &keyboard_state_change_queue, &actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(1, actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, keyboard_state_change_queue.Count());
}

test "tapping - single key release" {
    const KeyCount = 4;
    const LayerCount = 1;

    // define some input events
    var keyboard_state_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create();
    var actions_queue = core.OutputCommandQueue.Create();

    try keyboard_state_change_queue.enqueue(.{ .pressed = false, .key_index = 1 });
    const keymap = [LayerCount][KeyCount]core.KeyDef{.{ A, B, C, D }};

    const processor = zigmkay.CreateProcessor();
    try processor.Process(KeyCount, LayerCount, &keymap, &keyboard_state_change_queue, &actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(1, actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, keyboard_state_change_queue.Count());
}

test "tapping - multiple simple tap events" {
    // define some input events
    var keyboard_state_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create();
    var actions_queue = core.OutputCommandQueue.Create();

    const base_layer = [_]core.KeyDef{ A, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try keyboard_state_change_queue.enqueue(.{ .pressed = true, .key_index = 1 });
    try keyboard_state_change_queue.enqueue(.{ .pressed = false, .key_index = 1 });
    try keyboard_state_change_queue.enqueue(.{ .pressed = true, .key_index = 2 });
    try keyboard_state_change_queue.enqueue(.{ .pressed = true, .key_index = 0 });
    try keyboard_state_change_queue.enqueue(.{ .pressed = false, .key_index = 0 });

    const processor = zigmkay.CreateProcessor();

    try processor.Process(base_layer.len, keymap.len, &keymap, &keyboard_state_change_queue, &actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(5, actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, keyboard_state_change_queue.Count());
}

test "tapping - with modifiers - single key press" {
    const KeyCount = 4;
    const LayerCount = 1;

    // define some input events
    var keyboard_state_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create();
    var actions_queue = core.OutputCommandQueue.Create();

    const shiftedA = core.KeyDef{ .tap_keycode = 0x04, .tap_modifiers = core.Modifiers{ .left_shift = true } };

    try keyboard_state_change_queue.enqueue(.{ .pressed = true, .key_index = 0 });
    try keyboard_state_change_queue.enqueue(.{ .pressed = false, .key_index = 0 });

    const keymap = [LayerCount][KeyCount]core.KeyDef{.{ shiftedA, B, C, D }};
    const processor = zigmkay.CreateProcessor();

    try processor.Process(KeyCount, LayerCount, &keymap, &keyboard_state_change_queue, &actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(4, actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = 0x04 }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = 0x04 }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, keyboard_state_change_queue.Count());
}

test "tapping - with modifiers - with other key pressed between press and release" {
    const KeyCount = 4;
    const LayerCount = 1;

    // define some input events
    var keyboard_state_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create();
    var actions_queue = core.OutputCommandQueue.Create();

    const shiftedA = core.KeyDef{ .tap_keycode = A.tap_keycode, .tap_modifiers = core.Modifiers{ .left_shift = true } };
    const normalB = core.KeyDef{ .tap_keycode = B.tap_keycode };
    const keymap = [LayerCount][KeyCount]core.KeyDef{.{ shiftedA, normalB, C, D }};

    try keyboard_state_change_queue.enqueue(.{ .pressed = true, .key_index = 0 }); // Press A + shift
    try keyboard_state_change_queue.enqueue(.{ .pressed = true, .key_index = 1 }); // Press B
    try keyboard_state_change_queue.enqueue(.{ .pressed = false, .key_index = 0 }); // Release A + shift
    try keyboard_state_change_queue.enqueue(.{ .pressed = false, .key_index = 1 }); // Release B

    const processor = zigmkay.CreateProcessor();

    try processor.Process(KeyCount, LayerCount, &keymap, &keyboard_state_change_queue, &actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(6, actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = A.tap_keycode }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = A.tap_keycode }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = B.tap_keycode }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = B.tap_keycode }, try actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, keyboard_state_change_queue.Count());
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
