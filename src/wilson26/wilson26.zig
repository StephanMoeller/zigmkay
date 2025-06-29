const std = @import("std");
const core = @import("../zigmkay/core.zig");

pub const KeyCount: usize = 32;
pub const LayerCount: usize = 3;

pub const keymap = [LayerCount][KeyCount]core.KeyDef{
    // zig fmt: off
            .{ //--------------------- 0 ---------------------
                Q,     W, LG(R),     P, B,          K,     L, RG(O),     U,   SQ,
                F, LA(A), LC(S), LS(T), G,          M, RS(N), RC(E), RA(I),    Y,
                Z,     X,     C,     D, V,          J,     H,   COM,   DOT, DASH,
                                        HL(ENTER, 1), HL(SPC, 2)
            },

            .{ //--------------------- 1 ---------------------
                 @"!",     @"<", @"=", @">", @"%",      @"/", home, @"↑",  end, @"?",
                 @"@", LA(@"{"), @"(", @")", @"}",      pgup, @"←", @"↓", @"→", pgdn,
                @"\\",     @"#", @"[", @"]", @"&",      @"|",  tab,   DQ,  ESC, @"-",
                                        HL(ENTER, 2), ____,
            },

            .{ //--------------------- 2 ---------------------
                ____, ____, LGUI, ____, ____,           ____, N7, N8, N9, ____,
                ____, LALT, LCTL, LSFT, ____,           ____, N4, N5, N6, ____,
                ____, ____, ____, ____, ____,           ____, N1, N2, N3, ____,
                                                ____, HL(N0, 1),
            },
            // zig fmt: on
        };
// zig fmt: off
fn LS(key: core.KeyDef) core.KeyDef { return key; }
fn LC(key: core.KeyDef) core.KeyDef { return key; }
fn LG(key: core.KeyDef) core.KeyDef { return key; }
fn LA(key: core.KeyDef) core.KeyDef { return key; }
fn RS(key: core.KeyDef) core.KeyDef { return key; }
fn RC(key: core.KeyDef) core.KeyDef { return key; }
fn RG(key: core.KeyDef) core.KeyDef { return key; }
fn RA(key: core.KeyDef) core.KeyDef { return key; }
fn L1(key: core.KeyDef) core.KeyDef { return key; }
fn L2(key: core.KeyDef) core.KeyDef { return key; }
fn L3(key: core.KeyDef) core.KeyDef { return key; }
// zig fmt: on

fn HL(key: core.KeyDef, layer: u8) core.KeyDef {
    _ = layer;
    return key;
}

const SQ = FromKey(0x15);
const COM = FromKey(0x15);
const DO = FromKey(0x15);
const DASH = FromKey(0x15);
const DOT = FromKey(0x15);
const SPC = FromKey(0x15);
const ENT = FromKey(0x15);

const LCTL = FromKey(0x15);
const RCTL = FromKey(0x15);
const LALT = FromKey(0x15);
const RALT = FromKey(0x15);
const LSFT = FromKey(0x15);
const RSFT = FromKey(0x15);
const LGUI = FromKey(0x15);
const RGUI = FromKey(0x15);

const A = FromKey(0x15);
const B = FromKey(0x15);
const C = FromKey(0x15);
const D = FromKey(0x15);
const E = FromKey(0x15);
const F = FromKey(0x15);
const G = FromKey(0x15);
const H = FromKey(0x15);
const I = FromKey(0x65);
const J = FromKey(0x15);
const K = FromKey(0x15);
const L = FromKey(0x15);
const M = FromKey(0x15);
const N = FromKey(0x15);
const O = FromKey(0x15);
const P = FromKey(0x15);
const Q = FromKey(0x15);
const R = FromKey(0x15);
const S = FromKey(0x15);
const T = FromKey(0x15);
const U = FromKey(0x15);
const V = FromKey(0x15);
const W = FromKey(0x15);
const X = FromKey(0x15);
const Y = FromKey(0x15);
const Z = FromKey(0x15);

const N1 = FromKey(0x15);
const N2 = FromKey(0x15);
const N3 = FromKey(0x15);
const N4 = FromKey(0x15);
const N5 = FromKey(0x15);
const N6 = FromKey(0x15);
const N7 = FromKey(0x15);
const N8 = FromKey(0x15);
const N9 = FromKey(0x15);
const N0 = FromKey(0x15);

const Ae = FromKey(0x15);
const Oe = FromKey(0x15);
const Aa = FromKey(0x15);

const @"!" = FromKey_LSFT(N1.keycode);
const @"<" = FromKey_LSFT(N1.keycode);
const @"=" = FromKey_LSFT(N1.keycode);
const @">" = FromKey_LSFT(N1.keycode);
const @"%" = FromKey_LSFT(N1.keycode);
const @"/" = FromKey_LSFT(N1.keycode);
const home = FromKey_LSFT(N1.keycode);
const @"↑" = FromKey_LSFT(N1.keycode);
const end = FromKey_LSFT(N1.keycode);
const @"?" = FromKey_LSFT(N1.keycode);
const @"@" = FromKey_LSFT(N1.keycode);
const @"{" = FromKey_LSFT(N1.keycode);
const @"(" = FromKey_LSFT(N1.keycode);
const @")" = FromKey_LSFT(N1.keycode);
const @"}" = FromKey_LSFT(N1.keycode);
const pgup = FromKey_LSFT(N1.keycode);
const @"←" = FromKey_LSFT(N1.keycode);
const @"↓" = FromKey_LSFT(N1.keycode);
const @"→" = FromKey_LSFT(N1.keycode);
const pgdn = FromKey_LSFT(N1.keycode);
const @"\\" = FromKey_LSFT(N1.keycode);
const @"#" = FromKey_LSFT(N1.keycode);
const @"[" = FromKey_LSFT(N1.keycode);
const @"]" = FromKey_LSFT(N1.keycode);
const @"&" = FromKey_LSFT(N1.keycode);
const @"|" = FromKey_LSFT(N1.keycode);
const tab = FromKey_LSFT(N1.keycode);
const DQ = FromKey_LSFT(N1.keycode);
const ESC = FromKey_LSFT(N1.keycode);
const @"." = FromKey_LSFT(N1.keycode);
const @"-" = FromKey_LSFT(N1.keycode);
const ENTER = FromKey_LSFT(N1.keycode);
const SPACE = FromKey_LSFT(N1.keycode);
const ____ = FromKey(0);

fn FromKey_LSFT(keycode: u8) core.KeyDef {
    return core.KeyDef{ .keycode = keycode };
}
fn FromKey_RAlt(keycode: u8) core.KeyDef {
    return core.KeyDef{ .keycode = keycode };
}
fn FromKey(keycode: u8) core.KeyDef {
    return core.KeyDef{ .keycode = keycode };
}
