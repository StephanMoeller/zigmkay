const zigmkay = @import("../../../zigmkay/zigmkay.zig");
const dk = @import("../../../keycodes/dk.zig");

const core = zigmkay.core;
const std = @import("std");
const rp2xxx = @import("microzig").hal;
const time = rp2xxx.time;

const rollercole_shared_keymap = @import("../shared_keymap.zig");
const miketypeson_pins = @import("pins.zig");
pub fn main() !void {

    // Data queues
    var matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    miketypeson_pins.pin_config.apply(); // dont know how this could be done inside the module, but it needs to be done for things to work

    // Matrix scanning
    const matrix_scanner = zigmkay.matrix_scanning.CreateMatrixScannerType(
        rollercole_shared_keymap.dimensions,
        miketypeson_pins.pin_cols[0..],
        miketypeson_pins.pin_rows[0..],
        miketypeson_pins.pin_mappings,
        .{ .debounce = .{ .ms = 25 } },
    ){};

    // TODO: i2c communication with secondary half should happen here and produce events in the matrix_change_queue
    // TODO: The secondary side should just scan the matrix and send the i2c data to the primary half

    // Processing
    var processor = zigmkay.processing.CreateProcessorType(
        rollercole_shared_keymap.dimensions,
        &rollercole_shared_keymap.keymap,
        rollercole_shared_keymap.combos[0..],
        &rollercole_shared_keymap.custom_functions,
    ){
        .input_matrix_changes = &matrix_change_queue,
        .output_usb_commands = &usb_command_queue,
    };

    // USB events
    const usb_command_executor = zigmkay.usb_command_executor.CreateAndInitUsbCommandExecutor();

    while (true) {
        const current_time = core.TimeSinceBoot{ .time_since_boot_us = time.get_time_since_boot().to_us() };

        // Matrix scanning: detect which keys have been pressed since last time
        try matrix_scanner.DetectKeyboardChanges(&matrix_change_queue, current_time);

        // Processing: decide actions
        try processor.Process(current_time);

        // Execute actions: send usb commands to the host
        try usb_command_executor.HouseKeepAndProcessCommands(&usb_command_queue, current_time);

        // todo: put this logic inside usb command executor and make a keycode to trigger it

    }
}
