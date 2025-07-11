const std = @import("std");
const core = @import("../zigmkay/core.zig");

pub const KeyCount: usize = 28;
pub const LayerCount: usize = 1;

pub const keymap = [LayerCount][KeyCount]core.KeyDef{
    // zig fmt: off
            .{ //--------------------- 0 ---------------------
    W, R, P, B,             K, L, O, U,
 N2, A, S, T, G,             M, N, E, I, Y,
    X, C, D,                   H, COMM, DOT,
          ENTER, ENTER, SPACE, SPACE
    },
};

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

const ENTER = FromKey(0x0028);
const SPACE = FromKey(0x002C);
const COMM = FromKey(0x0036);
const DOT = FromKey(0x0037);

const LC = FromKey(0x00E0);
const LS = FromKey(0x00E1);
const LA = FromKey(0x00E2);
const LG = FromKey(0x00E3);
const RC = FromKey(0x00E4);
const RS = FromKey(0x00E5);
const RA = FromKey(0x00E6);
const RG = FromKey(0x00E7);

const N1 = FromKey(0x001E);
const N2 = FromKey(0x001F);
const N3 = FromKey(0x0020);
const N4 = FromKey(0x0021);
const N5 = FromKey(0x0022);
const N6 = FromKey(0x0023);
const N7 = FromKey(0x0024);
const N8 = FromKey(0x0025);
const N9 = FromKey(0x0026);
const N0 = FromKey(0x0027);

const N2_shifted = core.KeyDef{
    .tap_keycode = N2.tap_keycode,
    .tap_modifiers = .{.left_shift = true}
};

const Ae = FromKey(0x15);
const Oe = FromKey(0x15);
const Aa = FromKey(0x15);

fn FromKey(keycode: u8) core.KeyDef {
    return core.KeyDef.TAP(keycode);
}
