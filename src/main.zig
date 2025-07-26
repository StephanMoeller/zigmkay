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
    const matrix_scanner = zigmkay.matrix_scanning.CreateMatrixScanner(.{ .debounce_ms = 5 });
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
const map = build_map();
pub fn build_map() [256]u8 {
    var new_map: [256]u8 = [1]u8{dk.DOT} ** 256;
    new_map['a'] = dk.A;
    new_map['b'] = dk.B;
    new_map['c'] = dk.C;
    new_map['d'] = dk.D;
    new_map['e'] = dk.E;
    new_map['f'] = dk.F;
    new_map['g'] = dk.G;
    new_map['h'] = dk.H;
    new_map['i'] = dk.I;
    new_map['j'] = dk.J;
    new_map['k'] = dk.K;
    new_map['l'] = dk.L;
    new_map['m'] = dk.M;
    new_map['n'] = dk.N;
    new_map['o'] = dk.O;
    new_map['p'] = dk.P;
    new_map['q'] = dk.Q;
    new_map['r'] = dk.R;
    new_map['s'] = dk.S;
    new_map['t'] = dk.T;
    new_map['u'] = dk.U;
    new_map['v'] = dk.V;
    new_map['w'] = dk.W;
    new_map['x'] = dk.X;
    new_map['y'] = dk.Y;
    new_map['z'] = dk.Z;
    new_map['A'] = dk.A;
    new_map['B'] = dk.B;
    new_map['C'] = dk.C;
    new_map['D'] = dk.D;
    new_map['E'] = dk.E;
    new_map['F'] = dk.F;
    new_map['G'] = dk.G;
    new_map['H'] = dk.H;
    new_map['I'] = dk.I;
    new_map['J'] = dk.J;
    new_map['K'] = dk.K;
    new_map['L'] = dk.L;
    new_map['M'] = dk.M;
    new_map['N'] = dk.N;
    new_map['O'] = dk.O;
    new_map['P'] = dk.P;
    new_map['Q'] = dk.Q;
    new_map['R'] = dk.R;
    new_map['S'] = dk.S;
    new_map['T'] = dk.T;
    new_map['U'] = dk.U;
    new_map['V'] = dk.V;
    new_map['W'] = dk.W;
    new_map['X'] = dk.X;
    new_map['Y'] = dk.Y;
    new_map['Z'] = dk.Z;
    new_map['1'] = dk.N1;
    new_map['2'] = dk.N2;
    new_map['3'] = dk.N3;
    new_map['4'] = dk.N4;
    new_map['5'] = dk.N5;
    new_map['6'] = dk.N6;
    new_map['7'] = dk.N7;
    new_map['8'] = dk.N8;
    new_map['9'] = dk.N9;
    new_map['0'] = dk.N0;
    new_map[' '] = dk.SPACE;
    new_map['.'] = dk.DOT;
    return new_map;
}
pub fn print(str: []u8, queue: *zigmkay.core.OutputCommandQueue) !void {
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
