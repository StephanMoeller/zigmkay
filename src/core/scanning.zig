const std = @import("std");
const core = @import("core.zig");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;

// Compile-time pin configuration
const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{ .name = "led_red", .direction = .out },
    .GPIO16 = .{ .name = "led_green", .direction = .out },
    .GPIO25 = .{ .name = "led_blue", .direction = .out },

    .GPIO6 = .{ .name = "col_inner", .direction = .in },
    .GPIO29 = .{ .name = "col_index", .direction = .in },
    .GPIO28 = .{ .name = "col_mid", .direction = .in },
    .GPIO27 = .{ .name = "col_ring", .direction = .in },
    .GPIO26 = .{ .name = "col_pinky", .direction = .in },

    .GPIO2 = .{ .name = "row_top", .direction = .out },
    .GPIO4 = .{ .name = "row_home", .direction = .out },
    .GPIO3 = .{ .name = "row_bottom", .direction = .out },
};

pub const Scanner = struct {
    pub fn Scan(self: Scanner, output_queue: *core.KeyboardEventQueue) !void {
        _ = self;
        var v = output_queue.*;
        _ = v.Count();
    }
};
