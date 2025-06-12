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

pub const SQ = core.FromKeycode(0x15);
pub const COM = core.FromKeycode(0x15);
pub const DO = core.FromKeycode(0x15);
pub const DASH = core.FromKeycode(0x15);
pub const DOT = core.FromKeycode(0x15);
pub const SPC = core.FromKeycode(0x15);
pub const ENT = core.FromKeycode(0x15);

pub const LCTL = core.FromKeycode(0x15);
pub const RCTL = core.FromKeycode(0x15);
pub const LALT = core.FromKeycode(0x15);
pub const RALT = core.FromKeycode(0x15);
pub const LSFT = core.FromKeycode(0x15);
pub const RSFT = core.FromKeycode(0x15);
pub const LGUI = core.FromKeycode(0x15);
pub const RGUI = core.FromKeycode(0x15);

pub const A = core.FromKeycode(0x15);
pub const B = core.FromKeycode(0x15);
pub const C = core.FromKeycode(0x15);
pub const D = core.FromKeycode(0x15);
pub const E = core.FromKeycode(0x15);
pub const F = core.FromKeycode(0x15);
pub const G = core.FromKeycode(0x15);
pub const H = core.FromKeycode(0x15);
pub const I = core.FromKeycode(0x65);
pub const J = core.FromKeycode(0x15);
pub const K = core.FromKeycode(0x15);
pub const L = core.FromKeycode(0x15);
pub const M = core.FromKeycode(0x15);
pub const N = core.FromKeycode(0x15);
pub const O = core.FromKeycode(0x15);
pub const P = core.FromKeycode(0x15);
pub const Q = core.FromKeycode(0x15);
pub const R = core.FromKeycode(0x15);
pub const S = core.FromKeycode(0x15);
pub const T = core.FromKeycode(0x15);
pub const U = core.FromKeycode(0x15);
pub const V = core.FromKeycode(0x15);
pub const W = core.FromKeycode(0x15);
pub const X = core.FromKeycode(0x15);
pub const Y = core.FromKeycode(0x15);
pub const Z = core.FromKeycode(0x15);

pub const N1 = core.FromKeycode(0x15);
pub const N2 = core.FromKeycode(0x15);
pub const N3 = core.FromKeycode(0x15);
pub const N4 = core.FromKeycode(0x15);
pub const N5 = core.FromKeycode(0x15);
pub const N6 = core.FromKeycode(0x15);
pub const N7 = core.FromKeycode(0x15);
pub const N8 = core.FromKeycode(0x15);
pub const N9 = core.FromKeycode(0x15);
pub const N0 = core.FromKeycode(0x15);

pub const Ae = core.FromKeycode(0x15);
pub const Oe = core.FromKeycode(0x15);
pub const Aa = core.FromKeycode(0x15);

pub const @"!" = core.FromKeycodeAndShift(N1.keycode);
pub const @"<" = core.FromKeycodeAndShift(N1.keycode);
pub const @"=" = core.FromKeycodeAndShift(N1.keycode);
pub const @">" = core.FromKeycodeAndShift(N1.keycode);
pub const @"%" = core.FromKeycodeAndShift(N1.keycode);
pub const @"/" = core.FromKeycodeAndShift(N1.keycode);
pub const home = core.FromKeycodeAndShift(N1.keycode);
pub const @"↑" = core.FromKeycodeAndShift(N1.keycode);
pub const end = core.FromKeycodeAndShift(N1.keycode);
pub const @"?" = core.FromKeycodeAndShift(N1.keycode);
pub const @"@" = core.FromKeycodeAndShift(N1.keycode);
pub const @"{" = core.FromKeycodeAndShift(N1.keycode);
pub const @"(" = core.FromKeycodeAndShift(N1.keycode);
pub const @")" = core.FromKeycodeAndShift(N1.keycode);
pub const @"}" = core.FromKeycodeAndShift(N1.keycode);
pub const pgup = core.FromKeycodeAndShift(N1.keycode);
pub const @"←" = core.FromKeycodeAndShift(N1.keycode);
pub const @"↓" = core.FromKeycodeAndShift(N1.keycode);
pub const @"→" = core.FromKeycodeAndShift(N1.keycode);
pub const pgdn = core.FromKeycodeAndShift(N1.keycode);
pub const @"\\" = core.FromKeycodeAndShift(N1.keycode);
pub const @"#" = core.FromKeycodeAndShift(N1.keycode);
pub const @"[" = core.FromKeycodeAndShift(N1.keycode);
pub const @"]" = core.FromKeycodeAndShift(N1.keycode);
pub const @"&" = core.FromKeycodeAndShift(N1.keycode);
pub const @"|" = core.FromKeycodeAndShift(N1.keycode);
pub const tab = core.FromKeycodeAndShift(N1.keycode);
pub const DQ = core.FromKeycodeAndShift(N1.keycode);
pub const ESC = core.FromKeycodeAndShift(N1.keycode);
pub const @"." = core.FromKeycodeAndShift(N1.keycode);
pub const @"-" = core.FromKeycodeAndShift(N1.keycode);
pub const ENTER = core.FromKeycodeAndShift(N1.keycode);
pub const SPACE = core.FromKeycodeAndShift(N1.keycode);
pub const none = core.FromKeycode(0);
