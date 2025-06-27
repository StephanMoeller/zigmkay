const std = @import("std");
const microzig = @import("microzig");
const usb_if = @import("microzig/usb_if.zig");

const zigmkay = @import("core/zigmkay.zig");
const core = zigmkay.core;

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
pub fn main() !void {
    const scanner = zigmkay.scanning.Scanner{};
    const processor = zigmkay.processing.Processor{};

    var keyboard_event_queue = core.KeyboardEventQueue.Create();
    const output_command_queue = core.OutputCommandQueue.Create();

    while (true) {
        try scanner.Scan(&keyboard_event_queue);
        try processor.Process(&keyboard_event_queue, &output_command_queue);
    }

    // First we initialize the USB clock
    try to_be_saved();
}

pub fn to_be_saved() !void {
    pin_config.apply();
    pins.row0.put(1);

    usb_if.init(usb_dev);

    var a_pressed = [7]u8{ 0b00001000, 6, 7, 8, 9, 10, 11 };
    var a_released = [7]u8{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
    var current_val: u1 = 0;

    while (true) {
        const current_time = core.TimeStamp{ .time_us_since_boot = time.get_time_since_boot().to_us() };

        // Process pending USB housekeeping
        usb_dev.task(false) catch unreachable;
        const new_val: u1 = pins.col0.read();
        if (new_val != current_val) {
            current_val = new_val;
            if (current_val == 1) {
                usb_if.send_keyboard_report(usb_dev, &a_pressed);
            } else {
                usb_if.send_keyboard_report(usb_dev, &a_released);
            }
        }

        var pin_val: u1 = 0;
        if (current_val == 1 and current_time.as_ns() % 1000 > 500) {
            pin_val = 1;
        } else {
            pin_val = 0;
        }
        pins.led_red.put(pin_val);
        pins.led_green.put(pin_val);
        pins.led_blue.put(pin_val);
    }
}
