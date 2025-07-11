const std = @import("std");
const zigmkay = @import("zigmkay/zigmkay.zig");
const keyboard = @import("zilpzalp/keymap.zig");
const rp2xxx = @import("microzig").hal;

pub fn main() !void {
    // data queues
    var keyboard_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    // logic
    const scanner = zigmkay.scanning.CreateScanner();
    const processor = zigmkay.processing.CreateProcessor();
    const usb_command_executor = zigmkay.usb_command_executor.CreateAndInitUsbCommandExecutor();

    while (true) {
        // TODO: where does layer state recide?
        // TODO: where does keyboard hid key state recide?

        // Register input
        // TODO: Make the pin setup detached from the scanner to make the scanner reusable for all rp2xxx stuff - not only the zilpzalp
        // TODO: Add rebounce logic to scanner
        try scanner.DetectKeyboardChanges(&keyboard_change_queue);

        // Decide actions
        // TODO: Add all logic needed for own keyboard here
        //      modded key taps
        //      layer shifting - on hold, on tap,
        //      mods - on hold, on tap
        //      custom Autofire per key
        //      Permissive hold (A press, B press, B release => always concider A as held (not tapped) - even withing tapping term)
        //      Retrotapping (A press, tapping term expire, A released) => A hold triggers, A release triggers, A tap triggers
        try processor.Process(keyboard.KeyCount, keyboard.LayerCount, &keyboard.keymap, &keyboard_change_queue, &usb_command_queue);

        // Execute actions
        // TODO: Fix modifiers so that eg shift works when held down
        try usb_command_executor.HouseKeepAndProcessCommands(&usb_command_queue);
    }
}
