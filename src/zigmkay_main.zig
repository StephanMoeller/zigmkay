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

    // zig fmt: off
    const pinsToKeysMapping = [keyboard.KeyCount][2]u8{
                .{0,1}, .{0,2}, .{0,3}, .{0,4},   
         .{1,0},.{1,1}, .{1,2}, .{1,3}, .{1,4},   
                .{2,1}, .{2,2}, .{2,3},
                                .{2,4}
    };
    // zig fmt: on

    _ = pins;

    // PIN CONFIGURATION: feed this whole config to the scanner

    const scanner = comptime zigmkay.CreateScanner(keyboard.KeyCount, pinsToKeysMapping, .Col2Row);
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
