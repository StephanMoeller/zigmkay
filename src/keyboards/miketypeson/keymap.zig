const dk = @import("../../keycodes/dk.zig");
const us = @import("../../keycodes/us.zig");
const std = @import("std");
const core = @import("../../zigmkay/core.zig");
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
const _______ = NONE;//core.KeyDef.transparent;

const L_BASE:usize = 0;
const L_ARROWS:usize = 1;
const L_NUM:usize = 2;
const L_BOTH:usize = 3;

pub const keymap = [_][key_count]core.KeyDef{
    .{ 
         T(dk.Q),  AF(dk.W), GUI(dk.R),   T(dk.P),        AF(dk.B),                  T(dk.K),   T(dk.L),   GUI(dk.O),       T(dk.U), T(dk.QUOT),
         T(dk.F), ALT(dk.A), CTL(dk.S), SFT(dk.T),        T(dk.G),                  T(dk.M), SFT(dk.N),   CTL(dk.E),     ALT(dk.I),    T(dk.Y),
                    T(dk.X),   T(dk.C),   T(dk.D),  T(dk.V),                  _______,   T(dk.H), T(dk.COMMA), LT(4, dk.DOT),
                                                LT(L_NUM, us.ENTER),                   LT(L_ARROWS, us.SPACE) 
    },
    // L_ARROWS
    .{ 
   T(dk.EXLM),  T(dk.LABK),    T(dk.EQL),   T(dk.RABK), T(dk.PERC),             T(dk.SLSH),  T(us.HOME),   AF(us.UP),    T(us.END),      T(dk.APP),
    T(dk.AT), ALT(dk.LCBR), CTL(dk.LPRN), SFT(dk.RPRN), T(dk.RCBR),             T(us.PGUP), AF(us.LEFT), AF(us.DOWN), AF(us.RIGHT), T(us.PGDN),
                T(dk.HASH),   T(dk.LBRC),   T(dk.RBRC),    _______,                _______,   T(dk.TAB),  T(dk.DQUO),      T(us.ESC),
                                               LT(L_NUM, us.SPACE),                _______
    }, 
    // L_NUM
    .{ 
    _______,  _______,        _______,  _______,     _______,             _______, T(dk.N7), T(dk.N8), T(dk.N9), _______,
    _______,     UNDO,           REDO,  T(us.SPACE), _______,             T(dk.N0), SFT(dk.N4),CTL(dk.N5),ALT(dk.N6), T(dk.N6),
             T(us.ESC), T(_Ctl(dk.C)),T(us.DEL),     _______,             PrintStats, T(dk.N1), T(dk.N2), T(dk.N3),
                                                     _______,             LT(L_ARROWS, us.N0)
    },
    // BOTH
    .{  
   _______,    T(us.F7),   T(us.F8),   T(us.F9), T(us.F10),            T(dk.TILD), T(us.SPACE), T(us.SPACE), T(us.SPACE), T(dk.GRV),
    T(us.BOOT), ALT(us.F4), CTL(us.F5), SFT(us.F6), T(us.F11),             T(dk.DLR),  SFT(us.BS),  CTL(us.BS),  ALT(us.BS),   _______,
                  T(us.F1),   T(us.F2),   T(us.F3), T(us.F12),            T(dk.CIRC),   T(us.DEL),   T(us.DEL),   T(us.DEL),
                                                      _______,              T(dk.N0)
    },
    .{ 
    WinNav(dk.N7), _______, WinNav(dk.N1), WinNav(dk.N6), _______,             _______, T(dk.N7), T(dk.N8), T(dk.N9), _______,         
    WinNav(dk.N4), _______, WinNav(dk.N2), WinNav(dk.N5), _______,             _______, T(dk.N4), T(dk.N5), T(dk.N6), T(dk.N6),
                   _______, WinNav(dk.N3), WinNav(dk.N8), _______,             _______, T(dk.N1), T(dk.N2), T(dk.N3),
                                                          _______,             _______
   },
};
// zig fmt: on
const LEFT_THUMB = 1;
const RIGHT_THUMB = 2;

const UNDO = T(_Ctl(dk.Z));
const REDO = T(_Ctl(dk.Y));

fn _Ctl(fire: core.KeyCodeFire) core.KeyCodeFire {
    var copy = fire;
    if (copy.tap_modifiers) |mods| {
        mods.left_ctrl = true;
    } else {
        copy.tap_modifiers = .{ .left_ctrl = true };
    }
    return copy;
}

fn _G(fire: core.KeyCodeFire) core.KeyCodeFire {
    var copy = fire;
    if (copy.tap_modifiers) |mods| {
        mods.left_shift = true;
    } else {
        copy.tap_modifiers = .{ .left_shift = true };
    }
    return copy;
}
fn C(key_press: core.KeyCodeFire, custom_hold: u8) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = .{ .key_press = key_press },
            .hold = .{ .custom = custom_hold },
            .tapping_term = tapping_term,
        },
    };
}

pub const dimensions = core.KeymapDimensions{ .key_count = key_count, .layer_count = keymap.len };
const PrintStats = core.KeyDef{ .tap_only = .{ .key_press = .{ .tap_keycode = us.KC_PRINT_STATS } } };
const tapping_term = core.TimeSpan{ .ms = 250 };
const combo_timeout = core.TimeSpan{ .ms = 50 };
pub const combos = [_]core.Combo2Def{
    Combo_Tap(.{ 1, 2 }, L_BASE, dk.J),
    Combo_Tap_HoldMod(.{ 11, 12 }, L_BASE, dk.Z, .{ .right_ctrl = true }),

    Combo_Tap_HoldMod(.{ 12, 13 }, L_BASE, dk.V, .{ .left_ctrl = true, .left_shift = true }),
    Combo_Tap_HoldMod(.{ 12, 13 }, L_NUM, _Ctl(dk.V), .{ .left_ctrl = true, .left_shift = true }),
    Combo_Tap_HoldMod(.{ 11, 12 }, L_NUM, _Ctl(dk.X), .{ .left_ctrl = true, .left_shift = true }),
    Combo_Tap_HoldMod(.{ 12, 13 }, L_ARROWS, dk.AMPR, .{ .left_ctrl = true, .left_shift = true }),

    Combo_Tap(.{ 13, 16 }, 3, core.KeyCodeFire{ .tap_keycode = us.KC_F4, .tap_modifiers = .{ .left_alt = true } }),

    Combo_Tap(.{ 23, 24 }, L_BASE, us.BOOT),
    Combo_Tap(.{ 6, 7 }, L_BASE, dk.AE),
    Combo_Tap(.{ 6, 8 }, L_BASE, dk.OE),

    Combo_Tap(.{ 7, 8 }, L_BASE, dk.AA),

    Combo_Tap(.{ 7, 8 }, L_ARROWS, dk.QUES),
    Combo_Tap(.{ 7, 8 }, L_BOTH, dk.QUES),

    Combo_Tap(.{ 1, 2 }, L_ARROWS, dk.EXLM),
    Combo_Tap(.{ 1, 2 }, L_BOTH, dk.EXLM),

    Combo_Tap_HoldMod(.{ 17, 18 }, L_BASE, dk.MINS, .{ .left_ctrl = true, .left_alt = true }),
    Combo_Tap(.{ 17, 18 }, L_ARROWS, dk.PLUS),
    Combo_Tap(.{ 16, 17 }, L_ARROWS, dk.PIPE),

    Combo_Tap(.{ 20, 21 }, L_ARROWS, dk.BSLS),
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
fn Combo_Tap_HoldMod(key_indexes: [2]core.KeyIndex, layer: core.LayerIndex, keycode_fire: core.KeyCodeFire, mods: core.Modifiers) core.Combo2Def {
    return core.Combo2Def{
        .key_indexes = key_indexes,
        .layer = layer,
        .timeout = combo_timeout,
        .key_def = core.KeyDef{ .tap_hold = .{ .tap = .{ .key_press = keycode_fire }, .hold = .{ .hold_modifiers = mods }, .tapping_term = tapping_term } },
    };
}
// autofire
const one_shot_shift = core.KeyDef{ .tap_only = .{ .one_shot = .{ .hold_modifiers = .{ .left_shift = true } } } };
fn AF(keycode_fire: core.KeyCodeFire) core.KeyDef {
    return core.KeyDef{
        .tap_with_autofire = .{
            .tap = .{ .key_press = keycode_fire },
            .repeat_interval = .{ .ms = 50 },
            .initial_delay = .{ .ms = 150 },
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
fn WinNav(keycode: core.KeyCodeFire) core.KeyDef {
    return core.KeyDef{
        .tap_only = .{ .key_press = .{ .tap_keycode = keycode.tap_keycode, .tap_modifiers = .{ .left_gui = true } } },
    };
}
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
            .tapping_term = .{ .ms = 750 },
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
    switch (event) {
        .OnHoldEnterAfter => |_| {
            layers.set_layer_state(3, layers.is_layer_active(1) and layers.is_layer_active(2));
        },
        .OnHoldExitAfter => |_| {
            layers.set_layer_state(3, layers.is_layer_active(1) and layers.is_layer_active(2));
        },
        .OnTapExitAfter => |data| {
            if (data.tap.key_press) |key_fire| {
                if (key_fire.dead) {
                    output_queue.tap_key(us.SPACE) catch {};
                }
            }
        },
        else => {},
    }
}
pub const custom_functions = core.CustomFunctions{
    .on_event = on_event,
};
