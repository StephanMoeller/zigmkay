// These keycodes are copied from the qmk project under the gpl2 license
const core = @import("../zigmkay/zigmkay.zig").core;
const us = @import("us.zig");
pub const HALF = core.KeyCodeFire{ .tap_keycode = us.KC_GRAVE }; // ½
pub const N1 = core.KeyCodeFire{ .tap_keycode = us.KC_1 }; // 1
pub const N2 = core.KeyCodeFire{ .tap_keycode = us.KC_2 }; // 2
pub const N3 = core.KeyCodeFire{ .tap_keycode = us.KC_3 }; // 3
pub const N4 = core.KeyCodeFire{ .tap_keycode = us.KC_4 }; // 4
pub const N5 = core.KeyCodeFire{ .tap_keycode = us.KC_5 }; // 5
pub const N6 = core.KeyCodeFire{ .tap_keycode = us.KC_6 }; // 6
pub const N7 = core.KeyCodeFire{ .tap_keycode = us.KC_7 }; // 7
pub const N8 = core.KeyCodeFire{ .tap_keycode = us.KC_8 }; // 8
pub const N9 = core.KeyCodeFire{ .tap_keycode = us.KC_9 }; // 9
pub const N0 = core.KeyCodeFire{ .tap_keycode = us.KC_0 }; // 0
pub const PLUS = core.KeyCodeFire{ .tap_keycode = us.KC_MINUS }; // +
pub const ACUT = core.KeyCodeFire{ .tap_keycode = us.KC_EQL }; // ´ (dead)
pub const Q = core.KeyCodeFire{ .tap_keycode = us.KC_Q }; // Q
pub const W = core.KeyCodeFire{ .tap_keycode = us.KC_W }; // W
pub const E = core.KeyCodeFire{ .tap_keycode = us.KC_E }; // E
pub const R = core.KeyCodeFire{ .tap_keycode = us.KC_R }; // R
pub const T = core.KeyCodeFire{ .tap_keycode = us.KC_T }; // T
pub const Y = core.KeyCodeFire{ .tap_keycode = us.KC_Y }; // Y
pub const U = core.KeyCodeFire{ .tap_keycode = us.KC_U }; // U
pub const I = core.KeyCodeFire{ .tap_keycode = us.KC_I }; // I
pub const O = core.KeyCodeFire{ .tap_keycode = us.KC_O }; // O
pub const P = core.KeyCodeFire{ .tap_keycode = us.KC_P }; // P
pub const AA = core.KeyCodeFire{ .tap_keycode = us.KC_LEFT_BRACKET }; // Å
pub const DIAE = core.KeyCodeFire{ .tap_keycode = us.KC_RIGHT_BRACKET }; // ¨ (dead)
pub const A = core.KeyCodeFire{ .tap_keycode = us.KC_A }; // A
pub const S = core.KeyCodeFire{ .tap_keycode = us.KC_S }; // S
pub const D = core.KeyCodeFire{ .tap_keycode = us.KC_D }; // D
pub const F = core.KeyCodeFire{ .tap_keycode = us.KC_F }; // F
pub const G = core.KeyCodeFire{ .tap_keycode = us.KC_G }; // G
pub const H = core.KeyCodeFire{ .tap_keycode = us.KC_H }; // H
pub const J = core.KeyCodeFire{ .tap_keycode = us.KC_J }; // J
pub const K = core.KeyCodeFire{ .tap_keycode = us.KC_K }; // K
pub const L = core.KeyCodeFire{ .tap_keycode = us.KC_L }; // L
pub const AE = core.KeyCodeFire{ .tap_keycode = us.KC_SEMICOLON }; // Æ
pub const OE = core.KeyCodeFire{ .tap_keycode = us.KC_QUOTE }; // Ø
pub const QUOT = core.KeyCodeFire{ .tap_keycode = us.KC_NONUS_HASH }; // '
pub const LABK = core.KeyCodeFire{ .tap_keycode = us.NUBS.tap_keycode }; // <
pub const Z = core.KeyCodeFire{ .tap_keycode = us.KC_Z }; // Z
pub const X = core.KeyCodeFire{ .tap_keycode = us.KC_X }; // X
pub const C = core.KeyCodeFire{ .tap_keycode = us.KC_C }; // C
pub const V = core.KeyCodeFire{ .tap_keycode = us.KC_V }; // V
pub const B = core.KeyCodeFire{ .tap_keycode = us.KC_B }; // B
pub const N = core.KeyCodeFire{ .tap_keycode = us.KC_N }; // N
pub const M = core.KeyCodeFire{ .tap_keycode = us.KC_M }; // M
pub const COMMA = core.KeyCodeFire{ .tap_keycode = us.KC_COMMA }; // ,
pub const DOT = core.KeyCodeFire{ .tap_keycode = us.KC_DOT }; // .
pub const MINS = core.KeyCodeFire{ .tap_keycode = us.KC_SLASH }; // -
pub const APP = us.APPLICATION; // -
//
pub const SECT = core.KeyCodeFire{ .tap_keycode = us.KC_GRAVE, .tap_modifiers = .{ .left_shift = true } }; // §
pub const EXLM = core.KeyCodeFire{ .tap_keycode = us.KC_1, .tap_modifiers = .{ .left_shift = true } }; // !
pub const DQUO = core.KeyCodeFire{ .tap_keycode = us.KC_2, .tap_modifiers = .{ .left_shift = true } }; // "
pub const HASH = core.KeyCodeFire{ .tap_keycode = us.KC_3, .tap_modifiers = .{ .left_shift = true } }; // #
pub const CURR = core.KeyCodeFire{ .tap_keycode = us.KC_4, .tap_modifiers = .{ .left_shift = true } }; // ¤
pub const PERC = core.KeyCodeFire{ .tap_keycode = us.KC_5, .tap_modifiers = .{ .left_shift = true } }; // %
pub const AMPR = core.KeyCodeFire{ .tap_keycode = us.KC_6, .tap_modifiers = .{ .left_shift = true } }; // &
pub const SLSH = core.KeyCodeFire{ .tap_keycode = us.KC_7, .tap_modifiers = .{ .left_shift = true } }; // /
pub const LPRN = core.KeyCodeFire{ .tap_keycode = us.KC_8, .tap_modifiers = .{ .left_shift = true } }; // (
pub const RPRN = core.KeyCodeFire{ .tap_keycode = us.KC_9, .tap_modifiers = .{ .left_shift = true } }; // )
pub const EQL = core.KeyCodeFire{ .tap_keycode = us.KC_0, .tap_modifiers = .{ .left_shift = true } }; // =
pub const QUES = core.KeyCodeFire{ .tap_keycode = us.KC_MINUS, .tap_modifiers = .{ .left_shift = true } }; // ?
pub const GRV = core.KeyCodeFire{ .tap_keycode = us.KC_EQUAL, .dead = true, .tap_modifiers = .{ .left_shift = true } }; // ` (dead)
pub const CIRC = core.KeyCodeFire{ .tap_keycode = us.KC_RIGHT_BRACKET, .dead = true, .tap_modifiers = .{ .left_shift = true } }; // ^ (dead)
pub const ASTR = core.KeyCodeFire{ .tap_keycode = us.KC_NONUS_HASH, .tap_modifiers = .{ .left_shift = true } }; // *
pub const RABK = core.KeyCodeFire{ .tap_keycode = us.NUBS.tap_keycode, .tap_modifiers = .{ .left_shift = true } }; // >
pub const SCLN = core.KeyCodeFire{ .tap_keycode = us.KC_COMMA, .tap_modifiers = .{ .left_shift = true } }; // ;
pub const COLN = core.KeyCodeFire{ .tap_keycode = us.KC_DOT, .tap_modifiers = .{ .left_shift = true } }; // :
pub const UNDS = core.KeyCodeFire{ .tap_keycode = us.KC_SLSH, .tap_modifiers = .{ .left_shift = true } }; // _
pub const AT = core.KeyCodeFire{ .tap_keycode = us.KC_2, .tap_modifiers = .{ .right_alt = true } }; // @
pub const PND = core.KeyCodeFire{ .tap_keycode = us.KC_3, .tap_modifiers = .{ .right_alt = true } }; // £
pub const DLR = core.KeyCodeFire{ .tap_keycode = us.KC_4, .tap_modifiers = .{ .right_alt = true } }; // $
pub const EURO = core.KeyCodeFire{ .tap_keycode = us.KC_5, .tap_modifiers = .{ .right_alt = true } }; // €
pub const LCBR = core.KeyCodeFire{ .tap_keycode = us.KC_7, .tap_modifiers = .{ .right_alt = true } }; // {
pub const LBRC = core.KeyCodeFire{ .tap_keycode = us.KC_8, .tap_modifiers = .{ .right_alt = true } }; // [
pub const RBRC = core.KeyCodeFire{ .tap_keycode = us.KC_9, .tap_modifiers = .{ .right_alt = true } }; // ]
pub const RCBR = core.KeyCodeFire{ .tap_keycode = us.KC_0, .tap_modifiers = .{ .right_alt = true } }; // }
pub const PIPE = core.KeyCodeFire{ .tap_keycode = us.KC_EQUAL, .tap_modifiers = .{ .right_alt = true } }; // |
pub const TILD = core.KeyCodeFire{ .tap_keycode = us.KC_RIGHT_BRACKET, .dead = true, .tap_modifiers = .{ .right_alt = true } }; // ~ (dead)
pub const BSLS = core.KeyCodeFire{ .tap_keycode = us.KC_NONUS_BACKSLASH, .tap_modifiers = .{ .right_alt = true } }; // (backslash)
pub const MICR = core.KeyCodeFire{ .tap_keycode = us.M, .tap_modifiers = .{ .right_alt = true } }; // µ
//LABK#define DK_MICR ALGR(DK_M)    // µ
pub const TAB = us.TAB;
