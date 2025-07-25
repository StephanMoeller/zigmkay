const kc = @import("../keycodes/dk.zig");
const std = @import("std");
const core = @import("../zigmkay/core.zig");

pub const key_count = 28;

// zig fmt: off

pub const keymap = [_][key_count]core.KeyDef{
// layer 0
    .{ 
               T(kc.W),   T(kc.R), GUI(kc.P), T(kc.B),      T(kc.K), GUI(kc.L),   T(kc.O),       T(kc.U),
    T(kc.F), ALT(kc.A), CTL(kc.S), SFT(kc.T), T(kc.G),      T(kc.M), SFT(kc.N), CTL(kc.E),     ALT(kc.I),  T(kc.Y),
               T(kc.X),   T(kc.C),   T(kc.D),                         T(kc.H),    T(kc.COMMA),   T(kc.DOT),
          LT(2, kc.ENTER), core.KeyDef.NONE(), core.KeyDef.NONE(), LT(1, kc.SPACE)
    },

    // Layer 1: arrows keys and symbols
    .{ 
             _______, _______, _______, _______,             _______, _______,     T(kc.UP),    _______,
    _______, _______, _______, _______, _______,             _______, T(kc.LEFT), T(kc.DOWN), T(kc.RIGHT), _______,
             _______, _______, _______,                               _______,     _______,     _______,
                       LT(1, kc.SPACE), _______,    _______, _______
    }, 

    // Layer 2: numbers
    .{ 
          T(kc.BOOT), _______, _______, _______,             _______, T(kc.N7), T(kc.N8), T(kc.N9),
    _______, _______, _______, _______, _______,             _______, T(kc.N4), T(kc.N5), T(kc.N6), T(kc.N6),
             _______, _______, _______,                               T(kc.N1), T(kc.N2), T(kc.N3),
                               _______, _______,    _______, T(kc.N0)
    },

    // Layer 3: backspace
    .{ 
             _______, _______, _______, _______,             _______, T(kc.SPACE), T(kc.SPACE), T(kc.SPACE),
    _______, _______, _______, _______, _______,             _______, T(kc_bs),    T(kc_bs),    T(kc_bs),    _______,
             _______, _______, _______,                               T(kc_del),   T(kc_del),   T(kc_del),
                       _______, _______,    _______, T(kc.N0)
    }

};
// zig fmt: on
pub const dimensions = core.KeymapDimensions{ .key_count = key_count, .layer_count = keymap.len };
const _______ = core.KeyDef.TRANSPARENT();
pub const kc_bs = kc.BACKSPACE;
pub const kc_del = kc.DELETE;
const tapping_term_us = 250 * 1000; // 250 ms = 250,000 micro seconds

fn LT(layer_index: core.LayerIndex, keycode: u8) core.KeyDef {
    return core.KeyDef.LT(layer_index, keycode, .{}, tapping_term_us);
}
fn T(keycode: u8) core.KeyDef {
    return core.KeyDef.TAP(keycode);
}
fn GUI(keycode: u8) core.KeyDef {
    return core.KeyDef.MT(core.TapDef{ .tap_keycode = keycode }, .{ .left_gui = true }, tapping_term_us);
}
fn CTL(keycode: u8) core.KeyDef {
    return core.KeyDef.MT(core.TapDef{ .tap_keycode = keycode }, .{ .left_ctrl = true }, tapping_term_us);
}
fn ALT(keycode: u8) core.KeyDef {
    return core.KeyDef.MT(core.TapDef{ .tap_keycode = keycode }, .{ .left_alt = true }, tapping_term_us);
}
fn SFT(keycode: u8) core.KeyDef {
    return core.KeyDef.MT(core.TapDef{ .tap_keycode = keycode }, .{ .left_shift = true }, tapping_term_us);
}
