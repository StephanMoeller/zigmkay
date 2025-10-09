const dk = @import("../../../keycodes/dk.zig");
const us = @import("../../../keycodes/us.zig");
const std = @import("std");
const core = @import("../../../zigmkay/core.zig");
const microzig = @import("microzig");
const rollercole_shared_keymap = @import("../shared_keymap.zig");

const rp2xxx = microzig.hal;

pub const key_count = 36;

// zig fmt: off
pub const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{ .name = "led", .direction = .out },
    .GPIO11 = .{ .name = "col", .direction = .out },

    .GPIO13 = .{ .name = "GP13", .direction = .in, .pull = .up },
    .GPIO28 = .{ .name = "GP28", .direction = .in, .pull = .up },
    .GPIO12 = .{ .name = "GP12", .direction = .in, .pull = .up },
    .GPIO29 = .{ .name = "GP29", .direction = .in, .pull = .up },
    .GPIO0 = .{ .name = "GP0", .direction = .in, .pull = .up },

    .GPIO22 = .{ .name = "GP22", .direction = .in, .pull = .up },
    .GPIO14 = .{ .name = "GP14", .direction = .in , .pull = .up},
    .GPIO26 = .{ .name = "GP26", .direction = .in, .pull = .up },
    .GPIO4 = .{ .name = "GP4", .direction = .in , .pull = .up},
    .GPIO27 = .{ .name = "GP27", .direction = .in , .pull = .up},

    .GPIO21 = .{ .name = "GP21", .direction = .in, .pull = .up },
    .GPIO23 = .{ .name = "GP23", .direction = .in , .pull = .up},
    .GPIO7 = .{ .name = "GP7", .direction = .in, .pull = .up },
    .GPIO20 = .{ .name = "GP20", .direction = .in , .pull = .up},
    .GPIO6 = .{ .name = "GP06", .direction = .in , .pull = .up},

.GPIO16 = .{ .name = "GP16", .direction = .in, .pull = .up },
    .GPIO9 = .{ .name = "GP9", .direction = .in , .pull = .up},
    .GPIO8 = .{ .name = "GP8", .direction = .in , .pull = .up},

};
pub const p = pin_config.pins();

pub const pin_mappings_left = [key_count]?[2]usize{
  .{0,0}, .{0,1},  .{0,2},  .{0, 3}, .{0,4},       null, null, null, null, null,
  .{0,5}, .{0,6},  .{0,7},  .{0,8},  .{0,9},       null, null, null, null, null,
  .{0,10},.{0,11}, .{0,12}, .{0,13}, .{0,14},      null, null, null, null, null,
                   .{0,15},   .{0,16},   .{0,17},        null, null, null
};
pub const pin_mappings_right = [key_count]?[2]usize{
   null, null, null, null, null,  .{0,4},.{0,3},.{0,2},.{0,1},.{0,0},
   null, null, null, null, null,   .{0,9},.{0,8},.{0,7},.{0,6},.{0,5},
   null, null, null, null, null,   .{0,14}, .{0,13},.{0,12},.{0,11},.{0,10},
               null, null, null,   .{0, 17}, .{0, 16}, .{0, 15}
};
const layer_count = rollercole_shared_keymap.keymap.len;

const ____ = core.KeyDef.none;
const boot = core.KeyDef{ .tap_only = .{ .key_press = us.BOOT } };
pub fn get_keymap() [layer_count][key_count]core.KeyDef{
    var keymap: [layer_count][key_count]core.KeyDef = undefined;
    for(rollercole_shared_keymap.keymap, 0..) |l, layer_idx|{
        keymap[layer_idx] = .{
            l[0],  l[1],  l[2],  l[3],  l[4],     l[5],  l[6],  l[7],  l[8],  l[9],
            l[10],l[11], l[12], l[13], l[14],    l[15], l[16], l[17], l[18], l[19],
            ____,l[20], l[21], l[22], l[23],     l[24], l[25], l[26], l[27], ____,
                                boot,l[28],____, ____,l[29],boot,

        };
    }
    return keymap;
}

pub const dimensions = core.KeymapDimensions{ .key_count = key_count, .layer_count = layer_count };
pub const pin_cols = [_]rp2xxx.gpio.Pin{ p.col };
pub const pin_rows = [_]rp2xxx.gpio.Pin{ p.GP13, p.GP28, p.GP12, p.GP29, p.GP0, p.GP22, p.GP14, p.GP26, p.GP4, p.GP27, p.GP21, p.GP23, p.GP7, p.GP20, p.GP06, p.GP16, p.GP9, p.GP8 };
