const kc = @import("../keycodes/dk.zig");
const std = @import("std");
const core = @import("../zigmkay/core.zig");

pub const key_count = 28;

// zig fmt: off

const combo_timeout: core.ComboTimeout = 30;
pub const keymap = [_][key_count]core.KeyDef{
    .{ 
              AF(kc.W), GUI(kc.R),   T(kc.P), AF(kc.B),      T(kc.K),   T(kc.L), GUI(kc.O),        T(kc.U),
    T(kc.F), ALT(kc.A), CTL(kc.S), SFT(kc.T),  T(kc.G),      T(kc.M), SFT(kc.N), CTL(kc.E),      ALT(kc.I), T(kc.Y),
               T(kc.X),   T(kc.C),   T(kc.D),                           T(kc.H),    T(kc.COMMA), T(kc.DOT),
                                 LT(2, kc.ENTER), NONE,      NONE, LT(1, kc.SPACE)
    },
    .{ 
             _______, _______, _______, _______,             _______,     _______,   AF(kc.UP),      _______,
    _______, _______, _______, _______, _______,             _______, AF(kc.LEFT), AF(kc.DOWN), AF(kc.RIGHT), _______,
             _______, _______, _______,                                   _______,     _______,      _______,
                       LT(2, kc.SPACE), _______,    _______, _______
    }, 
    .{ 
          T(kc.BOOT), _______, _______, _______,             _______, T(kc.N7), T(kc.N8), T(kc.N9),
    _______, _______, _______, _______, _______,             _______, T(kc.N4), T(kc.N5), T(kc.N6), T(kc.N6),
             _______, _______, _______,                               T(kc.N1), T(kc.N2), T(kc.N3),
                               _______, _______,    _______, LT(1, kc.N0)
    },
    .{ 
             _______, _______, _______, _______,             _______, T(kc.SPACE), T(kc.SPACE), T(kc.SPACE),
    _______, _______, _______, _______, _______,             _______, T(kc.BS),    T(kc.BS),    T(kc.BS),    _______,
             _______, _______, _______,                               T(kc.DEL),   T(kc.DEL),   T(kc.DEL),
                       _______, _______,    _______, T(kc.N0)
    }

};
// zig fmt: on
pub const dimensions = core.KeymapDimensions{ .key_count = key_count, .layer_count = keymap.len };
const tapping_term = core.TimeSpan{ .ms = 250 };

pub const combos = [_]core.Combo2Def{
    Combo_Tap(.{ 0, 1 }, 0, kc.J),
    Combo_Tap(.{ 9, 10 }, 0, kc.Z),
    Combo_Tap(.{ 10, 11 }, 0, kc.V),
};
fn Combo_Tap(key_indexes: [2]core.KeyIndex, layer: core.LayerIndex, keycode: u8) core.Combo2Def {
    return core.Combo2Def{
        .key_indexes = key_indexes,
        .layer = layer,
        .timeout = tapping_term,
        .key_def = core.KeyDef{ .tap_only = .{ .tap_keycode = keycode } },
    };
}

fn AF(keycode: u8) core.KeyDef {
    return core.KeyDef{
        .tap_with_autofire = .{
            .tap = .{ .tap_keycode = keycode },
            .repeat_interval = .{ .ms = 50 },
            .initial_delay = .{ .ms = 100 },
        },
    };
}
fn LT(layer_index: core.LayerIndex, keycode: u8) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = core.TapDef{ .tap_keycode = keycode },
            .hold = .{ .hold_layer = layer_index },
            .tapping_term = tapping_term,
        },
    };
}
// T for 'Tap-only'
fn T(keycode: u8) core.KeyDef {
    return core.KeyDef{
        .tap_only = core.TapDef{ .tap_keycode = keycode },
    };
}
fn GUI(keycode: u8) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = core.TapDef{ .tap_keycode = keycode },
            .hold = core.HoldDef{ .hold_modifiers = .{ .left_gui = true } },
            .tapping_term = tapping_term,
        },
    };
}
fn CTL(keycode: u8) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = core.TapDef{ .tap_keycode = keycode },
            .hold = core.HoldDef{ .hold_modifiers = .{ .left_ctrl = true } },
            .tapping_term = tapping_term,
        },
    };
}
fn ALT(keycode: u8) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = core.TapDef{ .tap_keycode = keycode },
            .hold = core.HoldDef{ .hold_modifiers = .{ .left_alt = true } },
            .tapping_term = tapping_term,
        },
    };
}
fn SFT(keycode: u8) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = core.TapDef{ .tap_keycode = keycode },
            .hold = core.HoldDef{ .hold_modifiers = .{ .left_shift = true } },
            .tapping_term = tapping_term,
        },
    };
}
const NONE = core.KeyDef.none;
const _______ = core.KeyDef.transparent;
fn on_hold_enter(layers: *core.LayerActivations) void {
    layers.set_layer_state(3, layers.is_layer_active(1) and layers.is_layer_active(2));
}
fn on_hold_exit(key: *const core.KeyDef, layers: *core.LayerActivations, modifiers: *core.ModifiersC) void {
    _ = key;
    _ = modifiers;
    // requirement: one should be able to apply mods, fire key codes and undo the mods again.
    layers.set_layer_state(3, layers.is_layer_active(1) and layers.is_layer_active(2));
}
pub const custom_functions = core.CustomFunctions{
    .on_hold_enter = on_hold_enter,
    .on_hold_exit = on_hold_exit,
};
