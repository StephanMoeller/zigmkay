const std = @import("std");
const core = @import("../zigmkay/core.zig");

pub const KeyCount: usize = 28;
pub const LayerCount: usize = 1;

pub const keymap = [LayerCount][KeyCount]core.KeyDef{
    // zig fmt: off
            .{ //--------------------- 0 ---------------------
    W, R, P, B,             K, L, O, U,
 F, A, S, T, G,             M, N, E, I, Y,
    X, C, D,                   H, H, H,
          ENTER, ENTER, SPACE, SPACE
    },
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

const A = FromKey(4);
const B = FromKey(5);
const C = FromKey(6);
const D = FromKey(7);
const E = FromKey(8);
const F = FromKey(9);
const G = FromKey(10);
const H = FromKey(11);
const I = FromKey(12);
const J = FromKey(13);
const K = FromKey(14);
const L = FromKey(15);
const M = FromKey(16);
const N = FromKey(17);
const O = FromKey(18);
const P = FromKey(19);
const Q = FromKey(20);
const R = FromKey(21);
const S = FromKey(22);
const T = FromKey(23);
const U = FromKey(24);
const V = FromKey(25);
const W = FromKey(26);
const X = FromKey(27);
const Y = FromKey(28);
const Z = FromKey(29);

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
