const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const PADS_BANK0 = extern struct {
    pub const DriveStrength = enum(u2) {
        @"2mA" = 0x0,
        @"4mA" = 0x1,
        @"8mA" = 0x2,
        @"12mA" = 0x3,
    };

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
    GPIO0: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x08
    GPIO1: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x0c
    GPIO2: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x10
    GPIO3: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x14
    GPIO4: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x18
    GPIO5: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x1c
    GPIO6: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x20
    GPIO7: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x24
    GPIO8: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x28
    GPIO9: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x2c
    GPIO10: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x30
    GPIO11: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x34
    GPIO12: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x38
    GPIO13: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x3c
    GPIO14: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x40
    GPIO15: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x44
    GPIO16: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x48
    GPIO17: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x4c
    GPIO18: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x50
    GPIO19: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x54
    GPIO20: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x58
    GPIO21: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x5c
    GPIO22: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x60
    GPIO23: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x64
    GPIO24: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x68
    GPIO25: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x6c
    GPIO26: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x70
    GPIO27: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x74
    GPIO28: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x78
    GPIO29: mmio.Mmio(packed struct(u32) {
        /// Slew rate control. 1 = Fast, 0 = Slow
        SLEWFAST: u1,
        /// Enable schmitt trigger
        SCHMITT: u1,
        /// Pull down enable
        PDE: u1,
        /// Pull up enable
        PUE: u1,
        /// Drive strength.
        DRIVE: DriveStrength,
        /// Input enable
        IE: u1,
        /// Output disable. Has priority over output enable from peripherals
        OD: u1,
        padding: u24 = 0,
    }),
    /// Pad control register
    /// offset: 0x7c
    SWCLK: mmio.Mmio(packed struct(u32) {
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
    /// offset: 0x80
    SWD: mmio.Mmio(packed struct(u32) {
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
