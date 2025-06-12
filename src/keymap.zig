const std = @import("std");

/// This imports the separate Gmodule containing `root.zig`. Take a look in `build.zig` for details.
const core = @import("core/types.zig");

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
                            HL(ENTER, 1),    HL(SPC, 2)
    },

    [_]core.KeyDef{  //--------------------- 1 ---------------------
         @"!",     @"<", @"=",  @">",  @"%",              @"/", home, @"↑",  end, @"?",
         @"@", LA(@"{"), @"(",  @")",  @"}",              pgup, @"←", @"↓", @"→", pgdn,
        @"\\",     @"#", @"[",  @"]",  @"&",              @"|",  tab,   DQ, ESC, @"-",
                                HL(ENTER, 2),  none
    },
    
    [_]core.KeyDef{ //--------------------- 2 ---------------------  
         none, none, LGUI, none, none,              none, N7, N8, N9, none,
         none, LALT, LCTL, LSFT, none,              none, N4, N5, N6, none,
         none, none, none, none, none,              none, N1, N2, N3, none,
                                     none,      HL(N0, 1)
    }
};

pub fn main() !void {
    std.log.info("hey {any}", .{baseLayer[0][0]});
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

pub fn HL(key: core.KeyDef, layer: u8) core.KeyDef {
    var copy = key;
    copy.mods.ls = true;
    copy.layer = layer;
    return copy;
}

pub const SQ = FromKey(0x15);
pub const COM = FromKey(0x15);
pub const DO = FromKey(0x15);
pub const DASH = FromKey(0x15);
pub const DOT = FromKey(0x15);
pub const SPC = FromKey(0x15);
pub const ENT = FromKey(0x15);

pub const LCTL = FromKey(0x15);
pub const RCTL = FromKey(0x15);
pub const LALT = FromKey(0x15);
pub const RALT = FromKey(0x15);
pub const LSFT = FromKey(0x15);
pub const RSFT = FromKey(0x15);
pub const LGUI = FromKey(0x15);
pub const RGUI = FromKey(0x15);

pub const A = FromKey(0x15);
pub const B = FromKey(0x15);
pub const C = FromKey(0x15);
pub const D = FromKey(0x15);
pub const E = FromKey(0x15);
pub const F = FromKey(0x15);
pub const G = FromKey(0x15);
pub const H = FromKey(0x15);
pub const I = FromKey(0x65);
pub const J = FromKey(0x15);
pub const K = FromKey(0x15);
pub const L = FromKey(0x15);
pub const M = FromKey(0x15);
pub const N = FromKey(0x15);
pub const O = FromKey(0x15);
pub const P = FromKey(0x15);
pub const Q = FromKey(0x15);
pub const R = FromKey(0x15);
pub const S = FromKey(0x15);
pub const T = FromKey(0x15);
pub const U = FromKey(0x15);
pub const V = FromKey(0x15);
pub const W = FromKey(0x15);
pub const X = FromKey(0x15);
pub const Y = FromKey(0x15);
pub const Z = FromKey(0x15);

pub const N1 = FromKey(0x15);
pub const N2 = FromKey(0x15);
pub const N3 = FromKey(0x15);
pub const N4 = FromKey(0x15);
pub const N5 = FromKey(0x15);
pub const N6 = FromKey(0x15);
pub const N7 = FromKey(0x15);
pub const N8 = FromKey(0x15);
pub const N9 = FromKey(0x15);
pub const N0 = FromKey(0x15);

pub const Ae = FromKey(0x15);
pub const Oe = FromKey(0x15);
pub const Aa = FromKey(0x15);

pub const @"!" = FromKey_LSFT(N1.keycode);
pub const @"<" = FromKey_LSFT(N1.keycode);
pub const @"=" = FromKey_LSFT(N1.keycode);
pub const @">" = FromKey_LSFT(N1.keycode);
pub const @"%" = FromKey_LSFT(N1.keycode);
pub const @"/" = FromKey_LSFT(N1.keycode);
pub const home = FromKey_LSFT(N1.keycode);
pub const @"↑" = FromKey_LSFT(N1.keycode);
pub const end = FromKey_LSFT(N1.keycode);
pub const @"?" = FromKey_LSFT(N1.keycode);
pub const @"@" = FromKey_LSFT(N1.keycode);
pub const @"{" = FromKey_LSFT(N1.keycode);
pub const @"(" = FromKey_LSFT(N1.keycode);
pub const @")" = FromKey_LSFT(N1.keycode);
pub const @"}" = FromKey_LSFT(N1.keycode);
pub const pgup = FromKey_LSFT(N1.keycode);
pub const @"←" = FromKey_LSFT(N1.keycode);
pub const @"↓" = FromKey_LSFT(N1.keycode);
pub const @"→" = FromKey_LSFT(N1.keycode);
pub const pgdn = FromKey_LSFT(N1.keycode);
pub const @"\\" = FromKey_LSFT(N1.keycode);
pub const @"#" = FromKey_LSFT(N1.keycode);
pub const @"[" = FromKey_LSFT(N1.keycode);
pub const @"]" = FromKey_LSFT(N1.keycode);
pub const @"&" = FromKey_LSFT(N1.keycode);
pub const @"|" = FromKey_LSFT(N1.keycode);
pub const tab = FromKey_LSFT(N1.keycode);
pub const DQ = FromKey_LSFT(N1.keycode);
pub const ESC = FromKey_LSFT(N1.keycode);
pub const @"." = FromKey_LSFT(N1.keycode);
pub const @"-" = FromKey_LSFT(N1.keycode);
pub const ENTER = FromKey_LSFT(N1.keycode);
pub const SPACE = FromKey_LSFT(N1.keycode);
pub const none = FromKey(0);

pub fn FromKey_LSFT(keycode: u8) core.KeyDef {
    return core.KeyDef{ .keycode = keycode, .mods = core.Mods{ .ls = true } };
}
pub fn FromKey_RAlt(keycode: u8) core.KeyDef {
    return core.KeyDef{ .keycode = keycode };
}
pub fn FromKey(keycode: u8) core.KeyDef {
    return core.KeyDef{ .keycode = keycode };
}
