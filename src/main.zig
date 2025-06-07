const std = @import("std");

/// This imports the separate module containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("zig_firmware_brainstorming_lib");

// Core stuff
const LALT: u8 = 0b00000001;
const RALT: u8 = 0b00000010;
const LCTL: u8 = 0b00000100;
const RCTL: u8 = 0b00001000;
const LSFT: u8 = 0b00010000;
const RSFT: u8 = 0b00100000;
const LGUI: u8 = 0b01000000;
const RGUI: u8 = 0b10000000;

const Mods = packed struct { ls: bool, rs: bool, lc: bool, rc: bool, la: bool, ra: bool, lg: bool, rg: bool };
const KeyCodeWithMods = struct { keycode: u8, mods: Mods };
const LayerWithMods = struct { layer: u8, mods: Mods };

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

const LayerShiftType = enum { OneShot, Permanent };
const KeyDef = struct {
    HoldMods: u8,
    HoldMomentaryLayer: u4,
    TapKeyCode: u8,
    TapMods: Mods,
    TapOneShotLayer: u4,
    TapPermanentLayer: u4,
};

const Foo = struct { field: ?u2 };

const HoldDef = union(enum) { LayerChangeMomentarily: LayerWithMods, None: void };
const TapDef = union(enum) { LayerChangeOneShot: LayerWithMods, LayerChangePermanent: LayerWithMods, FireKeyCode: KeyCodeWithMods, None: void };
const TapHoldDef = struct { tap: TapDef, hold: HoldDef };
const ComboDef = struct { keyPos1: [2]u8, keyPos2: [2]u8, keyPos3: [2]u8, Action: TapHoldDef };

//const A = KeyCodeWithMods{ .keycode = 0x015, .mods = 0 };
//const B = KeyCodeWithMods{ .keycode = 0x015, .mods = 0 };
//const C = KeyCodeWithMods{ .keycode = 0x015, .mods = 0 };
//const D = KeyCodeWithMods{ .keycode = 0x015, .mods = 0 };
//const E = KeyCodeWithMods{ .keycode = 0x015, .mods = 0 };
//const F = KeyCodeWithMods{ .keycode = 0x015, .mods = 0 };

//const Test: [2][3]u8 = [2][3]u8{[_]u8{1,2,3},[_]u8{4,5,6}};
const LayerCount = 4;
const KeyCount = 36;
//KeyMap: [LayerCount][KeyCount]TapHoldDef = [LayerCount][KeyCount]TapHoldDef{ [KeyCount]TapHoldDef{ A, B, C, D, E, F, A, B, C, D, A, B, C, D, E, F, A, B, C, D, A, B, C, D, E, F, A, B, C, D, A, B, C, D, E, F }, [KeyCount]TapHoldDef{ A, B, C, D, E, F, A, B, C, D, A, B, C, D, E, F, A, B, C, D, A, B, C, D, E, F, A, B, C, D, A, B, C, D, E, F }, [KeyCount]TapHoldDef{ A, B, C, D, E, F, A, B, C, D, A, B, C, D, E, F, A, B, C, D, A, B, C, D, E, F, A, B, C, D, A, B, C, D, E, F }, [KeyCount]TapHoldDef{ A, B, C, D, E, F, A, B, C, D, A, B, C, D, E, F, A, B, C, D, B, C, D, E, F, A, B, C, D, A, B, C, D, E, F } };

pub fn main() !void {
    std.log.info("hey", .{});
    //const tapOnly = TapHoldDef{.tap = TapDef.None, .hold = HoldDef{.LayerChangeMomentarily = LayerWithMods{.layer = 1, .mods = RCTL | RSFT}}};
    std.debug.print("Size is {any}.\n", .{@sizeOf(KeyDef)});
}
