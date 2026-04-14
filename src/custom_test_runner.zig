// Inspiration from: https://www.openmymind.net/Using-A-Custom-Test-Runner-In-Zig/
const std = @import("std");
const builtin = @import("builtin");

pub fn main() !void {
    for (builtin.test_functions) |t| {
        t.func() catch |err| {
            std.debug.print("TEST RESULT: FAIL {s} FAIL: {}\n", .{ t.name, err });
            if (@errorReturnTrace()) |trace| {
                std.debug.dumpStackTrace(trace.*);
            }
            continue;
        };
        std.debug.print("TEST RESULT: SUCCESS {s} ok\n", .{t.name});
    }
}

