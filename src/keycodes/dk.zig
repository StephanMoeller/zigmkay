// These keycodes are copied from the qmk project under the gpl2 license
const core = @import("../zigmkay/zigmkay.zig").core;
const us = @import("us.zig");
pub const HALF = core.TapDef{ .tap_keycode = us.KC_GRAVE }; // ½
pub const N1 = core.TapDef{ .tap_keycode = us.KC_1 }; // 1
pub const N2 = core.TapDef{ .tap_keycode = us.KC_2 }; // 2
pub const N3 = core.TapDef{ .tap_keycode = us.KC_3 }; // 3
pub const N4 = core.TapDef{ .tap_keycode = us.KC_4 }; // 4
pub const N5 = core.TapDef{ .tap_keycode = us.KC_5 }; // 5
pub const N6 = core.TapDef{ .tap_keycode = us.KC_6 }; // 6
pub const N7 = core.TapDef{ .tap_keycode = us.KC_7 }; // 7
pub const N8 = core.TapDef{ .tap_keycode = us.KC_8 }; // 8
pub const N9 = core.TapDef{ .tap_keycode = us.KC_9 }; // 9
pub const N0 = core.TapDef{ .tap_keycode = us.KC_0 }; // 0
pub const PLUS = core.TapDef{ .tap_keycode = us.KC_MINS }; // +
pub const ACUT = core.TapDef{ .tap_keycode = us.KC_EQL }; // ´ (dead)
pub const Q = core.TapDef{ .tap_keycode = us.KC_Q }; // Q
pub const W = core.TapDef{ .tap_keycode = us.KC_W }; // W
pub const E = core.TapDef{ .tap_keycode = us.KC_E }; // E
pub const R = core.TapDef{ .tap_keycode = us.KC_R }; // R
pub const T = core.TapDef{ .tap_keycode = us.KC_T }; // T
pub const Y = core.TapDef{ .tap_keycode = us.KC_Y }; // Y
pub const U = core.TapDef{ .tap_keycode = us.KC_U }; // U
pub const I = core.TapDef{ .tap_keycode = us.KC_I }; // I
pub const O = core.TapDef{ .tap_keycode = us.KC_O }; // O
pub const P = core.TapDef{ .tap_keycode = us.KC_P }; // P
pub const ARNG = core.TapDef{ .tap_keycode = us.KC_LBRC }; // Å
pub const DIAE = core.TapDef{ .tap_keycode = us.KC_RBRC }; // ¨ (dead)
pub const A = core.TapDef{ .tap_keycode = us.KC_A }; // A
pub const S = core.TapDef{ .tap_keycode = us.KC_S }; // S
pub const D = core.TapDef{ .tap_keycode = us.KC_D }; // D
pub const F = core.TapDef{ .tap_keycode = us.KC_F }; // F
pub const G = core.TapDef{ .tap_keycode = us.KC_G }; // G
pub const H = core.TapDef{ .tap_keycode = us.KC_H }; // H
pub const J = core.TapDef{ .tap_keycode = us.KC_J }; // J
pub const K = core.TapDef{ .tap_keycode = us.KC_K }; // K
pub const L = core.TapDef{ .tap_keycode = us.KC_L }; // L
pub const AE = core.TapDef{ .tap_keycode = us.KC_SCLN }; // Æ
pub const OSTR = core.TapDef{ .tap_keycode = us.KC_QUOT }; // Ø
pub const QUOT = core.TapDef{ .tap_keycode = us.KC_NONUS_HASH }; // '
pub const LABK = core.TapDef{ .tap_keycode = us.NUBS.tap_keycode }; // <
pub const Z = core.TapDef{ .tap_keycode = us.KC_Z }; // Z
pub const X = core.TapDef{ .tap_keycode = us.KC_X }; // X
pub const C = core.TapDef{ .tap_keycode = us.KC_C }; // C
pub const V = core.TapDef{ .tap_keycode = us.KC_V }; // V
pub const B = core.TapDef{ .tap_keycode = us.KC_B }; // B
pub const N = core.TapDef{ .tap_keycode = us.KC_N }; // N
pub const M = core.TapDef{ .tap_keycode = us.KC_M }; // M
pub const COMMA = core.TapDef{ .tap_keycode = us.KC_COMMA }; // ,
pub const DOT = core.TapDef{ .tap_keycode = us.KC_DOT }; // .
pub const MINS = core.TapDef{ .tap_keycode = us.KC_SLSH }; // -
//
pub const SECT = core.TapDef{ .tap_keycode = us.KC_GRAVE, .tap_modifiers = .{ .left_shift = true } }; // §
pub const EXLM = core.TapDef{ .tap_keycode = us.KC_1, .tap_modifiers = .{ .left_shift = true } }; // !
pub const DQUO = core.TapDef{ .tap_keycode = us.KC_2, .tap_modifiers = .{ .left_shift = true } }; // "
pub const HASH = core.TapDef{ .tap_keycode = us.KC_3, .tap_modifiers = .{ .left_shift = true } }; // #
pub const CURR = core.TapDef{ .tap_keycode = us.KC_4, .tap_modifiers = .{ .left_shift = true } }; // ¤
pub const PERC = core.TapDef{ .tap_keycode = us.KC_5, .tap_modifiers = .{ .left_shift = true } }; // %
pub const AMPR = core.TapDef{ .tap_keycode = us.KC_6, .tap_modifiers = .{ .left_shift = true } }; // &
pub const SLSH = core.TapDef{ .tap_keycode = us.KC_7, .tap_modifiers = .{ .left_shift = true } }; // /
pub const LPRN = core.TapDef{ .tap_keycode = us.KC_8, .tap_modifiers = .{ .left_shift = true } }; // (
pub const RPRN = core.TapDef{ .tap_keycode = us.KC_9, .tap_modifiers = .{ .left_shift = true } }; // )
pub const EQL = core.TapDef{ .tap_keycode = us.KC_0, .tap_modifiers = .{ .left_shift = true } }; // =
pub const QUES = core.TapDef{ .tap_keycode = us.KC_MINUS, .tap_modifiers = .{ .left_shift = true } }; // ?
pub const GRV = core.TapDef{ .tap_keycode = us.KC_EQUAL, .tap_modifiers = .{ .left_shift = true } }; // ` (dead)
pub const CIRC = core.TapDef{ .tap_keycode = us.KC_RBRC, .tap_modifiers = .{ .left_shift = true } }; // ^ (dead)
pub const ASTR = core.TapDef{ .tap_keycode = us.KC_NUHS, .tap_modifiers = .{ .left_shift = true } }; // *
pub const RABK = core.TapDef{ .tap_keycode = us.NUBS.tap_keycode, .tap_modifiers = .{ .left_shift = true } }; // >
pub const SCLN = core.TapDef{ .tap_keycode = us.KC_COMMA, .tap_modifiers = .{ .left_shift = true } }; // ;
pub const COLN = core.TapDef{ .tap_keycode = us.KC_DOT, .tap_modifiers = .{ .left_shift = true } }; // :
pub const UNDS = core.TapDef{ .tap_keycode = us.KC_SLSH, .tap_modifiers = .{ .left_shift = true } }; // _
pub const AT = core.TapDef{ .tap_keycode = us.KC_2, .tap_modifiers = .{ .right_alt = true } }; // @
pub const PND = core.TapDef{ .tap_keycode = us.KC_3, .tap_modifiers = .{ .right_alt = true } }; // £
pub const DLR = core.TapDef{ .tap_keycode = us.KC_4, .tap_modifiers = .{ .right_alt = true } }; // $
pub const EURO = core.TapDef{ .tap_keycode = us.KC_5, .tap_modifiers = .{ .right_alt = true } }; // €
pub const LCBR = core.TapDef{ .tap_keycode = us.KC_7, .tap_modifiers = .{ .right_alt = true } }; // {
pub const LBRC = core.TapDef{ .tap_keycode = us.KC_8, .tap_modifiers = .{ .right_alt = true } }; // [
pub const RBRC = core.TapDef{ .tap_keycode = us.KC_9, .tap_modifiers = .{ .right_alt = true } }; // ]
pub const RCBR = core.TapDef{ .tap_keycode = us.KC_0, .tap_modifiers = .{ .right_alt = true } }; // }
pub const PIPE = core.TapDef{ .tap_keycode = us.KC_EQUAL, .tap_modifiers = .{ .right_alt = true } }; // |
pub const TILD = core.TapDef{ .tap_keycode = us.KC_RBRC, .tap_modifiers = .{ .right_alt = true } }; // ~ (dead)
pub const BSLS = core.TapDef{ .tap_keycode = us.KC_NONUS_BACKSLASH, .tap_modifiers = .{ .right_alt = true } }; // (backslash)
pub const MICR = core.TapDef{ .tap_keycode = us.M, .tap_modifiers = .{ .right_alt = true } }; // µ
//LABK#define DK_MICR ALGR(DK_M)    // µ
pub const TAB = us.TAB;
