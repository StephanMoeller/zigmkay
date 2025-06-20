const std = @import("std");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const time = rp2xxx.time;

// Compile-time pin configuration
const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{
        .name = "led_red",
        .direction = .out,
    },
    .GPIO16 = .{
        .name = "led_green",
        .direction = .out,
    },
    .GPIO25 = .{
        .name = "led_blue",
        .direction = .out,
    },
};
const pins = pin_config.pins();

pub fn main() !void {
    pin_config.apply();

    while (true) {
        pins.led_red.toggle();
        time.sleep_ms(250);
        pins.led_green.toggle();
        time.sleep_ms(250);
        pins.led_blue.toggle();
        time.sleep_ms(250);
    }
}
