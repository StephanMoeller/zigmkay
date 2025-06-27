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
            .key_pressed => |idx| {
                const pressed_key_def = keymap[current_layer_index][idx];
                try output_queue.enqueue(core.Action{ .KeyCodePress = pressed_key_def.keycode });
            },
            .key_released => |idx| {
                const released_key_def = keymap[current_layer_index][idx];
                try output_queue.enqueue(core.Action{ .KeyCodeRelease = released_key_def.keycode });
            },
        }
        try input.dequeue_count(1);
    }
}

// test stuff
test "tapping - single key press" {
    const KeyCount = 4;
    const LayerCount = 1;

    // define some input events
    var input_event_queue = core.InputEventQueue.Create();
    var actions_queue = core.ActionQueue.Create();

    try input_event_queue.enqueue(.{ .key_pressed = 1 });
    const keymap = [LayerCount][KeyCount]core.KeyDef{.{ A, B, C, D }};

    try Process(KeyCount, LayerCount, &keymap, &input_event_queue, &actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(1, actions_queue.Count());
    try std.testing.expectEqual(core.Action{ .KeyCodePress = b }, try actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, input_event_queue.read_all_values().len);
}

test "tapping - single key release" {
    const KeyCount = 4;
    const LayerCount = 1;

    // define some input events
    var input_event_queue = core.InputEventQueue.Create();
    var actions_queue = core.ActionQueue.Create();

    try input_event_queue.enqueue(.{ .key_released = 1 });
    const keymap = [LayerCount][KeyCount]core.KeyDef{.{ A, B, C, D }};

    try Process(KeyCount, LayerCount, &keymap, &input_event_queue, &actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(1, actions_queue.Count());
    try std.testing.expectEqual(core.Action{ .KeyCodeRelease = b }, try actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, input_event_queue.read_all_values().len);
}

test "tapping - multiple simple tap events" {
    const KeyCount = 4;
    const LayerCount = 1;

    // define some input events
    var input_event_queue = core.InputEventQueue.Create();
    var actions_queue = core.ActionQueue.Create();

    try input_event_queue.enqueue(.{ .key_pressed = 1 });
    try input_event_queue.enqueue(.{ .key_released = 1 });
    try input_event_queue.enqueue(.{ .key_pressed = 2 });
    try input_event_queue.enqueue(.{ .key_pressed = 0 });
    try input_event_queue.enqueue(.{ .key_released = 0 });

    const keymap = [LayerCount][KeyCount]core.KeyDef{.{ A, B, C, D }};

    try Process(KeyCount, LayerCount, &keymap, &input_event_queue, &actions_queue);

    // expect B to be fired as press
    try std.testing.expectEqual(5, actions_queue.Count());
    try std.testing.expectEqual(core.Action{ .KeyCodePress = b }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.Action{ .KeyCodeRelease = b }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.Action{ .KeyCodePress = c }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.Action{ .KeyCodePress = a }, try actions_queue.dequeue());
    try std.testing.expectEqual(core.Action{ .KeyCodeRelease = a }, try actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, input_event_queue.Count());
}

const a = 0x04;
const b = 0x05;
const c = 0x06;
const d = 0x07;
const A = TapOnly(a);
const B = TapOnly(b);
const C = TapOnly(c);
const D = TapOnly(d);
pub fn TapOnly(keycode: u8) core.KeyDef {
    return core.KeyDef{ .keycode = keycode };
}
