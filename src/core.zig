const generic_queue = @import("generic_queue.zig");

pub const KeyDef = struct { keycode: u8 };

// a key definition that only has a tap functionality

pub const Action = union(enum) {
    KeyCodePress: u8, //this should be extended with some sort of mod information
    KeyCodeRelease: u8, //-,,-
};
const KeyIndex = usize;
pub const InputEvent = union(enum) { key_pressed: KeyIndex, key_released: KeyIndex };

const std = @import("std");
pub const InputEventQueue = generic_queue.GenericQueue(InputEvent, 100);
pub const ActionQueue = generic_queue.GenericQueue(Action, 100);

pub fn Process(
    comptime KeyCount: usize,
    comptime LayerCount: usize,
    keymap: *const [LayerCount][KeyCount]KeyDef,
    input: *InputEventQueue,
    output_queue: *ActionQueue,
) !void {

    // todo: hold-support
    // todo: take layouts into concideration here
    // todo: combo support

    while (input.Count() > 0) {
        const next_event = input.*.read_all_values()[0];
        const current_layer_index: usize = 0;
        switch (next_event) {
            .key_pressed => |idx| {
                const pressed_key_def = keymap[current_layer_index][idx];
                try output_queue.enqueue(Action{ .KeyCodePress = pressed_key_def.keycode });
            },
            .key_released => |idx| {
                const released_key_def = keymap[current_layer_index][idx];
                try output_queue.enqueue(Action{ .KeyCodeRelease = released_key_def.keycode });
            },
        }
        try input.dequeue_count(1);
    }
}

// pub const ScanSettings = struct { debounce_ms: u8 };
// pub fn scan(settings: ScanSettings) u8 {}
