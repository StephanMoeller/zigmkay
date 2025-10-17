const zigmkay = @import("../../../zigmkay/zigmkay.zig");
const dk = @import("../../../keycodes/dk.zig");

const core = zigmkay.core;
const std = @import("std");
const rp2xxx = @import("microzig").hal;
const time = rp2xxx.time;

const rollercole_shared_keymap = @import("../shared_keymap.zig");

// zig fmt: off
pub const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{ .name = "led_red", .direction = .out },
    .GPIO16 = .{ .name = "led_green", .direction = .out },
    .GPIO25 = .{ .name = "led_blue", .direction = .out },

    .GPIO26 = .{ .name = "c0", .direction = .out },
    .GPIO27 = .{ .name = "c1", .direction = .out },
    .GPIO28 = .{ .name = "c2", .direction = .out },
    .GPIO29 = .{ .name = "c3", .direction = .out },
    .GPIO6 = .{ .name = "c4", .direction = .out },

    .GPIO7 = .{ .name = "r0", .direction = .in },
    .GPIO0 = .{ .name = "r1", .direction = .in },
    .GPIO3 = .{ .name = "r2", .direction = .in },

    .GPIO4 = .{ .name = "r3", .direction = .in },
    .GPIO2 = .{ .name = "r4", .direction = .in },
    .GPIO1 = .{ .name = "r5", .direction = .in },
};
pub const p = pin_config.pins();

pub const pin_mappings = [rollercole_shared_keymap.key_count]?[2]usize{
   .{4,0},.{3,0},.{2,0},.{1,0},.{0,0},  .{0,5},.{1,5},.{2,5},.{3,5},.{4,5},
   .{4,1},.{3,1},.{2,1},.{1,1},.{0,1},  .{0,4},.{1,4},.{2,4},.{3,4},.{4,4},
          .{3,2},.{2,2},.{1,2},.{0,2},  .{0,3},.{1,3},.{2,3},.{3,3},
                               .{4,2},  .{4,3}
};
pub const pin_cols = [_]rp2xxx.gpio.Pin{ p.c0, p.c1, p.c2, p.c3, p.c4 };
pub const pin_rows = [_]rp2xxx.gpio.Pin{ p.r0, p.r1, p.r2, p.r3, p.r4, p.r5 };

pub fn main() !void {

    // Init pins
    pin_config.apply(); // dont know how this could be done inside the module, but it needs to be done for things to work
        zigmkay.run_primary(
            rollercole_shared_keymap.dimensions,
            pin_cols[0..],
            pin_rows[0..],
            .{.debounce = .{ .ms = 25 } },
            rollercole_shared_keymap.combos[0..],
            &rollercole_shared_keymap.custom_functions,
            pin_mappings,
            &rollercole_shared_keymap.keymap,

            rollercole_shared_keymap.sides,
            null,// no uart, this is not a split keyboard
        ) catch {

        };
    
}
