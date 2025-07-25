const zigmkay = @import("zigmkay/zigmkay.zig");
const keyboard = @import("zilpzalp/keymap.zig");
const rp2xxx = @import("microzig").hal;
const time = rp2xxx.time;

pub fn main() !void {
    // Data queues
    var matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    // Logic
    const matrix_scanner = zigmkay.matrix_scanning.CreateMatrixScanner(.{ .debounce_ms = 30 });
    var processor = zigmkay.processing.CreateProcessorType(keyboard.dimensions, &keyboard.keymap){};
    const usb_command_executor = zigmkay.usb_command_executor.CreateAndInitUsbCommandExecutor();

    // Cycle
    // TODO: if one of the three steps throws an error, show this using the led's instead of allowing the entire keyboard to stall
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
    }
}
