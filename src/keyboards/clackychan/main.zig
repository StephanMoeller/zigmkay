const zigmkay = @import("../../zigmkay/zigmkay.zig");
const dk = @import("../../keycodes/dk.zig");

const core = zigmkay.core;
const std = @import("std");
const clacky_chan = @import("keymap.zig");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const time = rp2xxx.time;

// uart

const gpio = rp2xxx.gpio;
const uart = rp2xxx.uart.instance.num(0);
const uart_tx_pin = gpio.num(0);
const uart_rx_pin = gpio.num(1);

const is_primary = true;

pub fn main() !void {
    try main_primary();
}

pub fn main_secondary() !void {
    // uart
    uart_tx_pin.set_function(.uart);
    uart_rx_pin.set_function(.uart);
    uart.apply(.{ .clock_config = rp2xxx.clock_config, .baud_rate = 9600 });

    var counter: u8 = 1;
    var data: [1]u8 = .{0};
    var last_send: u64 = 0;
    while (true) {
        const current_time = time.get_time_since_boot().to_us();
        if (time.get_time_since_boot().to_us() > last_send + 1000000) {
            last_send = current_time;

            counter += 1;
            if (counter > 10) {
                counter += 1;
            }

            data[0] = counter;
            //tries to write one byte with 100ms timeout
            uart.write_blocking(&data, null) catch {
                uart.clear_errors();
            };
        }
    }
}
pub fn main_primary() !void {
    // uart
    uart_tx_pin.set_function(.uart);
    uart_rx_pin.set_function(.uart);
    uart.apply(.{ .clock_config = rp2xxx.clock_config, .baud_rate = 9600 });

    // Data queues
    var matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    clacky_chan.pin_config.apply(); // dont know how this could be done inside the module, but it needs to be done for things to work

    // Matrix scanning
    const matrix_scanner = zigmkay.matrix_scanning.CreateMatrixScannerType(
        clacky_chan.dimensions,
        clacky_chan.pin_cols[0..],
        clacky_chan.pin_rows[0..],
        clacky_chan.pin_mappings,
        .{ .debounce = .{ .ms = 25 } },
    ){};

    // Processing
    var processor = zigmkay.processing.CreateProcessorType(
        clacky_chan.dimensions,
        &clacky_chan.keymap,
        clacky_chan.combos[0..],
        &clacky_chan.custom_functions,
    ){
        .input_matrix_changes = &matrix_change_queue,
        .output_usb_commands = &usb_command_queue,
    };

    // USB events
    const usb_command_executor = zigmkay.usb_command_executor.CreateAndInitUsbCommandExecutor();

    while (true) {
        const word = uart.read_word(microzig.drivers.time.Duration.from_ms(100)) catch {
            uart.clear_errors();
            return 0;
        };
        if (word != 0) {
            try usb_command_queue.press_key(core.KeyCodeFire{ .tap_keycode = word + 5 });
        }

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
