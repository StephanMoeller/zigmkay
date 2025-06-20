const std = @import("std");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const time = rp2xxx.time;

// Compile-time pin configuration
const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{ .name = "led_red", .direction = .out },
    .GPIO16 = .{ .name = "led_green", .direction = .out },
    .GPIO25 = .{ .name = "led_blue", .direction = .out },
    .GPIO29 = .{ .name = "row0", .direction = .out },
    .GPIO4 = .{ .name = "col0", .direction = .in },
};
const pins = pin_config.pins();

pub fn main() !void {
    pin_config.apply();
    pins.row0.put(1);
    while (true) {
        const val: u1 = pins.col0.read();
        pins.led_red.put(val);
        pins.led_green.put(val);
        pins.led_blue.put(val);
    }
}
