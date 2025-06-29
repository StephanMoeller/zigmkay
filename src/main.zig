const std = @import("std");
const microzig = @import("microzig");
const usb_if = @import("microzig/usb_if.zig");

const zigmkay = @import("core/zigmkay.zig");
const core = zigmkay.core;

const wilson26 = @import("wilson26/wilson26.zig");

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
    var output_command_queue = core.OutputCommandQueue.Create();

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
        try processor.Process(wilson26.KeyCount, wilson26.LayerCount, &wilson26.keymap, &keyboard_event_queue, &output_command_queue);

        // TODO: Loop through the output commands and execute key strokes and apply layer changes
    }
}


