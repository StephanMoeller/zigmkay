const dk = @import("../../keycodes/dk.zig");
const us = @import("../../keycodes/us.zig");
const std = @import("std");
const core = @import("../../zigmkay/core.zig");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;

pub const key_count = 58;

pub const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{ .name = "led_red", .direction = .out },
    .GPIO16 = .{ .name = "led_green", .direction = .out },
    .GPIO25 = .{ .name = "led_blue", .direction = .out },

    .GPIO28 = .{ .name = "r0", .direction = .in },
    .GPIO27 = .{ .name = "r1", .direction = .in },
    .GPIO26 = .{ .name = "r2", .direction = .in },
    .GPIO15 = .{ .name = "r3", .direction = .in },
    .GPIO14 = .{ .name = "r4", .direction = .in },
    .GPIO3 = .{ .name = "r5", .direction = .in },
    .GPIO4 = .{ .name = "r6", .direction = .in },
    .GPIO5 = .{ .name = "r7", .direction = .in },
    .GPIO6 = .{ .name = "r8", .direction = .in },
    .GPIO7 = .{ .name = "r9", .direction = .in },

    .GPIO8 = .{ .name = "c0", .direction = .out },
    .GPIO9 = .{ .name = "c1", .direction = .out },
    .GPIO10 = .{ .name = "c2", .direction = .out },
    .GPIO11 = .{ .name = "c3", .direction = .out },
    .GPIO12 = .{ .name = "c4", .direction = .out },
    .GPIO13 = .{ .name = "c5", .direction = .out },
};
pub const p = pin_config.pins();
pub const pin_cols = [_]rp2xxx.gpio.Pin{ p.c0, p.c1, p.c2, p.c3, p.c4, p.c5 };
pub const pin_rows = [_]rp2xxx.gpio.Pin{ p.r0, p.r1, p.r2, p.r3, p.r4, p.r5, p.r6, p.r7, p.r8, p.r9 };

// zig fmt: off
pub const pin_mappings = [key_count][2]usize{

   .{0,5}, .{0,4}, .{0,3}, .{0,2}, .{0,1}, .{0,0},      .{5,0}, .{5,1}, .{5,2}, .{5,3}, .{5,4}, .{5,5},
            .{1,5}, .{1,4}, .{1,3}, .{1,2}, .{1,1}, .{1,0},      .{6,0}, .{6,1}, .{6,2}, .{6,3}, .{6,4}, .{6,5},
            .{2,5}, .{2,4}, .{2,3}, .{2,2}, .{2,1}, .{2,0},      .{7,0}, .{7,1}, .{7,2}, .{7,3}, .{7,4}, .{7,5},
            .{3,5}, .{3,4}, .{3,3}, .{3,2}, .{3,1}, .{3,0},      .{8,0}, .{8,1}, .{8,2}, .{8,3}, .{8,4}, .{8,5},
                    .{4,4}, .{4,3}, .{4,2}, .{4,1}, .{4,0},      .{9,0}, .{9,1}, .{9,2}, .{9,3}, .{9,4},
};


const NONE = core.KeyDef.none;
const _______ = core.KeyDef.transparent;
pub const keymap = [_][key_count]core.KeyDef{
    .{ 
    t(us.KC_GRAVE), t(us.KC_1),  t(us.KC_2),  t(us.KC_3),  t(us.KC_4),  t(us.KC_5),                        t(us.KC_6),       t(us.KC_7),      t(us.KC_8),       t(us.KC_9),       t(us.KC_0),       t(us.KC_MINUS),
      t(us.KC_TAB), t(us.KC_Q),  t(us.KC_W),  t(us.KC_F),  t(us.KC_P),  t(us.KC_V),                        t(us.KC_J),       t(us.KC_L),      t(us.KC_U),       t(us.KC_Y),       t(us.KC_SEMI),    t(us.KC_BSLH),
    CTL(us.KC_ESC), t(us.KC_A),  t(us.KC_R),  t(us.KC_S),  t(us.KC_T),  t(us.KC_G),                        t(us.KC_M),       t(us.KC_N),      t(us.KC_E),       t(us.KC_I),       t(us.KC_O),       t(us.KC_QUOTE),
     LEFT_SHIFT,     t(us.KC_Z),  t(us.KC_X),  t(us.KC_C),  t(us.KC_D),  t(us.KC_B),                        t(us.KC_K),       t(us.KC_H),      t(us.KC_COMMA),   t(us.KC_DOT),     t(us.KC_FSLH),    RIGHT_SHIFT,
                             _______,  LEFT_ALT, LEFT_GUI, t(us.KC_ESC), t(us.KC_BACKSPACE),        t(us.KC_ENTER), _______, _______, _______, _______
    }
};

// zig fmt: on
pub const dimensions = core.KeymapDimensions{ .key_count = key_count, .layer_count = keymap.len };
const PrintStats = core.KeyDef{ .tap_only = .{ .key_press = .{ .tap_keycode = us.KC_PRINT_STATS } } };
const tapping_term = core.TimeSpan{ .ms = 250 };
pub const combos = [_]core.Combo2Def{};
fn LT(layer_index: core.LayerIndex, keycode_fire: core.KeyCodeFire) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = .{ .key_press = keycode_fire },
            .hold = .{ .hold_layer = layer_index },
            .tapping_term = tapping_term,
        },
    };
}

fn t(keycode: u8) core.KeyDef {
    return core.KeyDef{
        .tap_only = .{ .key_press = .{ .tap_keycode = keycode } },
    };
}

fn CTL(keycode: u8) core.KeyDef {
    return core.KeyDef{
        .tap_hold = .{
            .tap = .{ .key_press = .{ .tap_keycode = keycode } },
            .hold = core.HoldDef{ .hold_modifiers = .{ .left_ctrl = true } },
            .tapping_term = tapping_term,
        },
    };
}

const LEFT_SHIFT: core.KeyDef = core.KeyDef{ .hold_only = .{ .hold_modifiers = .{ .left_shift = true } } };
const LEFT_ALT: core.KeyDef = core.KeyDef{ .hold_only = .{ .hold_modifiers = .{ .left_alt = true } } };
const LEFT_GUI: core.KeyDef = core.KeyDef{ .hold_only = .{ .hold_modifiers = .{ .left_gui = true } } };
const RIGHT_SHIFT: core.KeyDef = core.KeyDef{ .hold_only = .{ .hold_modifiers = .{ .right_shift = true } } };

fn on_event(event: core.ProcessorEvent, layers: *core.LayerActivations, output_queue: *core.OutputCommandQueue) void {
    _ = layers;
    _ = output_queue;
    switch (event) {
        .OnHoldEnterAfter => |data| {
            _ = data;
        },
        .OnHoldExitAfter => |data| {
            _ = data;
        },
        else => {},
    }
}
pub const custom_functions = core.CustomFunctions{
    .on_event = on_event,
};
