const zigmkay = @import("zigmkay/zigmkay.zig");
const keyboard = @import("zilpzalp/keymap.zig");
const rp2xxx = @import("microzig").hal;
const time = rp2xxx.time;

pub fn main() !void {
    var tick_count: u64 = 0;

    // Data queues
    var matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    // Logic
    const matrix_scanner = zigmkay.matrix_scanning.CreateMatrixScanner(.{ .debounce_ms = 30 });
    var processor = zigmkay.processing.CreateProcessorType(keyboard.dimensions, &keyboard.keymap){};
    const usb_command_executor = zigmkay.usb_command_executor.CreateAndInitUsbCommandExecutor();

    // Cycle
    // TODO: if one of the three steps throws an error, show this using the led's instead of allowing the entire keyboard to stall

    const start_time = time.get_time_since_boot().to_us();
    var has_printed = false;
    while (true) {
        const current_time = time.get_time_since_boot().to_us();

        // TODO: Make the pin setup detached from the scanner to make the scanner reusable for all rp2xxx stuff - not only the zilpzalp
        try matrix_scanner.DetectKeyboardChanges(
            &matrix_change_queue, // output queue
            current_time,
        );

        // Decide actions
        try processor.Process(
            &matrix_change_queue, // input queue
            &usb_command_queue, // output queue
            current_time,
        );

        // Execute actions
        try usb_command_executor.HouseKeepAndProcessCommands(&usb_command_queue);

        tick_count += 1;

        if (!has_printed and (current_time - start_time) / 1000 > 1000) {
            try print(tick_count, &usb_command_queue);
            has_printed = true;
        }
    }
}
const keys = @import("keycodes/dk.zig");
pub fn print(num: u64, queue: *zigmkay.core.OutputCommandQueue) !void {
    var remaining = num;
    // 0x001E
    while (remaining > 0) {
        var keycode: u8 = 0;
        const digit = remaining % 10;
        if (digit == 1) keycode = keys.N1;
        if (digit == 2) keycode = keys.N2;
        if (digit == 3) keycode = keys.N3;
        if (digit == 4) keycode = keys.N4;
        if (digit == 5) keycode = keys.N5;
        if (digit == 6) keycode = keys.N6;
        if (digit == 7) keycode = keys.N7;
        if (digit == 8) keycode = keys.N8;
        if (digit == 9) keycode = keys.N9;
        if (digit == 0) keycode = keys.N0;

        try queue.enqueue(.{ .KeyCodePress = keycode });
        try queue.enqueue(.{ .KeyCodeRelease = keycode });

        try queue.enqueue(.{ .KeyCodePress = keys.SPACE });
        try queue.enqueue(.{ .KeyCodeRelease = keys.SPACE });

        try queue.enqueue(.{ .KeyCodePress = keys.DOT });
        try queue.enqueue(.{ .KeyCodeRelease = keys.DOT });

        try queue.enqueue(.{ .KeyCodePress = keys.SPACE });
        try queue.enqueue(.{ .KeyCodeRelease = keys.SPACE });
        remaining /= 10;
    }
    try queue.enqueue(.{ .KeyCodePress = keys.ENTER });
    try queue.enqueue(.{ .KeyCodeRelease = keys.ENTER });
}
