const zigmkay = @import("zigmkay/zigmkay.zig");
const dk = @import("keycodes/dk.zig");

const std = @import("std");
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
            try print_num(tick_count, &usb_command_queue);
            has_printed = true;
        }
    }
}
const keys = @import("keycodes/dk.zig");
pub fn print(str: []u8, queue: *zigmkay.core.OutputCommandQueue) !void {
    var map: [256]u8 = [1]u8{dk.DOT} ** 256;
    map['a'] = dk.A;
    map['b'] = dk.B;
    map['c'] = dk.C;
    map['d'] = dk.D;
    map['e'] = dk.E;
    map['f'] = dk.F;
    map['g'] = dk.G;
    map['h'] = dk.H;
    map['i'] = dk.I;
    map['j'] = dk.J;
    map['k'] = dk.K;
    map['l'] = dk.L;
    map['m'] = dk.M;
    map['n'] = dk.N;
    map['o'] = dk.O;
    map['p'] = dk.P;
    map['q'] = dk.Q;
    map['r'] = dk.R;
    map['s'] = dk.S;
    map['t'] = dk.T;
    map['u'] = dk.U;
    map['v'] = dk.V;
    map['w'] = dk.W;
    map['x'] = dk.X;
    map['y'] = dk.Y;
    map['z'] = dk.Z;
    map['A'] = dk.A;
    map['B'] = dk.B;
    map['C'] = dk.C;
    map['D'] = dk.D;
    map['E'] = dk.E;
    map['F'] = dk.F;
    map['G'] = dk.G;
    map['H'] = dk.H;
    map['I'] = dk.I;
    map['J'] = dk.J;
    map['K'] = dk.K;
    map['L'] = dk.L;
    map['M'] = dk.M;
    map['N'] = dk.N;
    map['O'] = dk.O;
    map['P'] = dk.P;
    map['Q'] = dk.Q;
    map['R'] = dk.R;
    map['S'] = dk.S;
    map['T'] = dk.T;
    map['U'] = dk.U;
    map['V'] = dk.V;
    map['W'] = dk.W;
    map['X'] = dk.X;
    map['Y'] = dk.Y;
    map['Z'] = dk.Z;
    map['1'] = dk.N1;
    map['2'] = dk.N2;
    map['3'] = dk.N3;
    map['4'] = dk.N4;
    map['5'] = dk.N5;
    map['6'] = dk.N6;
    map['7'] = dk.N7;
    map['8'] = dk.N8;
    map['9'] = dk.N9;
    map['0'] = dk.N0;
    map[' '] = dk.SPACE;
    map['.'] = dk.DOT;
    for (str) |char| {
        const keycode = map[char];
        try queue.enqueue(.{ .KeyCodePress = keycode });
        try queue.enqueue(.{ .KeyCodeRelease = keycode });
    }
}
fn print_num(num: u64, queue: *zigmkay.core.OutputCommandQueue) !void {
    const max_len = 20;
    var buf: [max_len]u8 = undefined;
    const numAsString = try std.fmt.bufPrint(&buf, "{}", .{num});
    try print(numAsString, queue);
}
