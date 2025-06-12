const keyboard = @import("wilson26/keymap.zig");
const keymap = keyboard.createKeymap();

comptime {
    if (keymap.len == 0) {
        @compileError("Keymap has no layers!");
    }

    if (keymap[0].len == 0) {
        @compileError("Keymap has empty layers!");
    }
}

const layerCount = keymap.len;
const keyCount = keymap[0].len;

const std = @import("std");
const test5 = @import("core/types.zig");

const foo: test5.KeyDef = keymap[0][0];

pub fn main() !void {
    // init pins

    std.log.info("keycount: {any}", .{keymap.len});
}
