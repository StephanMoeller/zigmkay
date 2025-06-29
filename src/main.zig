const std = @import("std");
const zigmkay = @import("core/zigmkay.zig");
const keyboard = @import("wilson26/wilson26.zig");

pub fn main() !void {
    const scanner = zigmkay.scanning.Scanner{};
    const processor = zigmkay.processing.Processor{};

    var keyboard_event_queue = zigmkay.core.KeyboardEventQueue.Create();
    var output_command_queue = zigmkay.core.OutputCommandQueue.Create();

    while (true) {
        // TODO: setup pins
        //   define what row and col pins are used
        //   define which ones are out and which ones are input (dictates if we are doing rowToCol or colToRow)
        // TODO: create scanner and mapping from scanning to keymap positions
        // TODO: create some sort of key state to be fired with usb

        // Read pin states and add keyboard events (what swithes changed state since last tick) to the event queue
        // Debounce logic will happen inside this scanner
        try scanner.Scan(&keyboard_event_queue);

        // Read keyboard events and produce output commands eg what hid keycodes should be fired, what layer changes should be applied
        // Tap/Hold timings will be handled inhere.
        // Note: Only keyboard events that were conclusive are removed at this tick. if a tap/hold key was recently pressed, we may need to wait for more time to pass or other keypresses/releases to happen before we can determine what should happen. Of this reason, it is important that the same queue is continuesly used between loop ticks
        try processor.Process(keyboard.KeyCount, keyboard.LayerCount, &keyboard.keymap, &keyboard_event_queue, &output_command_queue);

        // TODO: Loop through the output commands and execute key strokes and apply layer changes
    }
}


