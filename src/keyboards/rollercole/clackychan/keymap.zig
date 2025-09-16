const dk = @import("../../../keycodes/dk.zig");
const us = @import("../../../keycodes/us.zig");
const std = @import("std");
const core = @import("../../../zigmkay/core.zig");
const microzig = @import("microzig");
pub const rollercole_shared_keymap = @import("../shared_keymap.zig");

const rp2xxx = microzig.hal;

// zig fmt: off
pub const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO6 = .{ .name = "col", .direction = .out },

    .GPIO7 = .{ .name = "k7", .direction = .in },
    .GPIO8 = .{ .name = "k8", .direction = .in },
    .GPIO9 = .{ .name = "k9", .direction = .in },
    .GPIO12 = .{ .name = "k12", .direction = .in },
    .GPIO13 = .{ .name = "k13", .direction = .in },
    .GPIO14 = .{ .name = "k14", .direction = .in },
    .GPIO15 = .{ .name = "k15", .direction = .in },
    .GPIO16 = .{ .name = "k16", .direction = .in },
    .GPIO21 = .{ .name = "k21", .direction = .in },
    .GPIO23 = .{ .name = "k23", .direction = .in },
    .GPIO20 = .{ .name = "k20", .direction = .in },
    .GPIO22 = .{ .name = "k22", .direction = .in },
    .GPIO26 = .{ .name = "k26", .direction = .in },
    .GPIO27 = .{ .name = "k27", .direction = .in },
};
pub const p = pin_config.pins();

pub const pin_mappings_right = [raollercole_shared_keymap.key_count]?[2]usize{
   null, null, null, null, null,  .{0,13},.{0,12},.{0,11},.{0,10},.{0,5},      
   null, null, null, null, null,   .{0,9},.{0,8},.{0,7},.{0,6},.{0,0},  
         null, null, null, null,   .{0,4},.{0,3},.{0,2},.{0,1},
                           null,   null
};

pub const pin_mappings_left = [rollercole_shared_keymap.key_count]?[2]usize{
  .{0,5}, .{0,10},.{0,11},.{0,12},.{0,13},       null, null, null, null, null,      
  .{0,0}, .{0,6}, .{0,7}, .{0,8}, .{0,9},       null, null, null, null, null,
          .{0,1}, .{0,2}, .{0,3}, .{0,4} ,      null, null, null, null,
                                    null,       null
};

pub const pin_cols = [_]rp2xxx.gpio.Pin{ p.col };
pub const pin_rows = [_]rp2xxx.gpio.Pin{ p.k7, p.k8, p.k9, p.k12, p.k13, p.k14, p.k15, p.k16, p.k21, p.k23, p.k20, p.k22, p.k26, p.k27 };
