const core = @import("core.zig");
const std = @import("std");

test "Modifiers.add" {
    var mod = core.Modifiers{ .left_shift = true, .left_ctrl = true, .left_gui = true };
    const mod1 = core.Modifiers{ .left_alt = true, .left_ctrl = true };
    const result = mod.add(mod1);

    try std.testing.expectEqual(core.Modifiers{ .left_ctrl = true, .left_alt = true, .left_gui = true, .left_shift = true }, result);
}

test "Modifiers.remove" {
    var mod = core.Modifiers{ .left_shift = true, .left_ctrl = true, .left_gui = true };
    const mod1 = core.Modifiers{ .left_alt = true, .left_ctrl = true };
    const result = mod.remove(mod1);

    try std.testing.expectEqual(core.Modifiers{ .left_gui = true, .left_shift = true }, result);
}
