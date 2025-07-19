const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const TestObjects = struct {
    keyboard_change_queue: core.KeyboardStateChangeQueue,
    actions_queue: core.OutputCommandQueue,
    processor: zigmkay.processing.Processor,
};
fn init_test() TestObjects {
    return TestObjects{
        .keyboard_change_queue = zigmkay.core.KeyboardStateChangeQueue.Create(),
        .actions_queue = zigmkay.core.OutputCommandQueue.Create(),
        .processor = zigmkay.processing.CreateProcessor(),
    };
}
// test stuff
test "TAP - single key press" {
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const base_layer = [_]core.KeyDef{ A, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(1, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "TAP - single key release" {
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const base_layer = [_]core.KeyDef{ A, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    try std.testing.expectEqual(1, o.actions_queue.Count()); // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "TAP - multiple simple tap events" {
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const base_layer = [_]core.KeyDef{ A, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(5, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "TAP_WITH_MOD - single key press" {
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const shiftedA = core.KeyDef.TAP_WITH_MOD(0x04, .{ .left_shift = true });
    const base_layer = [_]core.KeyDef{ shiftedA, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    // define some input events
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(4, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = 0x04 }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = 0x04 }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "TAP_WITH_MOD - with other keys" {
    // with other keys pressed between press and release
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const shiftedA = core.KeyDef.TAP_WITH_MOD(0x04, .{ .left_shift = true });
    const normalB = core.KeyDef.TAP(0x05);
    const base_layer = [_]core.KeyDef{ shiftedA, normalB, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 }); // Press A + shift
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 }); // Press B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 }); // Release A + shift
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 }); // Release B

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(6, o.actions_queue.Count());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "HOLD_MOD - single hold" {
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const hold_left_shift = core.KeyDef.HOLD_MOD(core.Modifiers{ .left_shift = true });
    const base_layer = [_]core.KeyDef{ hold_left_shift, B, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 }); // Press left shift
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 }); // Press B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 }); // Release B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 }); // Release left shift

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "HOLD_MOD - multiple holds" {
    // multiple mod hold presses at the same time
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const hold_left_shift = core.KeyDef.HOLD_MOD(core.Modifiers{ .left_shift = true });
    const hold_left_alt = core.KeyDef.HOLD_MOD(core.Modifiers{ .left_alt = true });
    const base_layer = [_]core.KeyDef{ hold_left_shift, hold_left_alt, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 }); // Press left shift
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 }); // Press left alt
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 }); // Press C
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 2 }); // Release C
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 }); // Release left shift first (to mix things up)
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 }); // Release left alt

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true, .left_alt = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_alt = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "HOLD_MOD combined with TAP_WITH_MOD" {
    // hold mods combined with modified taps - ensure tap mods will be applied temporarily and then cancelled again after the tap while hold mods are kept
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const c_with_left_gui = core.KeyDef.TAP_WITH_MOD(0x06, .{ .left_gui = true });
    const hold_left_shift = core.KeyDef.HOLD_MOD(core.Modifiers{ .left_shift = true });
    const hold_left_alt = core.KeyDef.HOLD_MOD(core.Modifiers{ .left_alt = true });
    const base_layer = [_]core.KeyDef{ hold_left_shift, hold_left_alt, c_with_left_gui, D, E };
    const keymap = [_][base_layer.len]core.KeyDef{base_layer};

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 }); // Press left shift
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 }); // Press left alt
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 3 }); // Press D
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 3 }); // Release D

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 }); // Press gui+C
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 2 }); // Release gui+C

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 4 }); // Press E
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 4 }); // Release E

    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 }); // Release left alt
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 }); // Release left shift

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // expect B to be fired as press
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true, .left_alt = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = d }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = d }, try o.actions_queue.dequeue());

    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_gui = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = c }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = c }, try o.actions_queue.dequeue());

    // now expect shifting back to previous mods
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true, .left_alt = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = e }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = e }, try o.actions_queue.dequeue());

    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{ .left_shift = true } }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .ModifiersChanged = .{} }, try o.actions_queue.dequeue());

    // expect event removed from input_events
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}
test "Layers - simple switch" {
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const mo_key = core.KeyDef.MO(1);
    const base_layer = [_]core.KeyDef{ A, B, mo_key, D };
    const other_layer = [_]core.KeyDef{ E, F, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, other_layer };

    // switch layer
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 }); //mo_key pressed
    // tap
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = f }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = f }, try o.actions_queue.dequeue());

    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}
test "Layers - complex switch" {
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const mo_key = core.KeyDef.MO(1);
    const base_layer = [_]core.KeyDef{ A, B, mo_key, D };
    const other_layer = [_]core.KeyDef{ E, F, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, other_layer };

    // Tap B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Tap A
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    // Hold for layer switch
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 }); //mo_key pressed

    // Tap F
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Tap E
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    // Release layer switch again
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 2 }); //mo_key released

    // Tap B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Tap A
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // Expect B tapped
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());

    // Expect A
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    // At this point, layer 1 is expected to be activated

    // Expect F
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = f }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = f }, try o.actions_queue.dequeue());

    // Expect E
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = e }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = e }, try o.actions_queue.dequeue());

    // At this point, layer 1 is expected to be deactivated again

    // Expect B tapped
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());

    // Expect A
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    // Expect no more actions
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "MO - ensure correct release key" {
    // Specifically test that a key pressed existing on layer A is also what is released even though the layer changed between press and release
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const mo_key = core.KeyDef.MO(1);
    const base_layer = [_]core.KeyDef{ A, B, mo_key, D };
    const other_layer = [_]core.KeyDef{ E, F, C, D };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, other_layer };

    // Tap B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });

    // Hold for layer switch
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 }); //mo_key pressed

    // Tap E
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });

    // Release B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // release layer switch
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 2 }); //mo_key pressed

    // Release E
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // Press B expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    // Press E expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = e }, try o.actions_queue.dequeue());
    // Release B expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    // Release E expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = e }, try o.actions_queue.dequeue());

    // Expect no more actions
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}
test "Layers - multiple layers case 1" {
    // multiple layer switches, hold 1, hold 2, release 2, release 1
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const mo1_key = core.KeyDef.MO(1);
    const mo2_key = core.KeyDef.MO(2);
    const base_layer = [_]core.KeyDef{ A, B, mo1_key, D };
    const layer_1 = [_]core.KeyDef{ E, F, A, mo2_key };
    const layer_2 = [_]core.KeyDef{ C, G, C, C };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, layer_1, layer_2 };

    // Tap B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Hold for layer switch 1
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 }); //mo_key pressed

    // Tap F
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Hold for layer switch 2
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 3 }); //mo_key pressed

    // Tap G
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Release layer 2
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 3 }); //mo_key pressed

    // Tap F
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Release layer 1
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 2 }); //mo_key pressed

    // Tap B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // Press B expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    // Press F expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = f }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = f }, try o.actions_queue.dequeue());
    // Press G expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = g }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = g }, try o.actions_queue.dequeue());
    // Press F expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = f }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = f }, try o.actions_queue.dequeue());
    // Press B expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    // Expect no more actions
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}
test "Layers - multiple layers case 2" {
    //Layers - multiple layer switches, hold 1, hold 2, release 1, release 2
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const mo1_key = core.KeyDef.MO(1);
    const mo2_key = core.KeyDef.MO(2);
    const base_layer = [_]core.KeyDef{ A, B, mo1_key, D };
    const layer_1 = [_]core.KeyDef{ E, F, A, mo2_key };
    const layer_2 = [_]core.KeyDef{ C, G, C, C };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, layer_1, layer_2 };

    // Tap B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Hold for layer switch 1
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 }); //mo_key pressed

    // Tap F
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Hold for layer switch 2
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 3 }); //mo_key pressed

    // Tap G
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Release layer 1
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 2 }); //mo_key pressed

    // Tap G
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    // Release layer 2
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 3 }); //mo_key pressed

    // Tap B
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 1 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // Press B expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    // Press F expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = f }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = f }, try o.actions_queue.dequeue());
    // Press G expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = g }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = g }, try o.actions_queue.dequeue());
    // Press G expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = g }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = g }, try o.actions_queue.dequeue());
    // Press B expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = b }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = b }, try o.actions_queue.dequeue());
    // Expect no more actions
    try std.testing.expectEqual(0, o.actions_queue.Count());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "TRANSPARENT case 1" {
    // Transparent key - ensure key on lower active layers used - case A - expect fallback to next active layer
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const mo1_key = core.KeyDef.MO(1);
    const mo2_key = core.KeyDef.MO(2);
    const mo3_key = core.KeyDef.MO(3);
    const base_layer = [_]core.KeyDef{ A, mo1_key, mo2_key, A, A, A };
    const layer_1 = [_]core.KeyDef{ B, B, B, mo3_key, B, B };
    const layer_2 = [_]core.KeyDef{ C, C, C, C, C, C };
    const layer_3 = [_]core.KeyDef{ core.KeyDef.TRANSPARENT(), core.KeyDef.NONE(), D, D, D, D };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, layer_1, layer_2, layer_3 };

    // Hold for layer switch 1 and 3
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 3 });

    // Tap a transparent key at position 0 which is transparent - expect layer 1's key do be pushed
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // Press B expected
    try std.testing.expectEqual(b, (try o.actions_queue.dequeue()).KeyCodePress);
    try std.testing.expectEqual(b, (try o.actions_queue.dequeue()).KeyCodeRelease);

    // Expect no more actions
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}
test "TRANSPARENT case 2" {
    // Layers - transparent key - ensure key on lower active layers used - case B - transparent on lower layers as well, expect fallback to base layer
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const mo1_key = core.KeyDef.MO(1);
    const mo2_key = core.KeyDef.MO(2);
    const mo3_key = core.KeyDef.MO(3);
    const base_layer = [_]core.KeyDef{ A, mo1_key, mo2_key, A, A, A };
    const layer_1 = [_]core.KeyDef{ core.KeyDef.TRANSPARENT(), B, B, mo3_key, B, B };
    const layer_2 = [_]core.KeyDef{ C, C, C, C, C, C };
    const layer_3 = [_]core.KeyDef{ core.KeyDef.TRANSPARENT(), core.KeyDef.NONE(), D, D, D, D };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, layer_1, layer_2, layer_3 };

    // Hold for layer switch 1 and 3
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 3 });

    // Tap a transparent key at position 0 which is transparent - expect layer 1's key do be pushed
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // Press A expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    // Expect no more actions
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}

test "TRANSPARENT case 3" {
    // Layers - transparent key - ensure transparent key on base layer won't do anything
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const mo1_key = core.KeyDef.MO(1);
    const mo2_key = core.KeyDef.MO(2);
    const mo3_key = core.KeyDef.MO(3);
    const base_layer = [_]core.KeyDef{ core.KeyDef.TRANSPARENT(), mo1_key, mo2_key, mo3_key, A, A };
    const layer_1 = [_]core.KeyDef{ core.KeyDef.TRANSPARENT(), B, B, B, B, B };
    const layer_2 = [_]core.KeyDef{ C, C, C, C, C, C };
    const layer_3 = [_]core.KeyDef{ core.KeyDef.TRANSPARENT(), core.KeyDef.NONE(), D, D, D, D };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, layer_1, layer_2, layer_3 };

    // Hold for layer switch 1 and 3
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 1 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 3 });

    // Tap a transparent key at position 0 which is transparent - expect layer 1's key do be pushed
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // Expect no more actions
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "MO - invalid layer id" {
    // ensure nothing breaks if referencing too high layer index
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const mo4_key = core.KeyDef.MO(4);
    const base_layer = [_]core.KeyDef{ A, A, A, mo4_key };
    const layer_1 = [_]core.KeyDef{ B, B, B, B };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };

    // Hold for invalid layer switch
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 3 });

    // Tap a transparent key at position 0 which is transparent - expect layer 1's key do be pushed
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // expect A pressed as no layer switch is expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());

    // Expect no more actions
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
}

test "NONE key" {
    // Expect nothing to happen
    var o = init_test();

    const current_time: core.TimeSinceBoot = 100;
    const mo1_key = core.KeyDef.MO(1);
    const base_layer = [_]core.KeyDef{ A, A, mo1_key };
    const layer_1 = [_]core.KeyDef{ core.KeyDef.NONE(), D, D };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };

    // Hold for layer switch 1
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 2 });

    // Tap a transparent key at position 0 which is NONE - expect nothing to happen
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // Expect no more actions
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}

test "LT tap/hold layer - tap case 1" {
    var o = init_test();
    const current_time: core.TimeSinceBoot = 100;
    const tapping_terms_ms: u16 = 250;
    const mo_layer1_cWithLeftAlt = core.KeyDef.LT(1, c, .{ .left_alt = true }, tapping_terms_ms);

    const base_layer = [_]core.KeyDef{ mo_layer1_cWithLeftAlt, B, A };
    const layer_1 = [_]core.KeyDef{ D, E, F };
    const keymap = [_][base_layer.len]core.KeyDef{ base_layer, layer_1 };

    // Tap a transparent key at position 0 which is just a normal key
    try o.keyboard_change_queue.enqueue(.{ .time = 100, .pressed = true, .key_index = 0 });
    // Release withing the tapping term
    try o.keyboard_change_queue.enqueue(.{ .time = 100 + tapping_terms_ms - 1, .pressed = false, .key_index = 0 });

    try o.processor.Process(base_layer.len, keymap.len, &keymap, &o.keyboard_change_queue, &o.actions_queue, current_time);

    // expect A pressed as no layer switch is expected
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodePress = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(core.OutputCommand{ .KeyCodeRelease = a }, try o.actions_queue.dequeue());
    try std.testing.expectEqual(0, o.keyboard_change_queue.Count());
    try std.testing.expectEqual(0, o.actions_queue.Count());
}

test "tap/hold mod - case: tap" {
    // Tap and release within tapping term
}

test "tap/hold layer - case: hold" {
    // Tap and release within tapping term
}
test "tap/hold mod - case: hold" {
    // Tap and release within tapping term
}
const a = 0x04;
const b = 0x05;
const c = 0x06;
const d = 0x07;
const e = 0x08;
const f = 0x09;
const g = 0x10;

const A = core.KeyDef.TAP(a);
const B = core.KeyDef.TAP(b);
const C = core.KeyDef.TAP(c);
const D = core.KeyDef.TAP(d);
const E = core.KeyDef.TAP(e);
const F = core.KeyDef.TAP(f);
const G = core.KeyDef.TAP(g);

const dummy_time = core.TimeStamp{ .time_us_since_boot = 0 };
