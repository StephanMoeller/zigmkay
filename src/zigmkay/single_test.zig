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
test "Layers - transparent key - ensure key on lower active layers used - case A - expect fallback to next active layer" {
    var o = init_test();

    const mo1_key = core.KeyDef.MO(1);
    const mo2_key = core.KeyDef.MO(2);
    const mo3_key = core.KeyDef.MO(3);
    const base_layer = [_]core.KeyDef{ A, mo1_key, mo2_key, mo3_key, A, A };
    const layer_1 = [_]core.KeyDef{ B, B, B, mo3_key, B, B };
    const layer_2 = [_]core.KeyDef{ C, C, C, C, C, C };
    const layer_3 = [_]core.KeyDef{ core.KeyDef.TRANSPARENT(), core.KeyDef.NONE(), D, D, D, D };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, layer_1, layer_2, layer_3 };

    // Hold for layer switch 1 and 3
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 3 });

    // Tap a transparent key at position 0 which is transparent - expect layer 1's key do be pushed
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try std.testing.expectEqual(0, o.actions_queue.Count());
    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue);

    // Press B expected
    try std.testing.expectEqual(2, o.actions_queue.Count());

    try std.testing.expectEqual(b, (try o.actions_queue.dequeue()).KeyCodePress);
    try std.testing.expectEqual(b, (try o.actions_queue.dequeue()).KeyCodeRelease);

    // Expect no more actions
    try std.testing.expectEqual(0, o.actions_queue.Count());
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
