const dk = @import("../../../keycodes/dk.zig");
const us = @import("../../../keycodes/us.zig");
const std = @import("std");
const core = @import("../../../zigmkay/core.zig");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;

pub const key_count = 30;

// zig fmt: off
pub const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{ .name = "led_red", .direction = .out },
    .GPIO16 = .{ .name = "led_green", .direction = .out },
    .GPIO25 = .{ .name = "led_blue", .direction = .out },

    .GPIO26 = .{ .name = "c0", .direction = .out },
    .GPIO27 = .{ .name = "c1", .direction = .out },
    .GPIO28 = .{ .name = "c2", .direction = .out },
    .GPIO29 = .{ .name = "c3", .direction = .out },
    .GPIO6 = .{ .name = "c4", .direction = .out },

    .GPIO7 = .{ .name = "r0", .direction = .in },
    .GPIO0 = .{ .name = "r1", .direction = .in },
    .GPIO3 = .{ .name = "r2", .direction = .in },

    .GPIO4 = .{ .name = "r3", .direction = .in },
    .GPIO2 = .{ .name = "r4", .direction = .in },
    .GPIO1 = .{ .name = "r5", .direction = .in },
};
pub const p = pin_config.pins();

pub const pin_mappings = [key_count][2]usize{
   .{4,0},.{3,0},.{2,0},.{1,0},.{0,0},  .{0,5},.{1,5},.{2,5},.{3,5},.{4,5},
   .{4,1},.{3,1},.{2,1},.{1,1},.{0,1},  .{0,4},.{1,4},.{2,4},.{3,4},.{4,4},
          .{3,2},.{2,2},.{1,2},.{0,2},  .{0,3},.{1,3},.{2,3},.{3,3},
                               .{4,2},  .{4,3}
};
pub const pin_cols = [_]rp2xxx.gpio.Pin{ p.c0, p.c1, p.c2, p.c3, p.c4 };
pub const pin_rows = [_]rp2xxx.gpio.Pin{ p.r0, p.r1, p.r2, p.r3, p.r4, p.r5 };

const NONE = core.KeyDef.none;
const _______ = core.KeyDef.transparent;
pub const keymap = [_][key_count]core.KeyDef{
    .{ 
     AF(dk.Q), AF(dk.W), GUI(dk.R),   T(dk.P),  AF(dk.B),      T(dk.K),   T(dk.L), GUI(dk.O),        T(dk.U), T(dk.QUOT),
    T(dk.F), ALT(dk.A), CTL(dk.S), SFT(dk.T),  T(dk.G),      T(dk.M), SFT(dk.N), CTL(dk.E),      ALT(dk.I), T(dk.Y),
               T(dk.X),   T(dk.C),   T(dk.D),  T(dk.V),       T(dk.J),T(dk.H),    T(dk.COMMA), T(dk.DOT),
                                 LT(2, us.ENTER),                LT(1, us.SPACE)
    },
    .{ 
    _______, T(dk.LABK), T(dk.EQL),  T(dk.RABK), T(dk.PERC),          T(dk.SLSH),  T(us.HOME),     AF(us.UP),   T(us.END), _______,
    T(dk.AT), ALT(dk.LCBR), CTL(dk.LPRN), SFT(dk.RPRN), T(dk.RCBR),   T(us.PGUP), AF(us.LEFT), AF(us.DOWN), AF(us.RIGHT), T(us.PGDN),
              T(dk.BSLS), T(dk.LBRC), T(dk.RBRC),  _______,           _______,    T(us.TAB),     T(dk.DQUO),     T(us.ESC),
                                           LT(2, us.SPACE),           _______
    }, 
    .{ 
    _______, _______, _______, _______, _______,             _______, T(dk.N7), T(dk.N8), T(dk.N9), _______,         
    _______, _______, _______, _______, _______,             _______, T(dk.N4), T(dk.N5), T(dk.N6), T(dk.N6),
             _______, _______, _______, _______,             _______, T(dk.N1), T(dk.N2), T(dk.N3),
                            _______,                            LT(1, dk.N0)
    },
    .{ 
    _______, PrintStats, _______, _______, _______,          _______, T(us.SPACE), T(us.SPACE), T(us.SPACE), _______,
    _______, _______, _______, _______, _______,             _______, T(us.BS),    T(us.BS),    T(us.BS),    _______,
             _______, _______, _______, _______,             _______, T(us.DEL),   T(us.DEL),   T(us.DEL),
                                        _______,             T(dk.N0)
    }
};
// zig fmt: on
pub const dimensions = core.KeymapDimensions{ .key_count = key_count, .layer_count = keymap.len };
const PrintStats = core.KeyDef{ .tap_only = .{ .key_press = .{ .tap_keycode = us.KC_PRINT_STATS } } };
const tapping_term = core.TimeSpan{ .ms = 250 };
const combo_timeout = core.TimeSpan{ .ms = 30 };
pub const combos = [_]core.Combo2Def{
    Combo_Tap(.{ 0, 1 }, 0, dk.J),
    Combo_Tap(.{ 9, 10 }, 0, dk.Z),
    Combo_Tap(.{ 12, 13 }, 0, dk.V),
    Combo_Tap(.{ 0, 9 }, 0, us.BOOT),
    Combo_Tap(.{ 6, 7 }, 0, dk.AE),
    Combo_Tap(.{ 6, 8 }, 0, dk.OE),
    Combo_Tap(.{ 7, 8 }, 0, dk.AA),
    Combo_Tap(.{ 17, 18 }, 0, dk.MINS),
};

// For now, all these shortcuts are placed in the custom keymap to let the user know how they are defined
// but maybe there should be some sort of helper module containing all of these
fn Combo_Tap(key_indexes: [2]core.KeyIndex, layer: core.LayerIndex, keycode_fire: core.KeyCodeFire) core.Combo2Def {
    return core.Combo2Def{
        .key_indexes = key_indexes,
        .layer = layer,
        .timeout = combo_timeout,
        .key_def = core.KeyDef{ .tap_only = .{ .key_press = keycode_fire } },
    };
}

// autofire
fn AF(keycode_fire: core.KeyCodeFire) core.KeyDef {
    return core.KeyDef{
        .tap_with_autofire = .{
            .tap = .{ .key_press = keycode_fire },
            .repeat_interval = .{ .ms = 50 },
            .initial_delay = .{ .ms = 100 },
        },
    };
}
fn LT(layer_index: core.LayerIndex, keycode_fire: core.KeyCodeFire) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = .{ .key_press = keycode_fire },
            .hold = .{ .hold_layer = layer_index },
            .tapping_term = tapping_term,
        },
    };
}
// T for 'Tap-only'
fn T(keycode_fire: core.KeyCodeFire) core.KeyDef {
    return core.KeyDef{
        .tap_only = .{ .key_press = keycode_fire },
    };
}
fn GUI(keycode_fire: core.KeyCodeFire) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = .{ .key_press = keycode_fire },
            .hold = core.HoldDef{ .hold_modifiers = .{ .left_gui = true } },
            .tapping_term = tapping_term,
        },
    };
}
fn CTL(keycode_fire: core.KeyCodeFire) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = .{ .key_press = keycode_fire },
            .hold = core.HoldDef{ .hold_modifiers = .{ .left_ctrl = true } },
            .tapping_term = tapping_term,
        },
    };
}
fn ALT(keycode_fire: core.KeyCodeFire) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = .{ .key_press = keycode_fire },
            .hold = core.HoldDef{ .hold_modifiers = .{ .left_alt = true } },
            .tapping_term = tapping_term,
        },
    };
}
fn SFT(keycode_fire: core.KeyCodeFire) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = .{ .key_press = keycode_fire },
            .hold = core.HoldDef{ .hold_modifiers = .{ .left_shift = true } },
            .tapping_term = tapping_term,
        },
    };
}

fn on_event(event: core.ProcessorEvent, layers: *core.LayerActivations, output_queue: *core.OutputCommandQueue) void {
    _ = output_queue;
    switch (event) {
        .OnHoldEnterAfter => |data| {
            _ = data;
            layers.set_layer_state(3, layers.is_layer_active(1) and layers.is_layer_active(2));
        },
        .OnHoldExitAfter => |data| {
            _ = data;
            layers.set_layer_state(3, layers.is_layer_active(1) and layers.is_layer_active(2));
        },
        else => {},
    }
}
pub const custom_functions = core.CustomFunctions{
    .on_event = on_event,
};
