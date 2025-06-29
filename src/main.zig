const std = @import("std");
const zigmkay = @import("core/zigmkay.zig");
const keyboard = @import("wilson26/wilson26.zig");

pub fn main() !void {
    const scanner = zigmkay.Scanner{};
    const processor = zigmkay.Processor{};

    var keyboard_state_change_queue = zigmkay.KeyboardStateChangeQueue.Create();
    var output_command_queue = zigmkay.OutputCommandQueue.Create();

    while (true) {

        // Detect keyboard changes and handle debouncing as part of this
        // Write to: keyboard_state_change_queue
        try scanner.DetectKeyboardChanges(&keyboard_state_change_queue);

        // Read from: keyboard_state_change_queue
        // Process
        // Write to: output_command_queue
        try processor.Process(keyboard.KeyCount, keyboard.LayerCount, &keyboard.keymap, &keyboard_state_change_queue, &output_command_queue);

        // TODO: Loop through the output commands and execute key strokes and apply layer changes

        // Read from: output_command_queue
        // Execute using usb helper
    }
}
