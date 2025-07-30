const std = @import("std");
const zigmkay = @import("zigmkay.zig");
const core = zigmkay.core;

const helpers = @import("processing.test_helpers.zig");
const init_test_full = helpers.init_test_full;

const a = 0x04;
const b = 0x05;
const c = 0x06;
const d = 0x07;
const e = 0x08;
const f = 0x09;
const g = 0x10;

const A = helpers.TAP(a);
const B = helpers.TAP(b);
const C = helpers.TAP(c);
const D = helpers.TAP(d);
const E = helpers.TAP(e);
const F = helpers.TAP(f);
const G = helpers.TAP(g);

const no_combos: [0]core.Combo2Def = [0]core.Combo2Def{};
const no_functions: core.CustomFunctions = .{ .on_hold_exit = null, .on_hold_enter = null };

test "on tap enter" {
    const my_functions = struct {
        var on_hold_enter_counter: u8 = 0;
        var on_hold_exit_counter: u8 = 0;
        fn on_event(event: core.ProcessorEvent) void {
            _ = event;
        }
    };

    _ = my_functions;
    //    const custom_func = core.CustomFunctions{ .on_hold_enter = my_functions.on_hold_enter, .on_hold_exit = my_functions.on_hold_exit };
    //  const hold_left_shift = comptime helpers.HOLD_MOD(core.Modifiers{ .left_shift = true });
    //  const current_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(100);
    //  const base_layer = comptime [_]core.KeyDef{ hold_left_shift, B, C, D };
    //
    //  const keymap = comptime [_][base_layer.len]core.KeyDef{base_layer};
    //  var o = init_test_full(core.KeymapDimensions{ .key_count = base_layer.len, .layer_count = keymap.len }, &keymap, &no_combos, &custom_func){};
    //
    //  try std.testing.expectEqual(0, my_functions.on_hold_enter_counter);
    //  try std.testing.expectEqual(0, my_functions.on_hold_exit_counter);
    //
    //  try o.matrix_change_queue.enqueue(.{ .time = current_time, .pressed = true, .key_index = 0 });
    //  try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    //
    //  try std.testing.expectEqual(1, my_functions.on_hold_enter_counter);
    //  try std.testing.expectEqual(0, my_functions.on_hold_exit_counter);
    //
    //  try o.matrix_change_queue.enqueue(.{ .time = current_time, .pressed = false, .key_index = 0 });
    //  try o.processor.Process(&o.matrix_change_queue, &o.actions_queue, current_time);
    //
    //  try std.testing.expectEqual(1, my_functions.on_hold_enter_counter);
    //  try std.testing.expectEqual(1, my_functions.on_hold_exit_counter);
}
