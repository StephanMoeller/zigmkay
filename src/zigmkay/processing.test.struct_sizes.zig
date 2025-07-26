const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const init_test = @import("processing.test_helpers.zig").init_test;
// These tests exist to ensure that it will be an intentional change,
// when the sizes and alignments change of the types that are part of the keymap
// as this is a type that may exist in copies in the hundreds when a big keyboard has lots of layers
test "Struct size: KeyDef" {
    try std.testing.expectEqual(48, @sizeOf(core.KeyDef));
    try std.testing.expectEqual(8, @alignOf(core.KeyDef));
}
test "Struct size: TapDef" {
    try std.testing.expectEqual(3, @sizeOf(core.TapDef));
    try std.testing.expectEqual(1, @alignOf(core.TapDef));
}
test "Struct size: HoldDef" {
    try std.testing.expectEqual(24, @sizeOf(core.HoldDef));
    try std.testing.expectEqual(8, @alignOf(core.HoldDef));
}
test "Struct size: Modifiers" {
    try std.testing.expectEqual(1, @sizeOf(core.Modifiers));
    try std.testing.expectEqual(1, @alignOf(core.Modifiers));
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
