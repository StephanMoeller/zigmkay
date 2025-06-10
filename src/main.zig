const std = @import("std");

/// This imports the separate Gmodule containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("zig_firmware_brainstorming_lib");

const core = @import("core.zig");
const keycodes = @import("keycodes.zig");

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
//  => layer: ?u8, => enienienien-nmods: Mods
//
//

const KEYCOUNT = 32;
const base_layer =
    \\ Q     W <J> lg:R        P   B            k   l <æ> o <å> u   '
    \\ F  la:A <Z> lc:S <V> ls:T   G            m   n     e     i   y
    \\ Z     X        C        D   V            j   h     ,     .   -
    \\                               ENT    SPC  
    \\ combo: lu=ø
;
// zig fmt: off
const baseLayer = [_][KEYCOUNT]core.KeyDef{
    // 0
    [_]core.KeyDef{ 
        Q,      W,   LG(R),      P,     B,           K,     L,   RG(O),    U,   SQ,
        F,  LA(A), LC(S),  LS(T),     G,           M,    RS(N), RC(E), RA(I),    Y,
        Z,      X,     C,      D,     V,           J,     H,  COM,  DOT, DASH,
                                MO(ENTER, 2),  MO(SPC, 1)
    },
    // 1
    [_]core.KeyDef{ 
         @"!",     @"<", @"=",  @">",  @"%",              @"/", home, @"↑", end,    @"?",
         @"@", LA(@"{"), @"(",  @")",  @"}",              pgup, @"←", @"↓",   @"→", pgdn,
        @"\\",     @"#", @"[",  @"]",  @"&",              @"|",  tab,   DQ,   @".", @"-",
                                MO(ENTER, 2),  MO(SPC, 1)
    },
    // 2
    [_]core.KeyDef{ 
         none, none, LGUI, none, none,              none, N7, N8, N9, none,
         none, LALT, LCTL, LSFT, none,              none, N4, N5, N6, none,
         none, none, none, none, none,              none, N1, N2, N3, none,
                                MO(ENTER, 2),  N0
    }
};
// zig fmt: on

pub fn main() !void {
    std.log.info("hey {any}", .{baseLayer});
}

pub fn MO(key: core.KeyDef, _: u4) core.KeyDef {
    var copy = key;
    copy.mods.ls = true; // fix this - does not yet have option of hold functionality
    return copy;
}
pub fn LS(key: core.KeyDef) core.KeyDef {
    var copy = key;
    copy.mods.ls = true;
    return copy;
}
pub fn LC(key: core.KeyDef) core.KeyDef {
    var copy = key;
    copy.mods.lc = true;
    return copy;
}
pub fn LG(key: core.KeyDef) core.KeyDef {
    var copy = key;
    copy.mods.lg = true;
    return copy;
}
pub fn LA(key: core.KeyDef) core.KeyDef {
    var copy = key;
    copy.mods.la = true;
    return copy;
}

pub fn RS(key: core.KeyDef) core.KeyDef {
    var copy = key;
    copy.mods.ls = true;
    return copy;
}
pub fn RC(key: core.KeyDef) core.KeyDef {
    var copy = key;
    copy.mods.lc = true;
    return copy;
}
pub fn RG(key: core.KeyDef) core.KeyDef {
    var copy = key;
    copy.mods.lg = true;
    return copy;
}
pub fn RA(key: core.KeyDef) core.KeyDef {
    var copy = key;
    copy.mods.la = true;
    return copy;
}

pub const SQ: core.KeyDef = core.FromKeycode(0x15);
pub const COM: core.KeyDef = core.FromKeycode(0x15);
pub const DOT: core.KeyDef = core.FromKeycode(0x15);
pub const DASH: core.KeyDef = core.FromKeycode(0x15);
pub const SPC: core.KeyDef = core.FromKeycode(0x15);
pub const ENT: core.KeyDef = core.FromKeycode(0x15);

pub const LCTL: core.KeyDef = core.FromKeycode(0x15);
pub const RCTL: core.KeyDef = core.FromKeycode(0x15);
pub const LALT: core.KeyDef = core.FromKeycode(0x15);
pub const RALT: core.KeyDef = core.FromKeycode(0x15);
pub const LSFT: core.KeyDef = core.FromKeycode(0x15);
pub const RSFT: core.KeyDef = core.FromKeycode(0x15);
pub const LGUI: core.KeyDef = core.FromKeycode(0x15);
pub const RGUI: core.KeyDef = core.FromKeycode(0x15);

pub const A: core.KeyDef = core.FromKeycode(0x15);
pub const B: core.KeyDef = core.FromKeycode(0x15);
pub const C: core.KeyDef = core.FromKeycode(0x15);
pub const D: core.KeyDef = core.FromKeycode(0x15);
pub const E: core.KeyDef = core.FromKeycode(0x15);
pub const F: core.KeyDef = core.FromKeycode(0x15);
pub const G: core.KeyDef = core.FromKeycode(0x15);
pub const H: core.KeyDef = core.FromKeycode(0x15);
pub const I: core.KeyDef = core.FromKeycode(0x15);
pub const J: core.KeyDef = core.FromKeycode(0x15);
pub const K: core.KeyDef = core.FromKeycode(0x15);
pub const L: core.KeyDef = core.FromKeycode(0x15);
pub const M: core.KeyDef = core.FromKeycode(0x15);
pub const N: core.KeyDef = core.FromKeycode(0x15);
pub const O: core.KeyDef = core.FromKeycode(0x15);
pub const P: core.KeyDef = core.FromKeycode(0x15);
pub const Q: core.KeyDef = core.FromKeycode(0x15);
pub const R: core.KeyDef = core.FromKeycode(0x15);
pub const S: core.KeyDef = core.FromKeycode(0x15);
pub const T: core.KeyDef = core.FromKeycode(0x15);
pub const U: core.KeyDef = core.FromKeycode(0x15);
pub const V: core.KeyDef = core.FromKeycode(0x15);
pub const W: core.KeyDef = core.FromKeycode(0x15);
pub const X: core.KeyDef = core.FromKeycode(0x15);
pub const Y: core.KeyDef = core.FromKeycode(0x15);
pub const Z: core.KeyDef = core.FromKeycode(0x15);

pub const N1: core.KeyDef = core.FromKeycode(0x15);
pub const N2: core.KeyDef = core.FromKeycode(0x15);
pub const N3: core.KeyDef = core.FromKeycode(0x15);
pub const N4: core.KeyDef = core.FromKeycode(0x15);
pub const N5: core.KeyDef = core.FromKeycode(0x15);
pub const N6: core.KeyDef = core.FromKeycode(0x15);
pub const N7: core.KeyDef = core.FromKeycode(0x15);
pub const N8: core.KeyDef = core.FromKeycode(0x15);
pub const N9: core.KeyDef = core.FromKeycode(0x15);
pub const N0: core.KeyDef = core.FromKeycode(0x15);

pub const Ae: core.KeyDef = core.FromKeycode(0x15);
pub const Oe: core.KeyDef = core.FromKeycode(0x15);
pub const Aa: core.KeyDef = core.FromKeycode(0x15);

pub const @"!": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"<": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"=": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @">": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"%": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"/": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const home: core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"↑": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const end: core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"?": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"@": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"{": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"(": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @")": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"}": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const pgup: core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"←": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"↓": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"→": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const pgdn: core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"\\": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"#": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"[": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"]": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"&": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"|": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const tab: core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const DQ: core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @".": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const @"-": core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const ENTER: core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const SPACE: core.KeyDef = core.FromKeycodeAndShift(N1.keycode);
pub const none: core.KeyDef = core.FromKeycode(0);
