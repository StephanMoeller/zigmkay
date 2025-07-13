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
    var layers = core.LayerActivations{};
    try std.testing.expectEqual(true, layers.is_layer_active(0)); // base is always active
    try std.testing.expectEqual(false, layers.is_layer_active(1)); // base is always active
    try std.testing.expectEqual(false, layers.is_layer_active(6)); // base is always active
    try std.testing.expectEqual(false, layers.is_layer_active(4)); // base is always active
    try std.testing.expectEqual(false, layers.is_layer_active(7)); // base is always active

    layers.activate(6);

    layers.activate(4);
    layers.activate(4);

    layers.activate(7);
    layers.activate(7);
    layers.deactivate(7);

    try std.testing.expectEqual(true, layers.is_layer_active(0)); // base is always active
    try std.testing.expectEqual(false, layers.is_layer_active(1)); // base is always active
    try std.testing.expectEqual(true, layers.is_layer_active(6)); // base is always active
    try std.testing.expectEqual(true, layers.is_layer_active(4)); // base is always active
    try std.testing.expectEqual(false, layers.is_layer_active(7)); // base is always active
}

test "KeyDef.TRANSPARENT()" {
    // Ensure consistency with is_transparent()
    try std.testing.expectEqual(true, core.KeyDef.TRANSPARENT().is_transparent());
    try std.testing.expectEqual(false, core.KeyDef.NONE().is_transparent());
    try std.testing.expectEqual(false, core.KeyDef.MO(1).is_transparent());
    try std.testing.expectEqual(false, core.KeyDef.HOLD_MOD(.{}).is_transparent());
    try std.testing.expectEqual(false, core.KeyDef.TAP(1).is_transparent());
    try std.testing.expectEqual(false, core.KeyDef.TAP_WITH_MOD(1, .{}).is_transparent());
}
