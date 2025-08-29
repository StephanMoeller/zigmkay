pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    _ = b.addModule("zigmkay", .{
        .root_source_file = b.path("src/zigmkay/zigmkay.zig"),
        .target = target,
        .optimize = optimize,
    });
}

const std = @import("std");
