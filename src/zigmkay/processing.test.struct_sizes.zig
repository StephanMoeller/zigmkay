const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const helpers = @import("processing.test_helpers.zig");
const init_test = helpers.init_test;

const a = 0x04;
const b = 0x05;
const c = 0x06;
const d = 0x07;
const e = 0x08;
const f = 0x09;
const g = 0x10;

const A = helpers.TAP(a);
const B = helpers.TAP(b);
const C = helpers.TAP(c);
const D = helpers.TAP(d);
const E = helpers.TAP(e);
const F = helpers.TAP(f);
const G = helpers.TAP(g);
// These tests exist to ensure that it will be an intentional change,
// when the sizes and alignments change of the types that are part of the keymap
// as this is a type that may exist in copies in the hundreds when a big keyboard has lots of layers
test "Struct size: KeyDef" {
    try std.testing.expectEqual(14, @sizeOf(core.KeyDef));
    try std.testing.expectEqual(2, @alignOf(core.KeyDef));
}
test "Struct size: TapDef" {
    try std.testing.expectEqual(5, @sizeOf(core.TapDef));
    try std.testing.expectEqual(1, @alignOf(core.TapDef));
}
test "Struct size: HoldDef" {
    try std.testing.expectEqual(4, @sizeOf(core.HoldDef));
    try std.testing.expectEqual(1, @alignOf(core.HoldDef));
}
test "Struct size: Modifiers" {
    try std.testing.expectEqual(1, @sizeOf(core.Modifiers));
    try std.testing.expectEqual(1, @alignOf(core.Modifiers));
}
test "Struct size: TapHold" {
    try std.testing.expectEqual(12, @sizeOf(core.TapHoldDef));
    try std.testing.expectEqual(2, @alignOf(core.TapHoldDef));
}
test "Struct size: AutoFireDef" {
    try std.testing.expectEqual(10, @sizeOf(core.AutoFireDef));
    try std.testing.expectEqual(2, @alignOf(core.AutoFireDef));
}
test "Struct size: KeyCodeFire" {
    try std.testing.expectEqual(4, @sizeOf(core.KeyCodeFire));
    try std.testing.expectEqual(1, @alignOf(core.KeyCodeFire));
}
