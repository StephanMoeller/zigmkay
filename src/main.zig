const std = @import("std");

/// This imports the separate Gmodule containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("zig_firmware_brainstorming_lib");

const core = @import("core/types.zig");

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

    [_]core.KeyDef{  //--------------------- 0 ---------------------
        Q,     W, LG(R),       P,     B,           K,     L, RG(O),     U,   SQ,
        F,  LA(A),LC(S),   LS(T),     G,           M, RS(N), RC(E), RA(I),    Y,
        Z,     X,     C,       D,     V,           J,     H,   COM,   DOT, DASH,
                               L1(ENTER),    L2(SPC)
    },

    [_]core.KeyDef{  //--------------------- 1 ---------------------
         @"!",     @"<", @"=",  @">",  @"%",              @"/", home, @"↑",  end, @"?",
         @"@", LA(@"{"), @"(",  @")",  @"}",              pgup, @"←", @"↓", @"→", pgdn,
        @"\\",     @"#", @"[",  @"]",  @"&",              @"|",  tab,   DQ, ESC, @"-",
                                MO(ENTER, 2),  none
    },
    
    [_]core.KeyDef{ //--------------------- 2 ---------------------  
         none, none, LGUI, none, none,              none, N7, N8, N9, none,
         none, LALT, LCTL, LSFT, none,              none, N4, N5, N6, none,
         none, none, none, none, none,              none, N1, N2, N3, none,
                                     none,      MO(N0, 1)
    }
};

// zig fmt: on

pub fn main() !void {
    std.log.info("hey {any}", .{baseLayer});
}

pub fn MO(key: core.KeyDef, _: u4) core.KeyDef {
    var copy = key;
    copy.mods.ls = true;
    return copy;
}

// zig fmt: off
pub fn LS(key: core.KeyDef) core.KeyDef { var copy = key; copy.mods.ls = true; return copy; }
pub fn LC(key: core.KeyDef) core.KeyDef { var copy = key; copy.mods.lc = true; return copy; }
pub fn LG(key: core.KeyDef) core.KeyDef { var copy = key; copy.mods.lg = true; return copy; }
pub fn LA(key: core.KeyDef) core.KeyDef { var copy = key; copy.mods.la = true; return copy; }
pub fn RS(key: core.KeyDef) core.KeyDef { var copy = key; copy.mods.rs = true; return copy; }
pub fn RC(key: core.KeyDef) core.KeyDef { var copy = key; copy.mods.rc = true; return copy; }
pub fn RG(key: core.KeyDef) core.KeyDef { var copy = key; copy.mods.rg = true; return copy; }
pub fn RA(key: core.KeyDef) core.KeyDef { var copy = key; copy.mods.ra = true; return copy; }

pub fn L1(key: core.KeyDef) core.KeyDef { var copy = key; copy.mods.ls = true; return copy; }
pub fn L2(key: core.KeyDef) core.KeyDef { var copy = key; copy.mods.ls = true; return copy; }
pub fn L3(key: core.KeyDef) core.KeyDef { var copy = key; copy.mods.ls = true; return copy; }
// zig fmt: on

pub const SQ = FromKeycode(0x15);
pub const COM = FromKeycode(0x15);
pub const DO = FromKeycode(0x15);
pub const DASH = FromKeycode(0x15);
pub const DOT = FromKeycode(0x15);
pub const SPC = FromKeycode(0x15);
pub const ENT = FromKeycode(0x15);

pub const LCTL = FromKeycode(0x15);
pub const RCTL = FromKeycode(0x15);
pub const LALT = FromKeycode(0x15);
pub const RALT = FromKeycode(0x15);
pub const LSFT = FromKeycode(0x15);
pub const RSFT = FromKeycode(0x15);
pub const LGUI = FromKeycode(0x15);
pub const RGUI = FromKeycode(0x15);

pub const A = FromKeycode(0x15);
pub const B = FromKeycode(0x15);
pub const C = FromKeycode(0x15);
pub const D = FromKeycode(0x15);
pub const E = FromKeycode(0x15);
pub const F = FromKeycode(0x15);
pub const G = FromKeycode(0x15);
pub const H = FromKeycode(0x15);
pub const I = FromKeycode(0x65);
pub const J = FromKeycode(0x15);
pub const K = FromKeycode(0x15);
pub const L = FromKeycode(0x15);
pub const M = FromKeycode(0x15);
pub const N = FromKeycode(0x15);
pub const O = FromKeycode(0x15);
pub const P = FromKeycode(0x15);
pub const Q = FromKeycode(0x15);
pub const R = FromKeycode(0x15);
pub const S = FromKeycode(0x15);
pub const T = FromKeycode(0x15);
pub const U = FromKeycode(0x15);
pub const V = FromKeycode(0x15);
pub const W = FromKeycode(0x15);
pub const X = FromKeycode(0x15);
pub const Y = FromKeycode(0x15);
pub const Z = FromKeycode(0x15);

pub const N1 = FromKeycode(0x15);
pub const N2 = FromKeycode(0x15);
pub const N3 = FromKeycode(0x15);
pub const N4 = FromKeycode(0x15);
pub const N5 = FromKeycode(0x15);
pub const N6 = FromKeycode(0x15);
pub const N7 = FromKeycode(0x15);
pub const N8 = FromKeycode(0x15);
pub const N9 = FromKeycode(0x15);
pub const N0 = FromKeycode(0x15);

pub const Ae = FromKeycode(0x15);
pub const Oe = FromKeycode(0x15);
pub const Aa = FromKeycode(0x15);

pub const @"!" = FromKeycodeAndShift(N1.keycode);
pub const @"<" = FromKeycodeAndShift(N1.keycode);
pub const @"=" = FromKeycodeAndShift(N1.keycode);
pub const @">" = FromKeycodeAndShift(N1.keycode);
pub const @"%" = FromKeycodeAndShift(N1.keycode);
pub const @"/" = FromKeycodeAndShift(N1.keycode);
pub const home = FromKeycodeAndShift(N1.keycode);
pub const @"↑" = FromKeycodeAndShift(N1.keycode);
pub const end = FromKeycodeAndShift(N1.keycode);
pub const @"?" = FromKeycodeAndShift(N1.keycode);
pub const @"@" = FromKeycodeAndShift(N1.keycode);
pub const @"{" = FromKeycodeAndShift(N1.keycode);
pub const @"(" = FromKeycodeAndShift(N1.keycode);
pub const @")" = FromKeycodeAndShift(N1.keycode);
pub const @"}" = FromKeycodeAndShift(N1.keycode);
pub const pgup = FromKeycodeAndShift(N1.keycode);
pub const @"←" = FromKeycodeAndShift(N1.keycode);
pub const @"↓" = FromKeycodeAndShift(N1.keycode);
pub const @"→" = FromKeycodeAndShift(N1.keycode);
pub const pgdn = FromKeycodeAndShift(N1.keycode);
pub const @"\\" = FromKeycodeAndShift(N1.keycode);
pub const @"#" = FromKeycodeAndShift(N1.keycode);
pub const @"[" = FromKeycodeAndShift(N1.keycode);
pub const @"]" = FromKeycodeAndShift(N1.keycode);
pub const @"&" = FromKeycodeAndShift(N1.keycode);
pub const @"|" = FromKeycodeAndShift(N1.keycode);
pub const tab = FromKeycodeAndShift(N1.keycode);
pub const DQ = FromKeycodeAndShift(N1.keycode);
pub const ESC = FromKeycodeAndShift(N1.keycode);
pub const @"." = FromKeycodeAndShift(N1.keycode);
pub const @"-" = FromKeycodeAndShift(N1.keycode);
pub const ENTER = FromKeycodeAndShift(N1.keycode);
pub const SPACE = FromKeycodeAndShift(N1.keycode);
pub const none = FromKeycode(0);

pub fn FromKeycodeAndShift(keycode: u8) core.KeyDef {
    return core.KeyDef{ .keycode = keycode, .mods = core.Mods{ .ls = true } };
}
pub fn FromKeycodeAndRAlt(keycode: u8) core.KeyDef {
    return core.KeyDef{ .keycode = keycode };
}
pub fn FromKeycode(keycode: u8) core.KeyDef {
    return core.KeyDef{ .keycode = keycode };
}
