const std = @import("std");
const core = @import("core.zig");

pub fn Process(
    comptime KeyCount: usize,
    comptime LayerCount: usize,
    keymap: *const [LayerCount][KeyCount]core.KeyDef,
    input: *core.InputEventQueue,
    output_queue: *core.ActionQueue,
) !void {

    // todo: hold-support
    // todo: take layouts into concideration here
    // todo: combo support

    while (input.Count() > 0) {
        const next_event = input.*.read_all_values()[0];
        const current_layer_index: usize = 0;
        switch (next_event) {
            .key_pressed => |event| {
                const pressed_key_def = keymap[current_layer_index][event.key_index];
                try output_queue.enqueue(core.Action{ .KeyCodePress = pressed_key_def.keycode });
            },
            .key_released => |event| {
                const released_key_def = keymap[current_layer_index][event.key_index];
                try output_queue.enqueue(core.Action{ .KeyCodeRelease = released_key_def.keycode });
            },
        }
        try input.dequeue_count(1);
    }
}
