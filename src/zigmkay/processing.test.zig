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

    try keyboard_state_change_queue.enqueue(.{ .pressed = 1, .key_index = 1 });
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

    try keyboard_state_change_queue.enqueue(.{ .pressed = 0, .key_index = 1 });
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
    const KeyCount = 4;
    const LayerCount = 1;

    // define some input events
    var keyboard_state_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create();
    var actions_queue = core.OutputCommandQueue.Create();

    try keyboard_state_change_queue.enqueue(.{ .pressed = 1, .key_index = 1 });
    try keyboard_state_change_queue.enqueue(.{ .pressed = 0, .key_index = 1 });
    try keyboard_state_change_queue.enqueue(.{ .pressed = 1, .key_index = 2 });
    try keyboard_state_change_queue.enqueue(.{ .pressed = 1, .key_index = 0 });
    try keyboard_state_change_queue.enqueue(.{ .pressed = 0, .key_index = 0 });

    const keymap = [LayerCount][KeyCount]core.KeyDef{.{ A, B, C, D }};
    const processor = zigmkay.CreateProcessor();

    try processor.Process(KeyCount, LayerCount, &keymap, &keyboard_state_change_queue, &actions_queue);

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

test "tapping - with modifiers" {
    const KeyCount = 4;
    const LayerCount = 1;

    // define some input events
    var keyboard_state_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create();
    var actions_queue = core.OutputCommandQueue.Create();

    const shiftedA = core.KeyDef{ .tap_keycode = 0x04, .tap_modifiers = core.Modifiers{ .left_shift = true } };

    try keyboard_state_change_queue.enqueue(.{ .pressed = 1, .key_index = 0 });
    try keyboard_state_change_queue.enqueue(.{ .pressed = 0, .key_index = 0 });

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
