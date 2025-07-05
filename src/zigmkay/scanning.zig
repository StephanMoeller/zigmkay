const std = @import("std");
const core = @import("core.zig");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
pub const Scanner = struct {
    pub fn DetectKeyboardChanges(self: Scanner, output_queue: *core.KeyboardStateChangeQueue) !void {
        _ = self;
        var v = output_queue.*;
        _ = v.Count();
    }
};
const ScannerCreationError = error{DublicateCoordinates};
pub fn CreateScanner(comptime keyCount: u8, comptime pin_mappings: [keyCount][2]u8) Scanner {
    comptime {
        var err_msg: []const u8 = undefined;
        return CreateScanner_inner(keyCount, pin_mappings, &err_msg) catch {
            @compileError(err_msg);
        };
    }
}
fn CreateScanner_inner(comptime keyCount: u8, comptime pin_mappings: [keyCount][2]u8, err_msg: *[]const u8) ScannerCreationError!Scanner {
    // Ensure same position not present multiple times in mappings
    for (pin_mappings, 0..) |e, idx| {
        for (pin_mappings, 0..) |e_inner, idx_inner| {
            if (idx != idx_inner) {
                if (e[0] == e_inner[0] and e[1] == e_inner[1]) {
                    err_msg.* = std.fmt.comptimePrint("The pin x/y combination {}/{} existst on both position {} and {} in the pin map", .{ e[0], e[1], idx, idx_inner });
                    return ScannerCreationError.DublicateCoordinates;
                }
            }
        }
    }
    return Scanner{};
}

test "Ensure dublicate values in pin_mappings will return an errors" {
    comptime var err_msg: []const u8 = undefined;
    const keyCount = 4;
    const mappings_with_dublicates = [keyCount][2]u8{ .{ 0, 0 }, .{ 0, 1 }, .{ 0, 2 }, .{ 0, 1 } };

    const result = comptime CreateScanner_inner(keyCount, mappings_with_dublicates, &err_msg);
    try std.testing.expectEqual(ScannerCreationError.DublicateCoordinates, result);
}

test "Ensure no error if no dublicates" {
    comptime var err_msg: []const u8 = undefined;
    const keyCount = 4;
    const mappings_with_no_errors = [keyCount][2]u8{ .{ 0, 0 }, .{ 0, 1 }, .{ 0, 2 }, .{ 0, 3 } };

    const result = comptime CreateScanner_inner(keyCount, mappings_with_no_errors, &err_msg) catch unreachable;
    try std.testing.expectEqual(Scanner{}, result);
}
