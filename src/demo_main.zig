const dk = @import("../../../keycodes/dk.zig");
const us = @import("../../../keycodes/us.zig");
const std = @import("std");
const core = @import("../../../zigmkay/core.zig");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const time = rp2xxx.time;
// zig fmt: off
pub const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{ .name = "led_red", .direction = .out },
    .GPIO16 = .{ .name = "led_green", .direction = .out },
    .GPIO25 = .{ .name = "led_blue", .direction = .out },

    .GPIO29 = .{ .name = "p29", .direction = .out },
    .GPIO6 = .{ .name = "p6", .direction = .out },

    .GPIO0 = .{ .name = "p0", .direction = .in },
    .GPIO3 = .{ .name = "p3", .direction = .in },
};

pub const p = pin_config.pins();
pub fn main() !void {
    pin_config.apply();
    p.p29.put(1);
    p.p6.put(1);
    while(true){
        time.sleep_us(500*1000);
        p.led_red.put(p.p0.read());
        p.led_blue.put(p.p3.read());
    }
}

