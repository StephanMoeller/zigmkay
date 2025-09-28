const zigmkay = @import("../../../zigmkay/zigmkay.zig");
const dk = @import("../../../keycodes/dk.zig");

const core = zigmkay.core;
const std = @import("std");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const time = rp2xxx.time;
const us = @import("../../../keycodes/us.zig");
// uart

const gpio = rp2xxx.gpio;
const uart = rp2xxx.uart.instance.num(0);
const uart_tx_pin = gpio.num(0);
const uart_rx_pin = gpio.num(1);

const is_primary = true;

const rollercole_shared_keymap = @import("../shared_keymap.zig");

pub fn main() !void {
    pin_config.apply(); // dont know how this could be done inside the module, but it needs to be done for things to work
    main_internal() catch {
        p.led.put(1);
    };
}
pub fn main_internal() !void {
    p.led.put(1);
    // uart
    uart_tx_pin.set_function(.uart);
    uart_rx_pin.set_function(.uart);
    uart.apply(.{ .clock_config = rp2xxx.clock_config, .baud_rate = 9600 });

    // Data queues
    var matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    const pin_mapping = if (is_primary) pin_mappings_right else pin_mappings_left;

    // Matrix scanning
    const matrix_scanner = zigmkay.matrix_scanning.CreateMatrixScannerType(
        rollercole_shared_keymap.dimensions,
        pin_cols[0..],
        pin_rows[0..],
        pin_mapping,
        .{ .debounce = .{ .ms = 25 } },
    ){};

    time.sleep_us(250000);
    p.led.put(0);
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
            const byte_or_null: ?u8 = uart.read_word() catch blk: {
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

// zig fmt: off
pub const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{ .name = "led", .direction = .out },
    .GPIO6 = .{ .name = "col", .direction = .out },

    .GPIO7 = .{ .name = "k7", .direction = .in },
    .GPIO8 = .{ .name = "k8", .direction = .in },
    .GPIO9 = .{ .name = "k9", .direction = .in },
    .GPIO12 = .{ .name = "k12", .direction = .in },
    .GPIO13 = .{ .name = "k13", .direction = .in },
    .GPIO14 = .{ .name = "k14", .direction = .in },
    .GPIO15 = .{ .name = "k15", .direction = .in },
    .GPIO16 = .{ .name = "k16", .direction = .in },
    .GPIO21 = .{ .name = "k21", .direction = .in },
    .GPIO23 = .{ .name = "k23", .direction = .in },
    .GPIO20 = .{ .name = "k20", .direction = .in },
    .GPIO22 = .{ .name = "k22", .direction = .in },
    .GPIO26 = .{ .name = "k26", .direction = .in },
    .GPIO27 = .{ .name = "k27", .direction = .in },
    .GPIO10 = .{ .name = "k10", .direction = .in },
};
pub const p = pin_config.pins();

pub const pin_mappings_right = [rollercole_shared_keymap.key_count]?[2]usize{
   null, null, null, null, null,  .{0,13},.{0,12},.{0,11},.{0,10},.{0,5},
   null, null, null, null, null,   .{0,9},.{0,8},.{0,7},.{0,6},.{0,0},
         null, null, null, null,   .{0,4},.{0,3},.{0,2},.{0,1},
                           null,   .{0, 14}
};

pub const pin_mappings_left = [rollercole_shared_keymap.key_count]?[2]usize{
  .{0,5}, .{0,10},.{0,11},.{0,12},.{0,13},       null, null, null, null, null,
  .{0,0}, .{0,6}, .{0,7}, .{0,8}, .{0,9},       null, null, null, null, null,
          .{0,1}, .{0,2}, .{0,3}, .{0,4},      null, null, null, null,
                                 .{0, 14},       null
};

pub const pin_cols = [_]rp2xxx.gpio.Pin{ p.col };
pub const pin_rows = [_]rp2xxx.gpio.Pin{ p.k7, p.k8, p.k9, p.k12, p.k13, p.k14, p.k15, p.k16, p.k21, p.k23, p.k20, p.k22, p.k26, p.k27, p.k10 };
