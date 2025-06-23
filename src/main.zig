const std = @import("std");
const microzig = @import("microzig");
const usb_if = @import("usb_if.zig");
const rp2xxx = microzig.hal;
const time = rp2xxx.time;
const usb = rp2xxx.usb;
const usb_dev = rp2xxx.usb.Usb(.{});

// Compile-time pin configuration
const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{ .name = "led_red", .direction = .out },
    .GPIO16 = .{ .name = "led_green", .direction = .out },
    .GPIO25 = .{ .name = "led_blue", .direction = .out },
    .GPIO29 = .{ .name = "row0", .direction = .out },
    .GPIO4 = .{ .name = "col0", .direction = .in },
};
const pins = pin_config.pins();
const keyboardEpAddr = rp2xxx.usb.Endpoint.to_address(1, .In);
pub fn main() !void {

    // First we initialize the USB clock

    pin_config.apply();
    pins.row0.put(1);

    usb_if.init(usb_dev);

    var a_pressed = [7]u8{ 0x02, 0x02, 0x04, 0x02, 0x02, 0x02, 0x02 };
    var a_released = [7]u8{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
    var current_val: u1 = 0;
    while (true) {
        // Process pending USB housekeeping
        usb_dev.task(false) catch unreachable;
        const new_val: u1 = pins.col0.read();
        if (new_val != current_val) {
            current_val = new_val;
            if (current_val == 1) {
                usb_dev.callbacks.usb_start_tx(keyboardEpAddr, &a_pressed);
            } else {
                usb_dev.callbacks.usb_start_tx(keyboardEpAddr, &a_released);
            }
            pins.led_red.put(new_val);
            pins.led_green.put(new_val);
            pins.led_blue.put(new_val);
        }
    }
}
