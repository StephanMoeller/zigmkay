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

test "LayerLogic" {
    var layers = core.LayerLogic{};
    try std.testing.expectEqual(true, layers.IsLayerActive(0)); // base is always active
    try std.testing.expectEqual(false, layers.IsLayerActive(1)); // base is always active
    try std.testing.expectEqual(false, layers.IsLayerActive(6)); // base is always active
    try std.testing.expectEqual(false, layers.IsLayerActive(4)); // base is always active
    try std.testing.expectEqual(false, layers.IsLayerActive(7)); // base is always active

    layers.Activate(6);

    layers.Activate(4);
    layers.Activate(4);

    layers.Activate(7);
    layers.Activate(7);
    layers.Deactivate(7);

    try std.testing.expectEqual(true, layers.IsLayerActive(0)); // base is always active
    try std.testing.expectEqual(false, layers.IsLayerActive(1)); // base is always active
    try std.testing.expectEqual(true, layers.IsLayerActive(6)); // base is always active
    try std.testing.expectEqual(true, layers.IsLayerActive(4)); // base is always active
    try std.testing.expectEqual(false, layers.IsLayerActive(7)); // base is always active
}
