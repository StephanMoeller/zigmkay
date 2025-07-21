const std = @import("std");
const core = @import("core.zig");

pub fn CreateProcessorType(comptime keymap_dimensions: core.KeymapDimensions, comptime keymap: *const [keymap_dimensions.layer_count][keymap_dimensions.key_count]core.KeyDef) type {
    return struct {
        fn warn(comptime msg: []const u8) void {
            _ = msg;
            //std.log.warn(msg, .{});
        }
        const Self = @This();
        layers_activations: core.LayerActivations = .{},

        // release_map is used to keep track of what to do when a key is released as the layer activations may have changed since is was pressed
        var release_map: [28]KeyReleaseAction = [_]KeyReleaseAction{KeyReleaseAction.None} ** 28;

        // The currently activated modifiers
        var modifiers: core.Modifiers = .{};

        fn apply_tap(tap: core.TapDef, event: core.MatrixStateChange, output_queue: *core.OutputCommandQueue) !void {
            if (tap.tap_modifiers) |tap_modifiers| {
                warn("tap with modifier - all done at once");
                // temporarily apply the modifiers on the key def and then switch back to the current modifiers afterwards
                try output_queue.enqueue(.{ .ModifiersChanged = tap_modifiers });
                try output_queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
                try output_queue.enqueue(.{ .KeyCodeRelease = tap.tap_keycode });
                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
            } else {
                warn("tap with modifier - release set");
                release_map[event.key_index] = KeyReleaseAction{ .ReleaseTap = tap };
                try output_queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
            }
        }
        fn apply_hold(self: *Self, hold: core.HoldDef, event: core.MatrixStateChange, output_queue: *core.OutputCommandQueue) !void {
            if (hold.hold_modifiers != null) {
                // Apply the hold modifier(s)
                modifiers = modifiers.add(hold.hold_modifiers.?);
                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
            }
            if (hold.hold_layer != null) {
                self.layers_activations.activate(hold.hold_layer.?);
            }

            release_map[event.key_index] = KeyReleaseAction{ .ReleaseHold = hold };
        }
        fn determine_key_def(self: *Self, key_index: usize) core.KeyDef {
            // Find key on active position
            var pressed_key_def = keymap[0][key_index];

            var layer_index: usize = @as(usize, keymap_dimensions.layer_count - 1);
            while (layer_index > 0) {
                // transparent support: ...
                if (self.layers_activations.is_layer_active(layer_index) and keymap[layer_index][key_index] != core.KeyDef.transparent) {
                    pressed_key_def = keymap[layer_index][key_index];
                    break;
                }
                layer_index -= 1;
            }
            return pressed_key_def;
        }
        pub fn Process(
            self: *Self,
            input: *core.MatrixStateChangeQueue,
            output_queue: *core.OutputCommandQueue,
            current_time: core.TimeSinceBoot,
        ) !void {
            // todo: hold-support
            // todo: take layouts into concideration here
            // todo: combo support
            //
            // idea: decide tap / hold / undecisive (wait some more)
            while (input.Count() > 0) {
                const current_event = try input.dequeue();
                if (current_event.pressed) {
                    const pressed_key_def = determine_key_def(self, current_event.key_index);
                    switch (pressed_key_def) {
                        .tap_only => |tap| {
                            try apply_tap(tap, current_event, output_queue);
                        },
                        .hold_only => |hold| {
                            try apply_hold(self, hold, current_event, output_queue);
                        },
                        .tap_hold => |tap_and_hold| {
                            warn("1 pressed");
                            const data = input.peek_all();

                            const next_event_or_current_time: core.TimeSinceBoot = if (data.len > 0) data[0].time else current_time;
                            const tapping_term_exceeded: bool = next_event_or_current_time - current_event.time > tap_and_hold.tapping_term_ms;
                            const next_event_before_tapping_term: bool = if (data.len > 0) data[0].time - current_event.time < tap_and_hold.tapping_term_ms else false;

                            // tapping term expired - hold
                            // same key released withing tapping term - tap
                            if (tapping_term_exceeded) {
                                warn("1 pressed A");
                                try apply_hold(self, tap_and_hold.hold, current_event, output_queue);
                            } else if (next_event_before_tapping_term) {
                                // todo: this case is not covered by any tests
                                warn("1 pressed B");
                                try apply_tap(tap_and_hold.tap, current_event, output_queue);
                            } else {
                                // Add back the event to the queue
                                // TODO: In case multible events are in the queue, indecisive cases will cause wrongful order of elements in queue if the first one is just re-enqueued as the tail
                                try input.enqueue(current_event);
                                return;
                            }
                        },
                        .transparent => {},
                        .none => {},
                    }
                } else {
                    warn("1 released");
                    // in special cases, tapping is all done at press time, hence no release action (eg when a key should be tapped with a modifier applied to it)
                    switch (release_map[current_event.key_index]) {
                        .None => {
                            warn("1 released c");
                        },
                        .ReleaseTap => |tap_def| {
                            warn("1 released a");
                            try output_queue.enqueue(core.OutputCommand{ .KeyCodeRelease = tap_def.tap_keycode });
                            release_map[current_event.key_index] = KeyReleaseAction.None;
                        },
                        .ReleaseHold => |hold_def| {
                            warn("1 released B");
                            if (hold_def.hold_modifiers != null) {
                                // Cancel the hold modifier(s)
                                modifiers = modifiers.remove(hold_def.hold_modifiers.?);
                                try output_queue.enqueue(.{ .ModifiersChanged = modifiers });
                            }
                            if (hold_def.hold_layer != null) {
                                self.layers_activations.deactivate(hold_def.hold_layer.?);
                            }
                            release_map[current_event.key_index] = KeyReleaseAction.None;
                        },
                    }
                }
            }
        }
    };
}

const State = enum
{
    None,
    TapHoldPressed,
    OtherKeyPressed,
    SameKeyReleased,
    TappingTermElapsed
}
const Command = 
const StateMachine = struct{

}

const LC = 0x00E0;
const LS = 0x00E1;
const LA = 0x00E2;
const LG = 0x00E3;
const RC = 0x00E4;
const RS = 0x00E5;
const RA = 0x00E6;
const RG = 0x00E7;

const KeyReleaseAction = union(enum) {
    None,
    ReleaseTap: core.TapDef,
    ReleaseHold: core.HoldDef,
};
