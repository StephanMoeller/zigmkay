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
const Foo = packed struct { a: u47, b: u20 };

pub fn main() !void {
    const k = c.nthisisokay{};
    std.log.info("hey", .{k});
    std.debug.print("Size is {any}.\n", .{kc.BBB});
}
