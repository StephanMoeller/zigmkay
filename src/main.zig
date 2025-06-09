const std = @import("std");

/// This imports the separate Gmodule containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("zig_firmware_brainstorming_lib");

const c = @import("core.zig");
const kc = @import("keycodes.zig");

// Core stuff
const LALT: u8 = 0b00000001;
const RALT: u8 = 0b00000010;
const LCTL: u8 = 0b00000100;
const RCTL: u8 = 0b00001000;
const LSFT: u8 = 0b00010000;
const RSFT: u8 = 0b00100000;
const LGUI: u8 = 0b01000000;
const RGUI: u8 = 0b10000000;

// Tap:
//  None
//  Fire Key + Mod
//  One shot layer shift + Mod
//  Permanent layer shift + Mod
//
// Hold:
//  None
//  Mod
//  Momentary layer + mod
//  => layer: ?u8, => mods: Mods

const KeyDef = struct {
    HoldMods: u8,
    HoldMomentaryLayer: u4,
    TapKeyCode: u8,
    _apMods: c.Mods,
    TapOneShotLayer: u4,
    TapPermanentLayer: u4,
};

const Foo = packed struct { a: u47, b: u20 };

const HoldDef = union(enum) { LayerChangeMomentarily: c.LayerWithMods, None: void };
const TapDef = union(enum) { LayerChangeOneShot: c.LayerWithMods, LayerChangePermanent: c.LayerWithMods, FireKeyCode: c.KeyCodeWithMods, None: void };
const TapHoldDef = struct { tap: TapDef, hold: HoldDef };
const ComboDef = struct { keyPos1: [2]u8, keyPos2: [2]u8, keyPos3: [2]u8, Action: TapHoldDef };
const v = .{};
//const Test: [2][3]u8 = [2][3]u8{[_]u8{1,2,3},[_]u8{4,5,6}};
const LayerCount = 4;
const KeyCount = 36;

pub fn main() !void {
    std.log.info("hey", .{});
    std.debug.print("Size is {any}.\n", .{kc.BBB});
}
