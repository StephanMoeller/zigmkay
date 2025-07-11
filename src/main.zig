const std = @import("std");
const zigmkay = @import("zigmkay/zigmkay.zig");
const keyboard = @import("wilson26/wilson26.zig");
const rp2xxx = @import("microzig").hal;

pub fn main() !void {

    // data queues
    var keyboard_state_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create();
    var output_command_queue = zigmkay.core.OutputCommandQueue.Create();

    // logic
    const scanner = zigmkay.CreateScanner();
    const processor = zigmkay.CreateProcessor();
    const usb_command_executor = zigmkay.CreateAndInitUsbCommandExecutor();

    while (true) {
        try scanner.DetectKeyboardChanges(&keyboard_state_change_queue);
        try processor.Process(keyboard.KeyCount, keyboard.LayerCount, &keyboard.keymap, &keyboard_state_change_queue, &output_command_queue);
        usb_command_executor.HouseKeepAndProcessCommands(&output_command_queue);
    }
}
