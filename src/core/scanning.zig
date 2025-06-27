const std = @import("std");
const core = @import("core.zig");

pub const Scanner = struct {
    pub fn Scan(self: Scanner, output_queue: *core.KeyboardEventQueue) !void {
        _ = self;
        var v = output_queue.*;
        _ = v.Count();
    }
};
