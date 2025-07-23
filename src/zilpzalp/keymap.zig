const std = @import("std");
const core = @import("../zigmkay/core.zig");

pub const dimensions = core.KeymapDimensions{ .key_count = 28, .layer_count = 2 };

pub const keymap = [dimensions.layer_count][dimensions.key_count]core.KeyDef{
    // zig fmt: off
            .{ //--------------------- 0 ---------------------
    W, R, P,     B,        K,     L,    O, U,
 F, A, S, LS(T), G,     M, LS(N), E,    I, Y,
    X, C, D,               H,     COMM, DOT,
          ENTER, layer_1, MAGIC, SPACE
    },
.{ //--------------------- 0 ---------------------
    N1, N2, N3, B,             K, L, O, U,
 left_shift, A, S, T, G,             M, N, E, I, tuborg_start,
    X, C, D,                   H, COMM, DOT,
          ENTER, layer_1, MAGIC, SPACE
    },

};

const layer_1 = core.KeyDef.MO(1);
const left_shift = HoldMod(.{.left_shift = true });
const MAGIC = FromKey(1);
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
fn apply_mods(key_def: core.KeyDef, mods: core.Modifiers) core.KeyDef
{
    switch(key_def){
        .tap_only => |tap| {
            return core.KeyDef{.tap_hold = .{.tap = tap, .hold = core.HoldDef{.hold_modifiers = mods}, .retro_tapping = false, .tapping_term_ms = 250},};
        },
        .hold_only => |hold| {
            return core.KeyDef{.hold_only = .{.hold = core.HoldDef{.hold_layer = hold.hold_layer, .hold_modifiers = mods, .retro_tapping = false, .tapping_term_ms = 250,}}};
        },
        .tap_hold => |tap_hold| {
            return core.KeyDef{.tap_hold = .{.tap = tap_hold.tap, .hold = core.HoldDef{.hold_modifiers = mods}, .retro_tapping = false, .tapping_term_ms = 250},};
 
    },
        else => unreachable,
}} 
fn LS(key_def: core.KeyDef) core.KeyDef{
    return apply_mods(key_def, .{.left_shift = true});
}
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

const tuborg_start = core.KeyDef{
    .tap_only = .{
        .tap_keycode = N7.tap_only.tap_keycode,
        .tap_modifiers = .{.right_alt = true},
    }
};

const Ae = FromKey(0x15);
const Oe = FromKey(0x15);
const Aa = FromKey(0x15);

fn FromKey(keycode: u8) core.KeyDef {
    return core.KeyDef.TAP(keycode);
}
fn HoldMod(mod: core.Modifiers) core.KeyDef {
    return core.KeyDef.HOLD_MOD(mod);
}
