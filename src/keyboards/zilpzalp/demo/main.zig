const zigmkay = @import("../../../zigmkay/zigmkay.zig");
const dk = @import("../../../keycodes/dk.zig");

const core = zigmkay.core;
const std = @import("std");
const keyboard = @import("keymap.zig");
const rp2xxx = @import("microzig").hal;
const time = rp2xxx.time;

pub fn main() !void {
    // Data queues
    var matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    // Logic
    const matrix_scanner = zigmkay.matrix_scanning.CreateMatrixScanner(.{ .debounce = .{ .ms = 5 } });

    var processor = zigmkay.processing.CreateProcessorType(keyboard.dimensions, &keyboard.keymap, keyboard.combos[0..], &keyboard.custom_functions){};
    const usb_command_executor = zigmkay.usb_command_executor.CreateAndInitUsbCommandExecutor();

    while (true) {
        const current_time = core.TimeSinceBoot{ .time_since_boot_us = time.get_time_since_boot().to_us() };

        // Detect matrix changes
        try matrix_scanner.DetectKeyboardChanges(&matrix_change_queue, current_time);

        // Decide actions
        try processor.Process(&matrix_change_queue, &usb_command_queue, current_time);

        // Execute actions
        try usb_command_executor.HouseKeepAndProcessCommands(&usb_command_queue);
    }
}
