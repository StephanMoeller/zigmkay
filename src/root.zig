pub const keycodes = struct {
    pub const us = @import("keycodes/us.zig");
    pub const dk = @import("keycodes/dk.zig");
    pub const de = @import("keycodes/de.zig");
};

pub const microzig = @import("microzig");
pub const rp2xxx = microzig.hal;
pub const time = rp2xxx.time;

pub const zigmkay = @import("zigmkay/zigmkay.zig");
