const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;
pub fn init_test(comptime keymap_dimensions: core.KeymapDimensions, comptime keymap: *const [keymap_dimensions.layer_count][keymap_dimensions.key_count]core.KeyDef) type {
    const ProcessorType = zigmkay.processing.CreateProcessorType(
        keymap_dimensions,
        keymap,
    );
    return struct {
        const Self = @This();
        matrix_change_queue: zigmkay.core.MatrixStateChangeQueue = zigmkay.core.MatrixStateChangeQueue.Create(),
        actions_queue: zigmkay.core.OutputCommandQueue = zigmkay.core.OutputCommandQueue.Create(),
        processor: ProcessorType = ProcessorType{},
        pub fn press_key(self: *Self, key_index: usize, time: core.TimeSinceBoot) !void {
            try self.matrix_change_queue.enqueue(.{ .time = time, .pressed = true, .key_index = key_index });
        }
        pub fn release_key(self: *Self, key_index: usize, time: core.TimeSinceBoot) !void {
            try self.matrix_change_queue.enqueue(.{ .time = time, .pressed = false, .key_index = key_index });
        }
    };
}

pub fn TAP(keycode: u8) core.KeyDef {
    return core.KeyDef{ .tap_only = .{ .tap_keycode = keycode } };
}
pub fn TAP_WITH_MOD(keycode: u8, modifiers: core.Modifiers) core.KeyDef {
    return core.KeyDef{ .tap_only = .{ .tap_keycode = keycode, .tap_modifiers = modifiers } };
}
pub fn HOLD_MOD(modifiers: core.Modifiers) core.KeyDef {
    return core.KeyDef{ .hold_only = .{ .hold_modifiers = modifiers } };
}
pub fn MO(layer: core.LayerIndex) core.KeyDef {
    return core.KeyDef{ .hold_only = .{ .hold_layer = layer } };
}
pub fn LT(layer: core.LayerIndex, tap_keycode: u8, tap_modifiers: core.Modifiers, tapping_term_ms: core.TappingTermType) core.KeyDef {
    return core.KeyDef{ .tap_hold = .{
        .tap = .{ .tap_keycode = tap_keycode, .tap_modifiers = tap_modifiers },
        .hold = .{ .hold_layer = layer },
        .tapping_term_ms = tapping_term_ms,
        .retro_tapping = false,
    } };
}
pub fn MT(tap: core.TapDef, hold_mods: core.Modifiers, tapping_term_ms: core.TappingTermType) core.KeyDef {
    return core.KeyDef{ .tap_hold = .{
        .tap = tap,
        .hold = core.HoldDef{ .hold_modifiers = hold_mods },
        .tapping_term_ms = tapping_term_ms,
        .retro_tapping = false,
    } };
}
