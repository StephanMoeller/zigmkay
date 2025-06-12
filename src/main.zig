const core = @import("core/types.zig");
const std = @import("std");

const keyboardDef = @import("wilson26/keymap.zig").getKeyboardDefinition();

pub fn main() !void {
    // init pins
    std.log.info("keycount: {any}", .{keyboardDef.pinConfig});
}
