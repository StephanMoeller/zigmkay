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
