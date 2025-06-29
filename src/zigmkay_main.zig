const std = @import("std");
const microzig = @import("microzig");
const zigmkay = @import("zigmkay/bundle.zig");
const keyboard = @import("wilson26/wilson26.zig");
const rp2xxx = microzig.hal;
pub fn main() !void {

    // PIN CONFIGURATION
    // PIN CONFIGURATION: init pins
    const pin_config = rp2xxx.pins.GlobalConfiguration{
        .GPIO17 = .{ .name = "led_red", .direction = .out },
        .GPIO16 = .{ .name = "led_green", .direction = .out },
        .GPIO25 = .{ .name = "led_blue", .direction = .out },

        .GPIO6 = .{ .name = "col_inner", .direction = .out },
        .GPIO29 = .{ .name = "col_index", .direction = .out },
        .GPIO28 = .{ .name = "col_mid", .direction = .out },
        .GPIO27 = .{ .name = "col_ring", .direction = .out },
        .GPIO26 = .{ .name = "col_pinky", .direction = .out },

        .GPIO2 = .{ .name = "row_top", .direction = .in },
        .GPIO4 = .{ .name = "row_home", .direction = .in },
        .GPIO3 = .{ .name = "row_bottom", .direction = .in },
    };
    const pins = pin_config.pins();

    // PIN CONFIGURATION: define the pins as row and col pins and specify a direction (validate that they point in the right direction)
    const PinConfigType = struct {
        //        const rowPins = [pins.row_top, pins.row_home, pins.row_bottom];
        //        const colPins = [pins.col_inner, pins.col_index, pins.col_mid, pins.col_ring, pins.col_pinky];
        const direction = "Col2Row";
    };

    // PIN CONFIGURATION: map all col/row pair to a specific index in the interface (and good luck to me making split work)

    _ = PinConfigType;
    _ = pins;

    // PIN CONFIGURATION: feed this whole config to the scanner

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
