const std = @import("std");

// Core stuff
const LALT: u8 = 0b00000001;
const RALT: u8 = 0b00000010;
const LCTL: u8 = 0b00000100;
const RCTL: u8 = 0b00001000;
const LSFT: u8 = 0b00010000;
const RSFT: u8 = 0b00100000;
const LGUI: u8 = 0b01000000;
const RGUI: u8 = 0b10000000;

pub fn LS(key: KeyCodeWithMods) KeyCodeWithMods { return AddMod(key, LSFT); }
pub fn RS(key: KeyCodeWithMods) KeyCodeWithMods { return AddMod(key, RSFT); }
pub fn LC(key: KeyCodeWithMods) KeyCodeWithMods { return AddMod(key, LCTL); }
pub fn RC(key: KeyCodeWithMods) KeyCodeWithMods { return AddMod(key, RCTL); }
pub fn LA(key: KeyCodeWithMods) KeyCodeWithMods { return AddMod(key, LALT); }
pub fn RA(key: KeyCodeWithMods) KeyCodeWithMods { return AddMod(key, RALT); }
pub fn LG(key: KeyCodeWithMods) KeyCodeWithMods { return AddMod(key, LGUI); }
pub fn RG(key: KeyCodeWithMods) KeyCodeWithMods { return AddMod(key, RGUI); }
pub fn AddMod(key: KeyCodeWithMods, mod: u8) KeyCodeWithMods
{
    var copy = key;
    copy.mods = copy.mods | mod;
}
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

const A = KeyCodeWithMods{.keycode = 0x015, .mods = 0};
const B = KeyCodeWithMods{.keycode = 0x015, .mods = 0};
const C = KeyCodeWithMods{.keycode = 0x015, .mods = 0};
const D = KeyCodeWithMods{.keycode = 0x015, .mods = 0};
const E = KeyCodeWithMods{.keycode = 0x015, .mods = 0};
const F = KeyCodeWithMods{.keycode = 0x015, .mods = 0};



//const Test: [2][3]u8 = [2][3]u8{[_]u8{1,2,3},[_]u8{4,5,6}};
const LayerCount = 4;
const KeyCount = 36;
const KeyMap:[LayerCount][KeyCount]TapHoldDef = [LayerCount][KeyCount]TapHoldDef{
    [KeyCount]TapHoldDef{
        A, B, C, D, E,         F, A, B, C, D,
        A, B, C, D, E,         F, A, B, C, D,
        A, B, C, D, E,         F, A, B, C, D,
                 A, B, C,   D, E, F
    },
    [KeyCount]TapHoldDef{
        A, B, C, D, E,         F, A, B, C, D,
        A, B, C, D, E,         F, A, B, C, D,
        A, B, C, D, E,         F, A, B, C, D,
                 A, B, C,   D, E, F
    },
    [KeyCount]TapHoldDef{
        A, B, C, D, E,         F, A, B, C, D,
        A, B, C, D, E,         F, A, B, C, D,
        A, B, C, D, E,         F, A, B, C, D,
                 A, B, C,   D, E, F
    },
    [KeyCount]TapHoldDef{
        A, B, C, D, E,         F, A, B, C, D,
        A, B, C, D, E,         F, A, B, C, D,
         B, C, D, E,         F, A, B, C, D,
                 A, B, C,   D, E, F
    }
};
  

pub fn main() !void {
    //const tapOnly = TapHoldDef{.tap = TapDef.None, .hold = HoldDef{.LayerChangeMomentarily = LayerWithMods{.layer = 1, .mods = RCTL | RSFT}}};
    std.debug.print("Size is {any}.\n", .{KeyMap[0]});
}

/// This imports the separate module containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("zig_firmware_brainstorming_lib");




