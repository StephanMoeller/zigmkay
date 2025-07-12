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

const A = core.KeyDef.TAP(0x04);
const B = core.KeyDef.TAP(0x05);
const C = core.KeyDef.TAP(0x06);
const D = core.KeyDef.TAP(0x07);
const E = core.KeyDef.TAP(0x08);
const F = core.KeyDef.TAP(0x09);
test "Layers - complex switch" {
    var o = init_test();

    const mo_key = core.KeyDef.MO(1);
    const base_layer = [_]core.KeyDef{ A, B, mo_key, D };
    const other_layer = [_]core.KeyDef{ E, F, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, other_layer };

    // Tap B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Tap A
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    // Hold for layer switch
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 }); //mo_key pressed

    // Tap F
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Tap E
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    // Release layer switch again
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 2 }); //mo_key released

    // Tap B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Tap A
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue);

    // Expect B tapped
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = B.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = B.tap_keycode }, try o.actions_queue.dequeue());

    // Expect A
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = A.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = A.tap_keycode }, try o.actions_queue.dequeue());

    // At this point, layer 1 is expected to be activated

    // Expect F
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = F.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = F.tap_keycode }, try o.actions_queue.dequeue());

    // Expect E
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = E.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = E.tap_keycode }, try o.actions_queue.dequeue());

    // At this point, layer 1 is expected to be deactivated again

    // Expect B tapped
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = B.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = B.tap_keycode }, try o.actions_queue.dequeue());

    // Expect A
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = A.tap_keycode }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = A.tap_keycode }, try o.actions_queue.dequeue());

    // Expect no more actions
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}
