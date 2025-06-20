const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const PADS_QSPI = extern struct {
    /// Voltage select. Per bank control
    /// offset: 0x00
    VOLTAGE_SELECT: mmio.Mmio(packed struct(u32) {
        VOLTAGE_SELECT: enum(u1) {
            /// Set voltage to 3.3V (DVDD >= 2V5)
            @"3v3" = 0x0,
            /// Set voltage to 1.8V (DVDD <= 1V8)
            @"1v8" = 0x1,
        },
        padding: u31 = 0,
    }),
    /// Pad control register
    /// offset: 0x04
    GPIO_QSPI_SCLK: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: enum(u2) {
            @"2mA" = 0x0,
            @"4mA" = 0x1,
            @"8mA" = 0x2,
            @"12mA" = 0x3,
        },
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x08
    GPIO_QSPI_SD0: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: enum(u2) {
            @"2mA" = 0x0,
            @"4mA" = 0x1,
            @"8mA" = 0x2,
            @"12mA" = 0x3,
        },
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x0c
    GPIO_QSPI_SD1: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: enum(u2) {
            @"2mA" = 0x0,
            @"4mA" = 0x1,
            @"8mA" = 0x2,
            @"12mA" = 0x3,
        },
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x10
    GPIO_QSPI_SD2: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: enum(u2) {
            @"2mA" = 0x0,
            @"4mA" = 0x1,
            @"8mA" = 0x2,
            @"12mA" = 0x3,
        },
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x14
    GPIO_QSPI_SD3: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: enum(u2) {
            @"2mA" = 0x0,
            @"4mA" = 0x1,
            @"8mA" = 0x2,
            @"12mA" = 0x3,
        },
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x18
    GPIO_QSPI_SS: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: enum(u2) {
            @"2mA" = 0x0,
            @"4mA" = 0x1,
            @"8mA" = 0x2,
            @"12mA" = 0x3,
        },
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
};
