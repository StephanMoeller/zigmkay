const kc = @import("../keycodes/dk.zig");
const std = @import("std");
const core = @import("../zigmkay/core.zig");

pub const key_count = 28;
pub const keymap = [_][key_count]core.KeyDef{
    // zig fmt: off
            .{ //--------------------- 0 ---------------------
    T(kc.W),  T(kc.R), LG(kc.P),  T(kc.B),               T(kc.K), LG(kc.L),  T(kc.O),     T(kc.U),
    T(kc.F), LA(kc.A), LC(kc.S), LS(kc.T), T(kc.G),      T(kc.M), LS(kc.N), LC(kc.E),    LA(kc.I),  T(kc.Y),
              T(kc.X),  T(kc.C),  T(kc.D),                         T(kc.H),  T(kc.COMMA), T(kc.DOT),
          T(kc.ENTER), core.KeyDef.NONE(), core.KeyDef.NONE(), T(kc.SPACE)
    }
};

pub const dimensions = core.KeymapDimensions{ .key_count = key_count, .layer_count = keymap.len };

fn T(keycode: u8) core.KeyDef{
    return core.KeyDef.TAP(keycode);
}

const tapping_term_us = 250 * 1000; // 250 ms = 250,000 micro seconds

fn LG(keycode: u8) core.KeyDef {
    return core.KeyDef.MT(core.TapDef{.tap_keycode = keycode}, .{.left_gui = true}, tapping_term_us );
}
fn LC(keycode: u8) core.KeyDef {
    return core.KeyDef.MT(core.TapDef{.tap_keycode = keycode}, .{.left_ctrl = true}, tapping_term_us );
}
fn LA(keycode: u8) core.KeyDef {
    return core.KeyDef.MT(core.TapDef{.tap_keycode = keycode}, .{.left_alt = true}, tapping_term_us );
}
fn LS(keycode: u8) core.KeyDef {
    return core.KeyDef.MT(core.TapDef{.tap_keycode = keycode}, .{.left_shift = true}, tapping_term_us );
}
