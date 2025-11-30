// These keycodes are copied from the qmk project under the gpl2 license
const core = @import("../zigmkay/zigmkay.zig").core;
const us = @import("us.zig");

// pub const AE = core.KeyCodeFire{ .tap_keycode = us.KC_A }; // ä
// pub const OE = core.KeyCodeFire{ .tap_keycode = us.KC_O }; // ö
// pub const UE = core.KeyCodeFire{ .tap_keycode = us.KC_U }; // ü
pub const EUR = core.KeyCodeFire{ .tap_keycode = us.KC_2, .tap_modifiers = .{ .left_alt = true, .left_shift = true } }; // €
pub const SRPS = core.KeyCodeFire{ .tap_keycode = us.KC_S, .tap_modifiers = .{ .left_alt = true } }; // ß
