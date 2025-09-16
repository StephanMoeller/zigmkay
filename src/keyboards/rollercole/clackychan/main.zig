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
    uart_tx_pin.set_function(.uart);
    uart_rx_pin.set_function(.uart);
    uart.apply(.{ .clock_config = rp2xxx.clock_config, .baud_rate = 9600 });

    // Data queues
    var matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    const pin_mapping = if (is_primary) clackychan_pins.pin_mappings_right else clackychan_pins.pin_mappings_left;

    // Matrix scanning
    clackychan_pins.pin_config.apply(); // dont know how this could be done inside the module, but it needs to be done for things to work
    const matrix_scanner = zigmkay.matrix_scanning.CreateMatrixScannerType(
        rollercole_shared_keymap.dimensions,
        clackychan_pins.pin_cols[0..],
        clackychan_pins.pin_rows[0..],
        pin_mapping,
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
            const byte_or_null: ?u8 = uart.read_word(microzig.drivers.time.Duration.from_ms(0)) catch blk: {
                uart.clear_errors();
                break :blk null;
            };

            if (byte_or_null) |byte| {
                const uart_message = core.UartMessage.fromByte(byte);
                try matrix_change_queue.enqueue(core.MatrixStateChange{ .pressed = uart_message.pressed, .key_index = uart_message.key_index, .time = current_time });
            }

            // Processing: decide actions
            try processor.Process(current_time);

            // Execute actions: send usb commands to the host
            try usb_command_executor.HouseKeepAndProcessCommands(&usb_command_queue, current_time);

            // todo: put this logic inside usb command executor and make a keycode to trigger it

        }
    } else {
        // SECONDARY HALF
        var uart_send_buffer: [1]u8 = .{0};
        while (true) {
            const current_time = core.TimeSinceBoot{ .time_since_boot_us = time.get_time_since_boot().to_us() };
            // Scan local matrix changes
            try matrix_scanner.DetectKeyboardChanges(&matrix_change_queue, current_time);

            if (matrix_change_queue.Count() > 0) {
                const change = try matrix_change_queue.dequeue();
                const msg = core.UartMessage{ .pressed = change.pressed, .key_index = change.key_index };
                uart_send_buffer[0] = msg.toByte();

                // Tries to write one byte with 100ms timeout
                uart.write_blocking(&uart_send_buffer, microzig.drivers.time.Duration.from_ms(100)) catch {
                    uart.clear_errors();
                };
            }
        }
    }
}
