const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const TestObjects = struct {
    matrix_change_queue: core.MatrixStateChangeQueue,
    actions_queue: core.OutputCommandQueue,
    processor: zigmkay.processing.Processor,
    fn press_key(self: *TestObjects, key_index: usize, time: core.TimeSinceBoot) !void {
        try self.matrix_change_queue.enqueue(.{ .time = time, .pressed = true, .key_index = key_index });
    }
    fn release_key(self: *TestObjects, key_index: usize, time: core.TimeSinceBoot) !void {
        try self.matrix_change_queue.enqueue(.{ .time = time, .pressed = false, .key_index = key_index });
    }
};
fn init_test() TestObjects {
    return TestObjects{
        .matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create(),
        .actions_queue = zigmkay.core.OutputCommandQueue.Create(),
        .processor = zigmkay.processing.CreateProcessor(),
    };
}

test "LT tap/hold layer - tap case 1" {
    var o = init_test();
    const current_time: core.TimeSinceBoot = 100;
    const tapping_terms_ms: u16 = 250;
    const mo_layer1_cWithLeftAlt = core.KeyDef.LT(1, c, .{ .left_alt = true }, tapping_terms_ms);

    const base_layer = [_]core.KeyDef{ mo_layer1_cWithLeftAlt, B, A };
    const layer_1 = [_]core.KeyDef{ D, E, F };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };

    // Tap a transparent key at position 0 which is just a normal key
    try o.press_key(0, 1000);
    try o.release_key(0, 1000 + tapping_terms_ms - 1);

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.matrix_change_queue, &o.actions_queue, current_time);

    // expect A pressed as no layer switch is expected
    //try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    //try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
    //try std.testing.expectEqual(0, o.actions_queue.Count());
}

test "tap/hold mod - case: tap" {
    // Tap and release within tapping term
}

test "tap/hold layer - case: hold" {
    // Tap and release within tapping term
}
test "tap/hold mod - case: hold" {
    // Tap and release within tapping term
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
