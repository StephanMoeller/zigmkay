const std = @import("std");
const core = @import("core.zig");

pub const Processor = struct {
    pub fn Process(
        self: Processor,
        comptime KeyCount: usize,
        comptime LayerCount: usize,
        keymap: *const [LayerCount][KeyCount]core.KeyDef,
        input: *core.KeyboardStateChangeQueue,
        output_queue: *core.OutputCommandQueue,
    ) !void {
        _ = self;
        // todo: hold-support
        // todo: take layouts into concideration here
        // todo: combo support
        while (input.Count() > 0) {
            const next_event = input.*.read_all_values()[0];
            const current_layer_index: usize = 0;
            const key_def = keymap[current_layer_index][next_event.key_index];
            if (next_event.pressed == 1) {
                try output_queue.enqueue(core.OutputCommand{ .KeyCodePress = key_def.keycode });
            } else {
                try output_queue.enqueue(core.OutputCommand{ .KeyCodeRelease = key_def.keycode });
            }
            try input.dequeue_count(1);
        }
    }
};
