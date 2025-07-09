const std = @import("std");
const microzig = @import("microzig");
const zigmkay = @import("zigmkay/bundle.zig");
const keyboard = @import("wilson26/wilson26.zig");
const rp2xxx = microzig.hal;

const usb_if = @import("microzig/usb_if.zig");
const usb_dev = rp2xxx.usb.Usb(.{});
pub fn main() !void {

    // zig fmt: on

    // PIN CONFIGURATION: feed this whole config to the scanner

    const scanner = zigmkay.CreateScanner();
    _ = scanner;
    //const processor = zigmkay.Processor{};

    //var keyboard_state_change_queue = zigmkay.KeyboardStateChangeQueue.Create();
    var output_command_queue = zigmkay.OutputCommandQueue.Create();
    var usb_data = [7]u8{ 0b00001000, 6, 7, 0, 0, 0, 0 };
    usb_if.init(usb_dev);
    usb_data[1] = 6;
    usb_data[2] = 6;
    while (true) {
        usb_dev.task(false) catch unreachable;
        usb_if.send_keyboard_report(usb_dev, &usb_data);
        //usb_if.send_keyboard_report(usb_dev, &usb_data);
        // Changes => keyboard_state_change_queue
        //try scanner.DetectKeyboardChanges(&keyboard_state_change_queue);

        // keyboard_state_change_queue => Process => output_command_queue
        //try processor.Process(keyboard.KeyCount, keyboard.LayerCount, &keyboard.keymap, &keyboard_state_change_queue, &output_command_queue);
        while (output_command_queue.Count() > 10) {
            const next_command = try output_command_queue.dequeue();
            switch (next_command) {
                .KeyCodePress => |_| {
                    usb_data[1] = 6;
                    usb_data[2] = 6;
                },
                .KeyCodeRelease => |_| {
                    usb_data[1] = 0;
                    usb_data[2] = 0;
                },
                else => {},
            }
        }

        // TODO: Loop through the output commands and execute key strokes and apply layer changes

        // Read from: output_command_queue
        // Execute using usb helper
    }
}
