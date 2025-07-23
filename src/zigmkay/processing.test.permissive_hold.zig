const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const init_test = @import("processing.test_helpers.zig").init_test;
const Expectation = enum { Hold, Tap };
const PermissiveHoldParameters = struct {
    target_release_delta: core.TimeSinceBoot,
    other_press_delta: core.TimeSinceBoot,
    other_release_delta: core.TimeSinceBoot,
    expectation: Expectation,
    tapping_terms_ms: core.TappingTermType,
};

fn run_permissive_hold_test(comptime config: PermissiveHoldParameters) !void {
    const start_time = 100;
    var current_time: core.TimeSinceBoot = start_time;
    const key_with_permissive_hold = core.KeyDef{ .tap_hold = .{
        .tap = .{ .tap_keycode = c },
        .hold = .{ .hold_modifiers = .{ .left_shift = true } },
        .tapping_term_ms = config.tapping_terms_ms,
        .retro_tapping = false,
    } };

    const other_key_def = comptime core.KeyDef.TAP(b);
    const base_layer = comptime [_]core.KeyDef{ key_with_permissive_hold, other_key_def, A };
    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};

    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};

    const target_key_index = 0;
    const other_key_index = 1;

    // Ensure nothing happens at first press when the key has multiple functions (both tap and hold)
    try o.press_key(target_key_index, current_time);
    current_time = start_time + config.other_press_delta;
    try o.press_key(other_key_index, current_time);
    current_time = start_time + config.other_release_delta;
    try o.release_key(other_key_index, current_time);
    current_time = start_time + config.target_release_delta;
    try o.release_key(target_key_index, current_time);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);

    // expect A pressed as no layer switch is expected
    switch (config.expectation) {
        .Tap => {
            unreachable;
        },
        .Hold => {
            try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
            try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
            try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
            try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());
        },
    }
    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
test "MT perm hold - other key is tap, case A" {
    try run_permissive_hold_test(.{ .tapping_terms_ms = 250, .other_press_delta = 1, .other_release_delta = 2, .target_release_delta = 3, .expectation = Expectation.Hold });
}
test "MT perm hold - other key is tap, case B" {
    try run_permissive_hold_test(.{ .tapping_terms_ms = 250, .other_press_delta = 1, .other_release_delta = 2, .target_release_delta = 251, .expectation = Expectation.Hold });
}
test "MT perm hold - other key is tap, case C" {
    try run_permissive_hold_test(.{ .tapping_terms_ms = 250, .other_press_delta = 247, .other_release_delta = 248, .target_release_delta = 249, .expectation = Expectation.Hold });
}
test "MT perm hold - other key is tap, case D" {
    try run_permissive_hold_test(.{ .tapping_terms_ms = 250, .other_press_delta = 248, .other_release_delta = 252, .target_release_delta = 253, .expectation = Expectation.Hold });
}
test "MT perm hold - other key is tap, case E" {
    try run_permissive_hold_test(.{ .tapping_terms_ms = 250, .other_press_delta = 252, .other_release_delta = 500, .target_release_delta = 501, .expectation = Expectation.Hold });
}
test "MT perm hold - other key is tap, case F" {
    try run_permissive_hold_test(.{ .tapping_terms_ms = 250, .other_press_delta = 500, .other_release_delta = 600, .target_release_delta = 650, .expectation = Expectation.Hold });
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
