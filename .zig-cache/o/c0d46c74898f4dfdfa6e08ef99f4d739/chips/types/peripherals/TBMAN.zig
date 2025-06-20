const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Testbench manager. Allows the programmer to know what platform their software is running on.
pub const TBMAN = extern struct {
    /// Indicates the type of platform in use
    /// offset: 0x00
    PLATFORM: mmio.Mmio(packed struct(u32) {
        /// Indicates the platform is an ASIC
        ASIC: u1,
        /// Indicates the platform is an FPGA
        FPGA: u1,
        padding: u30 = 0,
    }),
};
