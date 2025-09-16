const zigmkay = @import("../../../zigmkay/zigmkay.zig");
const dk = @import("../../../keycodes/dk.zig");

const core = zigmkay.core;
const std = @import("std");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const time = rp2xxx.time;
// uart

const gpio = rp2xxx.gpio;
const uart = rp2xxx.uart.instance.num(0);
const uart_tx_pin = gpio.num(0);
const uart_rx_pin = gpio.num(1);

const is_primary = true;

const rollercole_shared_keymap = @import("../shared_keymap.zig");
const clackychan_pins = @import("pins.zig");

pub fn main() !void {

    // uart
    var uart_data: [1]u8 = .{0};
    uart_tx_pin.set_function(.uart);
    uart_rx_pin.set_function(.uart);
    uart.apply(.{ .clock_config = rp2xxx.clock_config, .baud_rate = 9600 });

    // Data queues
    var matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    // Matrix scanning
    clackychan_pins.pin_config.apply(); // dont know how this could be done inside the module, but it needs to be done for things to work
    const matrix_scanner = zigmkay.matrix_scanning.CreateMatrixScannerType(
        rollercole_shared_keymap.dimensions,
        clackychan_pins.pin_cols[0..],
        clackychan_pins.pin_rows[0..],
        clackychan_pins.pin_mappings_left,
        .{ .debounce = .{ .ms = 25 } },
    ){};

    if (is_primary) {
        // PRIMARY HALF
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

            // Scan local matrix changes
            try matrix_scanner.DetectKeyboardChanges(&matrix_change_queue, current_time);

            // Receive remote changes as well

            // Processing: decide actions
            try processor.Process(current_time);

            // Execute actions: send usb commands to the host
            try usb_command_executor.HouseKeepAndProcessCommands(&usb_command_queue, current_time);

            // todo: put this logic inside usb command executor and make a keycode to trigger it

        }
    } else {
        // SECONDARY HALF
        // Tries to write one byte with 100ms timeout
        uart.write_blocking(&uart_data, null) catch {
            uart.clear_errors();
        };
    }
}
