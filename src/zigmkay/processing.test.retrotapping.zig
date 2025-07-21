const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const init_test = @import("processing.test_helpers.zig").init_test;
const RetroTestParameters = struct {
    retro_enabled: bool,
    tapping_terms_ms: core.TappingTermType,
    release_delta_time: core.TimeSinceBoot,
    expect_hold: bool,
    expect_tap: bool,
    press_other_before_release: bool,
};
fn run_retrotest_test(comptime config: RetroTestParameters) !void {
    // retro disabled
    // key pressed
    // same key released within tapping term
    // expect tap (as this is the normal tap condition)
    var current_time: core.TimeSinceBoot = 100;
    const key_without_retro_tapping = core.KeyDef{ .tap_hold = .{
        .tap = .{ .tap_keycode = c },
        .hold = .{ .hold_modifiers = .{ .left_shift = true } },
        .tapping_term_ms = config.tapping_terms_ms,
        .retro_tapping = config.retro_enabled,
    } };

    const base_layer = comptime [_]core.KeyDef{ key_without_retro_tapping, B, A };
    const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};

    var o = init_test(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap){};

    // Ensure nothing happens at first press when the key has multiple functions (both tap and hold)
    try o.press_key(0, current_time);

    if (config.press_other_before_release) {
        try o.press_key(1, current_time);
    }

    // Now ensure that a tap will happen when releasing within tapping term
    current_time += config.release_delta_time; // within tapping term
    try o.release_key(0, current_time);
    try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);

    // expect A pressed as no layer switch is expected
    if (config.expect_hold) {
        try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
        try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());
    }
    if (config.press_other_before_release) {
        try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    }
    if (config.expect_tap) {
        try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());
        try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = c }, try o.actions_queue.dequeue());
    }

    try std.testing.expectEqual(0, o.matrix_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
test "MT retrotapping - press/release case A" {
    // retro disabled, released within tt, expect tap only
    try run_retrotest_test(.{ .retro_enabled = false, .tapping_terms_ms = 250, .release_delta_time = 0, .press_other_before_release = false, .expect_hold = false, .expect_tap = true });
    try run_retrotest_test(.{ .retro_enabled = false, .tapping_terms_ms = 250, .release_delta_time = 1, .press_other_before_release = false, .expect_hold = false, .expect_tap = true });
    try run_retrotest_test(.{ .retro_enabled = false, .tapping_terms_ms = 250, .release_delta_time = 249, .press_other_before_release = false, .expect_hold = false, .expect_tap = true });
}
test "MT retrotapping - press/release case B" {
    // retro true, released within tt, expect tap only
    try run_retrotest_test(.{ .retro_enabled = true, .tapping_terms_ms = 250, .release_delta_time = 0, .press_other_before_release = false, .expect_hold = false, .expect_tap = true });
    try run_retrotest_test(.{ .retro_enabled = true, .tapping_terms_ms = 250, .release_delta_time = 1, .press_other_before_release = false, .expect_hold = false, .expect_tap = true });
    try run_retrotest_test(.{ .retro_enabled = true, .tapping_terms_ms = 250, .release_delta_time = 249, .press_other_before_release = false, .expect_hold = false, .expect_tap = true });
}
test "MT retrotapping - press/release case C" {
    // retro disabled, released after tt, expect hold only
    try run_retrotest_test(.{ .retro_enabled = false, .tapping_terms_ms = 250, .release_delta_time = 251, .press_other_before_release = false, .expect_hold = true, .expect_tap = false });
    try run_retrotest_test(.{ .retro_enabled = false, .tapping_terms_ms = 250, .release_delta_time = 350, .press_other_before_release = false, .expect_hold = true, .expect_tap = false });
}
test "MT retrotapping - press/release case D" {
    // retro enabled, released after tt, expect hold only
    try run_retrotest_test(.{ .retro_enabled = true, .tapping_terms_ms = 250, .release_delta_time = 251, .press_other_before_release = false, .expect_hold = true, .expect_tap = true });
    try run_retrotest_test(.{ .retro_enabled = true, .tapping_terms_ms = 250, .release_delta_time = 350, .press_other_before_release = false, .expect_hold = true, .expect_tap = true });
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
