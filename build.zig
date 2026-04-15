const std = @import("std");

const fs = @import("fs");
const mem = @import("mem");
const microzig = @import("microzig");

const MicroBuild = microzig.MicroBuild(.{
    .rp2xxx = true,
});

pub fn build(b: *std.Build) void {
    const zigmkay_mod = b.addModule("zigmkay", .{
        .root_source_file = .{
            .src_path = .{ .owner = b, .sub_path = "src/root.zig" },
        },
    });

    const test_compile_step = b.step("test_compile", "Compile unit tests");
    const test_run_step = b.step("test_compile_run", "Run unit tests");
    const target = b.standardTargetOptions(.{});

    // Iterate all test files
    const test_dir = "src/zigmkay";
    var src_dir = b.build_root.handle.openDir(test_dir, .{ .iterate = true }) catch |err|
        std.debug.panic("Failed to open '{s}': {}", .{ test_dir, err });
    defer src_dir.close();

    var walker = src_dir.walk(b.allocator) catch |err|
        std.debug.panic("Failed to walk '{s}': {}", .{ test_dir, err });

    defer walker.deinit();

    while (walker.next() catch |err| std.debug.panic("Failed to iterate: {}", .{err})) |entry| {
        if (entry.kind == .file and std.mem.indexOf(u8, entry.basename, ".test.") != null) {
            const test_file_path = std.fmt.allocPrint(b.allocator, "src/zigmkay/{s}", .{entry.path}) catch unreachable;
            //std.debug.print("{s}\n", .{test_file_path});

            const test_file_module = b.createModule(.{
                .root_source_file = .{ .src_path = .{ .owner = b, .sub_path = test_file_path } },
                .target = target,
            });
            test_file_module.addImport("zigmkay", zigmkay_mod);

            const test_exe = b.addTest(.{ .root_module = test_file_module });

            const test_run = b.addRunArtifact(test_exe);
            test_run_step.dependOn(&test_run.step);
            test_compile_step.dependOn(&test_exe.step);
        }
    }
}
