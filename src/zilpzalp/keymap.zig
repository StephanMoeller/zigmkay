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
          LT(2, kc.ENTER), NONE, NONE, LT(1, kc.SPACE)
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
pub const kc_bs = kc.BACKSPACE;
pub const kc_del = kc.DELETE;
const tapping_term_ms = 250;

fn LT(layer_index: core.LayerIndex, keycode: u8) core.KeyDef {
    return core.KeyDef{ .tap_hold = .{
        .tap = core.TapDef{ .tap_keycode = keycode },
        .hold = .{ .hold_layer = layer_index },
        .tapping_term_ms = tapping_term_ms,
    } };
}
// T for 'Tap-only'
fn T(keycode: u8) core.KeyDef {
    return core.KeyDef{
        .tap_only = core.TapDef{ .tap_keycode = keycode },
    };
}
fn GUI(keycode: u8) core.KeyDef {
    return core.KeyDef{ .tap_hold = .{
        .tap = core.TapDef{ .tap_keycode = keycode },
        .hold = core.HoldDef{ .hold_modifiers = .{ .left_gui = true } },
        .tapping_term_ms = tapping_term_ms,
    } };
}
fn CTL(keycode: u8) core.KeyDef {
    return core.KeyDef{ .tap_hold = .{
        .tap = core.TapDef{ .tap_keycode = keycode },
        .hold = core.HoldDef{ .hold_modifiers = .{ .left_ctrl = true } },
        .tapping_term_ms = tapping_term_ms,
    } };
}
fn ALT(keycode: u8) core.KeyDef {
    return core.KeyDef{ .tap_hold = .{
        .tap = core.TapDef{ .tap_keycode = keycode },
        .hold = core.HoldDef{ .hold_modifiers = .{ .left_alt = true } },
        .tapping_term_ms = tapping_term_ms,
    } };
}
fn SFT(keycode: u8) core.KeyDef {
    return core.KeyDef{ .tap_hold = .{
        .tap = core.TapDef{ .tap_keycode = keycode },
        .hold = core.HoldDef{ .hold_modifiers = .{ .left_shift = true } },
        .tapping_term_ms = tapping_term_ms,
    } };
}
const NONE = core.KeyDef.none;
const _______ = core.KeyDef.transparent;
