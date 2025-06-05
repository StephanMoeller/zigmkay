const std = @import("std");
const LALT: u8 = 0b00000001;
const RALT: u8 = 0b00000010;
const LCTL: u8 = 0b00000100;
const RCTL: u8 = 0b00001000;
const LSFT: u8 = 0b00010000;
const RSFT: u8 = 0b00100000;
const LGUI: u8 = 0b01000000;
const RGUI: u8 = 0b10000000;

// Define taps, tap
const KeyCodeWithMods = struct { keycode: u8, mods: u8 };
const LayerWithMods = struct { layer: u8, mods: u8 };

const HoldDef = union(enum){
    LayerChangeMomentarily: LayerWithMods,
    None: void
};
const TapDef = union(enum){
    LayerChangeOneShot: LayerWithMods,
    LayerChangePermanent: LayerWithMods,
    FireKeyCode: KeyCodeWithMods,
    None: void
};

const TapHoldDef = struct { tap: TapDef, hold: HoldDef };

const ComboDef = struct
{
    keyPos1: [2]u8,
    keyPos2: [2]u8,
    keyPos3: [2]u8,
    Action: TapHoldDef
};

pub fn main() !void {
    const tapOnly = TapHoldDef{.tap = TapDef.None, .hold = HoldDef{.LayerChangeMomentarily = LayerWithMods{.layer = 1, .mods = RCTL | RSFT}}};
    std.debug.print("Size is {any}.\n", .{tapOnly.tap});
}

/// This imports the separate module containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("zig_firmware_brainstorming_lib");
