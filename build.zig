const std = @import("std");
const microzig = @import("microzig");

const MicroBuild = microzig.MicroBuild(.{
    .rp2xxx = true,
});

pub fn build(b: *std.Build) void {
    const mz_dep = b.dependency("microzig", .{});
    const mb = MicroBuild.init(b, mz_dep) orelse return;

    const firmware = mb.add_firmware(.{
        .name = "blinky",
        .target = mb.ports.rp2xxx.boards.raspberrypi.pico,
        .optimize = .ReleaseSmall,
        .root_source_file = b.path("src/main.zig"),
    });

    // We call this twice to demonstrate that the default binary output for
    // RP2040 is UF2, but we can also output other formats easily
    mb.install_firmware(firmware, .{});

    const test_files = &[_][]const u8{
        "src/zigmkay/core.test.zig",
        "src/zigmkay/processing.test.retrotapping.zig",
        "src/zigmkay/processing.test.permissive_hold.zig",
        "src/zigmkay/processing.test.basics.tap_only.zig",
        "src/zigmkay/processing.test.basics.hold_only.zig",
        "src/zigmkay/processing.test.basics.trans_none.zig",
        "src/zigmkay/processing.test.tap_hold.zig",
        "src/zigmkay/processing.test.autofire.zig",
        "src/zigmkay/processing.test.one_shot.zig",
        "src/zigmkay/processing.test.struct_sizes.zig",
        "src/zigmkay/processing.test.rolling_keys.zig",
        "src/zigmkay/processing.test.combos_single.zig",
        "src/zigmkay/processing.test.combos_advanced.zig",
        "src/zigmkay/processing.test.custom_functions.zig",
        "src/zigmkay/processing.test.basics.multitap_same_keycode.zig",
        "src/zigmkay/output_command_queue.test.zig",
        "src/zigmkay/generic_queue.test.zig",
    };

    const test_step = b.step("test", "Run unit tests");

    for (test_files) |path| {
        const test_exe = b.addTest(.{ .root_source_file = .{ .src_path = .{ .owner = b, .sub_path = path } } });
        const run = b.addRunArtifact(test_exe);
        test_step.dependOn(&run.step);
    }
}
