const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const SYSINFO = extern struct {
    /// JEDEC JEP-106 compliant chip identifier.
    /// offset: 0x00
    CHIP_ID: mmio.Mmio(packed struct(u32) {
        MANUFACTURER: u12,
        PART: u16,
        REVISION: u4,
    }),
    /// Platform register. Allows software to know what environment it is running in.
    /// offset: 0x04
    PLATFORM: mmio.Mmio(packed struct(u32) {
        FPGA: u1,
        ASIC: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x08
    reserved8: [8]u8,
    /// Git hash of the chip source. Used to identify chip version.
    /// offset: 0x10
    GITREF_RP2040: mmio.Mmio(packed struct(u32) {
        GITREF_RP2040: u32,
    }),
};
