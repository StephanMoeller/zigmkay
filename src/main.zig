const std = @import("std");
const zigmkay = @import("zigmkay/zigmkay.zig");
const keyboard = @import("wilson26/wilson26.zig");
const rp2xxx = @import("microzig").hal;

pub fn main() !void {
    // data queues
    var keyboard_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    // logic
    const scanner = zigmkay.CreateScanner();
    const processor = zigmkay.CreateProcessor();
    const usb_command_executor = zigmkay.CreateAndInitUsbCommandExecutor();

    while (true) {
        // TODO: where does layer state recide?
        // TODO: where does keyboard hid key state recide?

        // Register input
        // TODO: Make the pin setup detached from the scanner to make the scanner reusable for all rp2xxx stuff - not only the zilpzalp
        // TODO: Add rebounce logic to scanner
        try scanner.DetectKeyboardChanges(&keyboard_change_queue);

        // Decide actions
        // TODO: Add all logic needed for own keyboard here
        try processor.Process(keyboard.KeyCount, keyboard.LayerCount, &keyboard.keymap, &keyboard_change_queue, &usb_command_queue);

        // Execute actions
        // TODO: Fix modifiers so that eg shift works when held down
        try usb_command_executor.HouseKeepAndProcessCommands(&usb_command_queue);
    }
}
