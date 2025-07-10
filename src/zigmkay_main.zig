const std = @import("std");
const microzig = @import("microzig");
const zigmkay = @import("zigmkay/bundle.zig");
const keyboard = @import("wilson26/wilson26.zig");
const rp2xxx = microzig.hal;

const usb_if = @import("microzig/usb_if.zig");
const usb_dev = rp2xxx.usb.Usb(.{});

pub fn main() !void {

    // First we initialize the USB clock
    usb_if.init(usb_dev);

    // PIN CONFIGURATION: feed this whole config to the scanner

    const scanner = zigmkay.CreateScanner();
    //const processor = zigmkay.Processor{};

    var keyboard_state_change_queue = zigmkay.KeyboardStateChangeQueue.Create();
    //var output_command_queue = zigmkay.OutputCommandQueue.Create();
    var data = [7]u8{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

    while (true) {
        //usb_if.send_keyboard_report(usb_dev, &usb_data);
        // Changes => keyboard_state_change_queue
        try scanner.DetectKeyboardChanges(&keyboard_state_change_queue);

        // Process pending USB housekeeping
        usb_dev.task(false) catch unreachable;
        const result = keyboard_state_change_queue.dequeue() catch {
            continue; // continue if no state changes
        };

        if (result.pressed == 1) {
            data[2] = @intCast(result.key_index);
            //pins.led_red.put(0);
            //pins.led_green.put(1);
            //pins.led_blue.put(0);
        } else {
            data[2] = 0;
            //pins.led_red.put(1);
            //pins.led_green.put(0);
            //pins.led_blue.put(0);
        }
        usb_if.send_keyboard_report(usb_dev, &data);

        // keyboard_state_change_queue => Process => output_command_queue
        //try processor.Process(keyboard.KeyCount, keyboard.LayerCount, &keyboard.keymap, &keyboard_state_change_queue, &output_command_queue);
        //while (output_command_queue.Count() > 10) {
        //    const next_command = try output_command_queue.dequeue();
        //    switch (next_command) {
        //       .KeyCodePress => |_| {},
        //       .KeyCodeRelease => |_| {},
        //       else => {},
        //   }
        //}

        // TODO: Loop through the output commands and execute key strokes and apply layer changes

        // Read from: output_command_queue
        // Execute using usb helper
    }
}
