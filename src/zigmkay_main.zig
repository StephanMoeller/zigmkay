const std = @import("std");
const microzig = @import("microzig");
const zigmkay = @import("zigmkay/zigmkay.zig");
const keyboard = @import("wilson26/wilson26.zig");
const rp2xxx = microzig.hal;

const usb_if = @import("microzig/usb_if.zig");
const usb_dev = rp2xxx.usb.Usb(.{});

pub fn main() !void {

    // First we initialize the USB clock
    usb_if.init(usb_dev);

    // PIN CONFIGURATION: feed this whole config to the scanner

    const scanner = zigmkay.CreateScanner();
    const processor = zigmkay.CreateProcessor();

    var keyboard_state_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create();
    var output_command_queue = zigmkay.core.OutputCommandQueue.Create();

    var data = [7]u8{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
    while (true) {
        usb_dev.task(false) catch unreachable; // Process pending USB housekeeping
        try scanner.DetectKeyboardChanges(&keyboard_state_change_queue);
        try processor.Process(keyboard.KeyCount, keyboard.LayerCount, &keyboard.keymap, &keyboard_state_change_queue, &output_command_queue);
        // TODO: extract this logic into seperate class and unit test it
        // TODO: support for modifiers: both stand-alone presses and keycaps with modifiers activated
        while (output_command_queue.Count() > 0) {
            const command = output_command_queue.dequeue() catch unreachable;
            switch (command) {
                .KeyCodePress => |keycode| {
                    var idx: usize = 1;
                    while (idx < data.len and data[idx] != 0) {
                        idx += 1;
                    }
                    if (idx < data.len) {
                        data[idx] = keycode;
                    }
                },
                .KeyCodeRelease => |keycode| {
                    var idx: usize = 1;
                    while (idx < data.len and data[idx] != keycode) {
                        idx += 1;
                    }
                    if (idx < data.len) {
                        data[idx] = 0;
                    }
                },
                .LayerActivation => |_| {},
                .LayerDeactivation => |_| {},
            }
        }
        usb_if.send_keyboard_report(usb_dev, &data);
    }
}
