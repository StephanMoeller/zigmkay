const dk = @import("../../keycodes/dk.zig");
const us = @import("../../keycodes/us.zig");
const std = @import("std");
const core = @import("../../zigmkay/core.zig");
const microzig = @import("microzig");

const rp2xxx = microzig.hal;

pub const key_count = 14;

// zig fmt: off
pub const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO6 = .{ .name = "col", .direction = .out },

    .GPIO7 = .{ .name = "k7", .direction = .in },
    .GPIO8 = .{ .name = "k8", .direction = .in },
    .GPIO9 = .{ .name = "k9", .direction = .in },
    .GPIO12 = .{ .name = "k12", .direction = .in },
    .GPIO13 = .{ .name = "k13", .direction = .in },
    .GPIO14 = .{ .name = "k14", .direction = .in },
    .GPIO15 = .{ .name = "k15", .direction = .in },
    .GPIO16 = .{ .name = "k16", .direction = .in },
    .GPIO21 = .{ .name = "k21", .direction = .in },
    .GPIO23 = .{ .name = "k23", .direction = .in },
    .GPIO20 = .{ .name = "k20", .direction = .in },
    .GPIO22 = .{ .name = "k22", .direction = .in },
    .GPIO26 = .{ .name = "k26", .direction = .in },
    .GPIO27 = .{ .name = "k27", .direction = .in },
};
pub const p = pin_config.pins();

pub const pin_mappings = [key_count][2]usize{
   .{0,0},.{0,1},.{0,2},.{0,3},.{0,4},  
   .{0,5},.{0,6},.{0,7},.{0,8},.{0,9},  
   .{0,10},.{0,11},.{0,12},.{0,13}, 
                               
};
pub const pin_cols = [_]rp2xxx.gpio.Pin{ p.col };
pub const pin_rows = [_]rp2xxx.gpio.Pin{ p.k7, p.k8, p.k9, p.k12, p.k13, p.k14, p.k15, p.k16, p.k21, p.k23, p.k20, p.k22, p.k26, p.k27 };

const NONE = core.KeyDef.none;
const _______ = NONE;//core.KeyDef.transparent;
const L_BASE:usize = 0;
const L_ARROWS:usize = 1;
const L_NUM:usize = 2;
const L_EMPTY: usize = 3;
const L_BOTH:usize = 4;
const L_WIN:usize = 5;

pub const keymap = [_][key_count]core.KeyDef{
    .{ 
          T(dk.K),   T(dk.L),    LT(L_EMPTY,dk.O),       T(dk.U), T(dk.QUOT),
          T(dk.M), SFT(dk.N),   CTL(dk.E),     ALT(dk.I),    T(dk.Y),
          T(dk.P),  GUI(dk.H), T(dk.COMMA), LT(L_WIN, dk.DOT),
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

fn _Sft(fire: core.KeyCodeFire) core.KeyCodeFire {
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

    Combo_Tap(.{ 13, 16 }, L_BOTH, core.KeyCodeFire{ .tap_keycode = us.KC_F4, .tap_modifiers = .{ .left_alt = true } }),

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
fn MO(layer_index: core.LayerIndex) core.KeyDef {
    return core.KeyDef{
        .hold = .{ .hold_layer = layer_index },
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
            layers.set_layer_state(L_BOTH, layers.is_layer_active(L_ARROWS) and layers.is_layer_active(L_EMPTY));
        },
        .OnHoldExitAfter => |_| {
            layers.set_layer_state(L_BOTH, layers.is_layer_active(L_ARROWS) and layers.is_layer_active(L_EMPTY));
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
