const core = @import("core/types.zig");
const std = @import("std");

const keyboard = @import("wilson26/keymap.zig").KeyboardConfig;
const keyboardDef = keyboard.keymap;
const pinSetup = keyboard.rowPins;

pub fn main() !void {
    // init pins
    std.log.info("keycount: {any}", .{keyboard});
}
