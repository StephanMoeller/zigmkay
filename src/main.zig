const keyboard = @import("keymap.zig");
const keymap = keyboard.createLayers(keyboard.LayerCount, keyboard.KeyCount);

const std = @import("std");
const test5 = @import("core/types.zig");

const foo: test5.KeyDef = keymap[0][0];

pub fn main() !void {
    // init pins

    std.log.info("keycount: {any}", .{foo});
}
