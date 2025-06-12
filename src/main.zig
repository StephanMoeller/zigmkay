const core = @import("core/types.zig");
const std = @import("std");

const keyboardDef = @import("wilson26/keymap.zig").getKeyboardDefinition();

pub fn PinConfig(comptime length: usize, arr: [length]u8) type {
    return struct { pins: @TypeOf(arr) };
}
pub fn PinConfig2(comptime arr: anytype) type {
    return struct {
        pins: @TypeOf(arr),
        pub const length = arr.len;
    };
}
const input: [10]u8 = [_]u8{1} ** 10;
const config: PinConfig2(input) = PinConfig2(input){
    .pins = input,
};
const newArr: [10]u8 = config.pins;
pub fn main() !void {
    // init pins
    std.log.info("keycount: {any}", .{newArr});
}
