const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Controls the crystal oscillator
pub const XOSC = extern struct {
    /// Crystal Oscillator Control
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Frequency range. An invalid setting will retain the previous value. The actual value being used can be read from STATUS_FREQ_RANGE. This resets to 0xAA0 and cannot be changed.
        FREQ_RANGE: enum(u12) {
            @"1_15MHZ" = 0xaa0,
            RESERVED_1 = 0xaa1,
            RESERVED_2 = 0xaa2,
            RESERVED_3 = 0xaa3,
            _,
        },
        /// On power-up this field is initialised to DISABLE and the chip runs from the ROSC. If the chip has subsequently been programmed to run from the XOSC then DISABLE may lock-up the chip. If this is a concern then run the clk_ref from the ROSC and enable the clk_sys RESUS feature. The 12-bit code is intended to give some protection against accidental writes. An invalid setting will enable the oscillator.
        ENABLE: enum(u12) {
            DISABLE = 0xd1e,
            ENABLE = 0xfab,
            _,
        },
        padding: u8 = 0,
    }),
    /// Crystal Oscillator Status
    /// offset: 0x04
    STATUS: mmio.Mmio(packed struct(u32) {
        /// The current frequency range setting, always reads 0
        FREQ_RANGE: enum(u2) {
            @"1_15MHZ" = 0x0,
            RESERVED_1 = 0x1,
            RESERVED_2 = 0x2,
            RESERVED_3 = 0x3,
        },
        reserved12: u10 = 0,
        /// Oscillator is enabled but not necessarily running and stable, resets to 0
        ENABLED: u1,
        reserved24: u11 = 0,
        /// An invalid value has been written to CTRL_ENABLE or CTRL_FREQ_RANGE or DORMANT
        BADWRITE: u1,
        reserved31: u6 = 0,
        /// Oscillator is running and stable
        STABLE: u1,
    }),
    /// Crystal Oscillator pause control
    /// offset: 0x08
    DORMANT: mmio.Mmio(packed struct(u32) {
        /// This is used to save power by pausing the XOSC On power-up this field is initialised to WAKE An invalid write will also select WAKE Warning: stop the PLLs before selecting dormant mode Warning: setup the irq before selecting dormant mode
        DORMANT: enum(u32) {
            dormant = 0x636f6d61,
            WAKE = 0x77616b65,
            _,
        },
    }),
    /// Controls the startup delay
    /// offset: 0x0c
    STARTUP: mmio.Mmio(packed struct(u32) {
        /// in multiples of 256*xtal_period. The reset value of 0xc4 corresponds to approx 50 000 cycles.
        DELAY: u14,
        reserved20: u6 = 0,
        /// Multiplies the startup_delay by 4. This is of little value to the user given that the delay can be programmed directly.
        X4: u1,
        padding: u11 = 0,
    }),
    /// offset: 0x10
    reserved16: [12]u8,
    /// A down counter running at the xosc frequency which counts to zero and stops. To start the counter write a non-zero value. Can be used for short software pauses when setting up time sensitive hardware.
    /// offset: 0x1c
    COUNT: mmio.Mmio(packed struct(u32) {
        COUNT: u8,
        padding: u24 = 0,
    }),
};
