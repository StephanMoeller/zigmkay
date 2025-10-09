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

const rollercole_shared_keymap = @import("../shared_keymap.zig");
const dasbob_pins = @import("pins.zig");

const unused_pin = 10;
const is_primary = true;
const rx_tx_pin = 1;

pub fn main() !void {
    dasbob_pins.pin_config.apply(); // dont know how this could be done inside the module, but it needs to be done for things to work
    p.led.put(1);
    main_internal() catch {
        while (true) {
            p.led.put(0);
            time.sleep_ms(250);
            p.led.put(1);
            time.sleep_ms(250);
        }
    };
}

pub const p = dasbob_pins.pin_config.pins();
pub fn main_internal() !void {
    const uart_tx_pin = if (is_primary) gpio.num(unused_pin) else gpio.num(rx_tx_pin);
    const uart_rx_pin = if (is_primary) gpio.num(rx_tx_pin) else gpio.num(unused_pin);

    // uart
    uart_tx_pin.set_function(.uart);
    uart_rx_pin.set_function(.uart);
    uart.apply(.{ .clock_config = rp2xxx.clock_config, .baud_rate = 9600 });

    // Data queues
    var matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    const pin_mapping = if (is_primary) dasbob_pins.pin_mappings_right else dasbob_pins.pin_mappings_left;
    // Matrix scanning
    const matrix_scanner = zigmkay.matrix_scanning.CreateMatrixScannerType(
        dasbob_pins.dimensions,
        dasbob_pins.pin_cols[0..],
        dasbob_pins.pin_rows[0..],
        pin_mapping,
        .{ .debounce = .{ .ms = 25 }, .activated_value = 0 },
    ){};

    if (is_primary) {

        // PRIMARY HALF
        // Processing
        const keymap = comptime dasbob_pins.get_keymap();
        var processor = zigmkay.processing.CreateProcessorType(
            dasbob_pins.dimensions,
            &keymap,
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
            uart.clear_errors();
            const byte_or_null: ?u8 = try uart.read_word() catch blk: {
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
            // try usb_command_queue.tap_key(core.KeyCodeFire{ .tap_keycode = 0x08 });
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
