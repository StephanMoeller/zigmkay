const std = @import("std");
const zigmkay = @import("zigmkay/bundle.zig");
const keyboard = @import("wilson26/wilson26.zig");

pub fn main() !void {
    const scanner = zigmkay.Scanner{};
    const processor = zigmkay.Processor{};

    var keyboard_state_change_queue = zigmkay.KeyboardStateChangeQueue.Create();
    var output_command_queue = zigmkay.OutputCommandQueue.Create();

    while (true) {

        // Changes => keyboard_state_change_queue
        try scanner.DetectKeyboardChanges(&keyboard_state_change_queue);

        // keyboard_state_change_queue => Process => output_command_queue
        try processor.Process(keyboard.KeyCount, keyboard.LayerCount, &keyboard.keymap, &keyboard_state_change_queue, &output_command_queue);

        // TODO: Loop through the output commands and execute key strokes and apply layer changes

        // Read from: output_command_queue
        // Execute using usb helper
    }
}
