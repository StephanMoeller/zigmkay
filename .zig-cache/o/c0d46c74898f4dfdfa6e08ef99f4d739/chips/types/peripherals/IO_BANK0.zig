const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const IO_BANK0 = extern struct {
    /// GPIO status
    /// offset: 0x00
    GPIO0_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x04
    GPIO0_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            jtag_tck = 0x0,
            spi0_rx = 0x1,
            uart0_tx = 0x2,
            i2c0_sda = 0x3,
            pwm_a_0 = 0x4,
            sio_0 = 0x5,
            pio0_0 = 0x6,
            pio1_0 = 0x7,
            usb_muxing_overcurr_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x08
    GPIO1_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x0c
    GPIO1_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            jtag_tms = 0x0,
            spi0_ss_n = 0x1,
            uart0_rx = 0x2,
            i2c0_scl = 0x3,
            pwm_b_0 = 0x4,
            sio_1 = 0x5,
            pio0_1 = 0x6,
            pio1_1 = 0x7,
            usb_muxing_vbus_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x10
    GPIO2_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x14
    GPIO2_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            jtag_tdi = 0x0,
            spi0_sclk = 0x1,
            uart0_cts = 0x2,
            i2c1_sda = 0x3,
            pwm_a_1 = 0x4,
            sio_2 = 0x5,
            pio0_2 = 0x6,
            pio1_2 = 0x7,
            usb_muxing_vbus_en = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x18
    GPIO3_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x1c
    GPIO3_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            jtag_tdo = 0x0,
            spi0_tx = 0x1,
            uart0_rts = 0x2,
            i2c1_scl = 0x3,
            pwm_b_1 = 0x4,
            sio_3 = 0x5,
            pio0_3 = 0x6,
            pio1_3 = 0x7,
            usb_muxing_overcurr_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x20
    GPIO4_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x24
    GPIO4_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_rx = 0x1,
            uart1_tx = 0x2,
            i2c0_sda = 0x3,
            pwm_a_2 = 0x4,
            sio_4 = 0x5,
            pio0_4 = 0x6,
            pio1_4 = 0x7,
            usb_muxing_vbus_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x28
    GPIO5_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x2c
    GPIO5_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_ss_n = 0x1,
            uart1_rx = 0x2,
            i2c0_scl = 0x3,
            pwm_b_2 = 0x4,
            sio_5 = 0x5,
            pio0_5 = 0x6,
            pio1_5 = 0x7,
            usb_muxing_vbus_en = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x30
    GPIO6_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x34
    GPIO6_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_sclk = 0x1,
            uart1_cts = 0x2,
            i2c1_sda = 0x3,
            pwm_a_3 = 0x4,
            sio_6 = 0x5,
            pio0_6 = 0x6,
            pio1_6 = 0x7,
            usb_muxing_extphy_softcon = 0x8,
            usb_muxing_overcurr_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x38
    GPIO7_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x3c
    GPIO7_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_tx = 0x1,
            uart1_rts = 0x2,
            i2c1_scl = 0x3,
            pwm_b_3 = 0x4,
            sio_7 = 0x5,
            pio0_7 = 0x6,
            pio1_7 = 0x7,
            usb_muxing_extphy_oe_n = 0x8,
            usb_muxing_vbus_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x40
    GPIO8_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x44
    GPIO8_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_rx = 0x1,
            uart1_tx = 0x2,
            i2c0_sda = 0x3,
            pwm_a_4 = 0x4,
            sio_8 = 0x5,
            pio0_8 = 0x6,
            pio1_8 = 0x7,
            usb_muxing_extphy_rcv = 0x8,
            usb_muxing_vbus_en = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x48
    GPIO9_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x4c
    GPIO9_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_ss_n = 0x1,
            uart1_rx = 0x2,
            i2c0_scl = 0x3,
            pwm_b_4 = 0x4,
            sio_9 = 0x5,
            pio0_9 = 0x6,
            pio1_9 = 0x7,
            usb_muxing_extphy_vp = 0x8,
            usb_muxing_overcurr_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x50
    GPIO10_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x54
    GPIO10_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_sclk = 0x1,
            uart1_cts = 0x2,
            i2c1_sda = 0x3,
            pwm_a_5 = 0x4,
            sio_10 = 0x5,
            pio0_10 = 0x6,
            pio1_10 = 0x7,
            usb_muxing_extphy_vm = 0x8,
            usb_muxing_vbus_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x58
    GPIO11_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x5c
    GPIO11_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_tx = 0x1,
            uart1_rts = 0x2,
            i2c1_scl = 0x3,
            pwm_b_5 = 0x4,
            sio_11 = 0x5,
            pio0_11 = 0x6,
            pio1_11 = 0x7,
            usb_muxing_extphy_suspnd = 0x8,
            usb_muxing_vbus_en = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x60
    GPIO12_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x64
    GPIO12_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_rx = 0x1,
            uart0_tx = 0x2,
            i2c0_sda = 0x3,
            pwm_a_6 = 0x4,
            sio_12 = 0x5,
            pio0_12 = 0x6,
            pio1_12 = 0x7,
            usb_muxing_extphy_speed = 0x8,
            usb_muxing_overcurr_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x68
    GPIO13_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x6c
    GPIO13_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_ss_n = 0x1,
            uart0_rx = 0x2,
            i2c0_scl = 0x3,
            pwm_b_6 = 0x4,
            sio_13 = 0x5,
            pio0_13 = 0x6,
            pio1_13 = 0x7,
            usb_muxing_extphy_vpo = 0x8,
            usb_muxing_vbus_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x70
    GPIO14_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x74
    GPIO14_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_sclk = 0x1,
            uart0_cts = 0x2,
            i2c1_sda = 0x3,
            pwm_a_7 = 0x4,
            sio_14 = 0x5,
            pio0_14 = 0x6,
            pio1_14 = 0x7,
            usb_muxing_extphy_vmo = 0x8,
            usb_muxing_vbus_en = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x78
    GPIO15_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x7c
    GPIO15_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_tx = 0x1,
            uart0_rts = 0x2,
            i2c1_scl = 0x3,
            pwm_b_7 = 0x4,
            sio_15 = 0x5,
            pio0_15 = 0x6,
            pio1_15 = 0x7,
            usb_muxing_digital_dp = 0x8,
            usb_muxing_overcurr_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x80
    GPIO16_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x84
    GPIO16_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_rx = 0x1,
            uart0_tx = 0x2,
            i2c0_sda = 0x3,
            pwm_a_0 = 0x4,
            sio_16 = 0x5,
            pio0_16 = 0x6,
            pio1_16 = 0x7,
            usb_muxing_digital_dm = 0x8,
            usb_muxing_vbus_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x88
    GPIO17_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x8c
    GPIO17_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_ss_n = 0x1,
            uart0_rx = 0x2,
            i2c0_scl = 0x3,
            pwm_b_0 = 0x4,
            sio_17 = 0x5,
            pio0_17 = 0x6,
            pio1_17 = 0x7,
            usb_muxing_vbus_en = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x90
    GPIO18_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x94
    GPIO18_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_sclk = 0x1,
            uart0_cts = 0x2,
            i2c1_sda = 0x3,
            pwm_a_1 = 0x4,
            sio_18 = 0x5,
            pio0_18 = 0x6,
            pio1_18 = 0x7,
            usb_muxing_overcurr_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0x98
    GPIO19_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0x9c
    GPIO19_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_tx = 0x1,
            uart0_rts = 0x2,
            i2c1_scl = 0x3,
            pwm_b_1 = 0x4,
            sio_19 = 0x5,
            pio0_19 = 0x6,
            pio1_19 = 0x7,
            usb_muxing_vbus_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0xa0
    GPIO20_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0xa4
    GPIO20_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_rx = 0x1,
            uart1_tx = 0x2,
            i2c0_sda = 0x3,
            pwm_a_2 = 0x4,
            sio_20 = 0x5,
            pio0_20 = 0x6,
            pio1_20 = 0x7,
            clocks_gpin_0 = 0x8,
            usb_muxing_vbus_en = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0xa8
    GPIO21_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0xac
    GPIO21_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_ss_n = 0x1,
            uart1_rx = 0x2,
            i2c0_scl = 0x3,
            pwm_b_2 = 0x4,
            sio_21 = 0x5,
            pio0_21 = 0x6,
            pio1_21 = 0x7,
            clocks_gpout_0 = 0x8,
            usb_muxing_overcurr_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0xb0
    GPIO22_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0xb4
    GPIO22_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_sclk = 0x1,
            uart1_cts = 0x2,
            i2c1_sda = 0x3,
            pwm_a_3 = 0x4,
            sio_22 = 0x5,
            pio0_22 = 0x6,
            pio1_22 = 0x7,
            clocks_gpin_1 = 0x8,
            usb_muxing_vbus_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0xb8
    GPIO23_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0xbc
    GPIO23_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi0_tx = 0x1,
            uart1_rts = 0x2,
            i2c1_scl = 0x3,
            pwm_b_3 = 0x4,
            sio_23 = 0x5,
            pio0_23 = 0x6,
            pio1_23 = 0x7,
            clocks_gpout_1 = 0x8,
            usb_muxing_vbus_en = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0xc0
    GPIO24_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0xc4
    GPIO24_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_rx = 0x1,
            uart1_tx = 0x2,
            i2c0_sda = 0x3,
            pwm_a_4 = 0x4,
            sio_24 = 0x5,
            pio0_24 = 0x6,
            pio1_24 = 0x7,
            clocks_gpout_2 = 0x8,
            usb_muxing_overcurr_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0xc8
    GPIO25_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0xcc
    GPIO25_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_ss_n = 0x1,
            uart1_rx = 0x2,
            i2c0_scl = 0x3,
            pwm_b_4 = 0x4,
            sio_25 = 0x5,
            pio0_25 = 0x6,
            pio1_25 = 0x7,
            clocks_gpout_3 = 0x8,
            usb_muxing_vbus_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0xd0
    GPIO26_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0xd4
    GPIO26_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_sclk = 0x1,
            uart1_cts = 0x2,
            i2c1_sda = 0x3,
            pwm_a_5 = 0x4,
            sio_26 = 0x5,
            pio0_26 = 0x6,
            pio1_26 = 0x7,
            usb_muxing_vbus_en = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0xd8
    GPIO27_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0xdc
    GPIO27_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_tx = 0x1,
            uart1_rts = 0x2,
            i2c1_scl = 0x3,
            pwm_b_5 = 0x4,
            sio_27 = 0x5,
            pio0_27 = 0x6,
            pio1_27 = 0x7,
            usb_muxing_overcurr_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0xe0
    GPIO28_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0xe4
    GPIO28_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_rx = 0x1,
            uart0_tx = 0x2,
            i2c0_sda = 0x3,
            pwm_a_6 = 0x4,
            sio_28 = 0x5,
            pio0_28 = 0x6,
            pio1_28 = 0x7,
            usb_muxing_vbus_detect = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// GPIO status
    /// offset: 0xe8
    GPIO29_STATUS: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// output signal from selected peripheral, before register override is applied
        OUTFROMPERI: u1,
        /// output signal to pad after register override is applied
        OUTTOPAD: u1,
        reserved12: u2 = 0,
        /// output enable from selected peripheral, before register override is applied
        OEFROMPERI: u1,
        /// output enable to pad after register override is applied
        OETOPAD: u1,
        reserved17: u3 = 0,
        /// input signal from pad, before override is applied
        INFROMPAD: u1,
        reserved19: u1 = 0,
        /// input signal to peripheral, after override is applied
        INTOPERI: u1,
        reserved24: u4 = 0,
        /// interrupt from pad before override is applied
        IRQFROMPAD: u1,
        reserved26: u1 = 0,
        /// interrupt to processors, after override is applied
        IRQTOPROC: u1,
        padding: u5 = 0,
    }),
    /// GPIO control including function select and overrides.
    /// offset: 0xec
    GPIO29_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            spi1_ss_n = 0x1,
            uart0_rx = 0x2,
            i2c0_scl = 0x3,
            pwm_b_6 = 0x4,
            sio_29 = 0x5,
            pio0_29 = 0x6,
            pio1_29 = 0x7,
            usb_muxing_vbus_en = 0x9,
            null = 0x1f,
            _,
        },
        reserved8: u3 = 0,
        OUTOVER: enum(u2) {
            /// drive output from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// drive output low
            LOW = 0x2,
            /// drive output high
            HIGH = 0x3,
        },
        reserved12: u2 = 0,
        OEOVER: enum(u2) {
            /// drive output enable from peripheral signal selected by funcsel
            NORMAL = 0x0,
            /// drive output enable from inverse of peripheral signal selected by funcsel
            INVERT = 0x1,
            /// disable output
            DISABLE = 0x2,
            /// enable output
            ENABLE = 0x3,
        },
        reserved16: u2 = 0,
        INOVER: enum(u2) {
            /// don't invert the peri input
            NORMAL = 0x0,
            /// invert the peri input
            INVERT = 0x1,
            /// drive peri input low
            LOW = 0x2,
            /// drive peri input high
            HIGH = 0x3,
        },
        reserved28: u10 = 0,
        IRQOVER: enum(u2) {
            /// don't invert the interrupt
            NORMAL = 0x0,
            /// invert the interrupt
            INVERT = 0x1,
            /// drive interrupt low
            LOW = 0x2,
            /// drive interrupt high
            HIGH = 0x3,
        },
        padding: u2 = 0,
    }),
    /// Raw Interrupts
    /// offset: 0xf0
    INTR0: mmio.Mmio(packed struct(u32) {
        GPIO0_LEVEL_LOW: u1,
        GPIO0_LEVEL_HIGH: u1,
        GPIO0_EDGE_LOW: u1,
        GPIO0_EDGE_HIGH: u1,
        GPIO1_LEVEL_LOW: u1,
        GPIO1_LEVEL_HIGH: u1,
        GPIO1_EDGE_LOW: u1,
        GPIO1_EDGE_HIGH: u1,
        GPIO2_LEVEL_LOW: u1,
        GPIO2_LEVEL_HIGH: u1,
        GPIO2_EDGE_LOW: u1,
        GPIO2_EDGE_HIGH: u1,
        GPIO3_LEVEL_LOW: u1,
        GPIO3_LEVEL_HIGH: u1,
        GPIO3_EDGE_LOW: u1,
        GPIO3_EDGE_HIGH: u1,
        GPIO4_LEVEL_LOW: u1,
        GPIO4_LEVEL_HIGH: u1,
        GPIO4_EDGE_LOW: u1,
        GPIO4_EDGE_HIGH: u1,
        GPIO5_LEVEL_LOW: u1,
        GPIO5_LEVEL_HIGH: u1,
        GPIO5_EDGE_LOW: u1,
        GPIO5_EDGE_HIGH: u1,
        GPIO6_LEVEL_LOW: u1,
        GPIO6_LEVEL_HIGH: u1,
        GPIO6_EDGE_LOW: u1,
        GPIO6_EDGE_HIGH: u1,
        GPIO7_LEVEL_LOW: u1,
        GPIO7_LEVEL_HIGH: u1,
        GPIO7_EDGE_LOW: u1,
        GPIO7_EDGE_HIGH: u1,
    }),
    /// Raw Interrupts
    /// offset: 0xf4
    INTR1: mmio.Mmio(packed struct(u32) {
        GPIO8_LEVEL_LOW: u1,
        GPIO8_LEVEL_HIGH: u1,
        GPIO8_EDGE_LOW: u1,
        GPIO8_EDGE_HIGH: u1,
        GPIO9_LEVEL_LOW: u1,
        GPIO9_LEVEL_HIGH: u1,
        GPIO9_EDGE_LOW: u1,
        GPIO9_EDGE_HIGH: u1,
        GPIO10_LEVEL_LOW: u1,
        GPIO10_LEVEL_HIGH: u1,
        GPIO10_EDGE_LOW: u1,
        GPIO10_EDGE_HIGH: u1,
        GPIO11_LEVEL_LOW: u1,
        GPIO11_LEVEL_HIGH: u1,
        GPIO11_EDGE_LOW: u1,
        GPIO11_EDGE_HIGH: u1,
        GPIO12_LEVEL_LOW: u1,
        GPIO12_LEVEL_HIGH: u1,
        GPIO12_EDGE_LOW: u1,
        GPIO12_EDGE_HIGH: u1,
        GPIO13_LEVEL_LOW: u1,
        GPIO13_LEVEL_HIGH: u1,
        GPIO13_EDGE_LOW: u1,
        GPIO13_EDGE_HIGH: u1,
        GPIO14_LEVEL_LOW: u1,
        GPIO14_LEVEL_HIGH: u1,
        GPIO14_EDGE_LOW: u1,
        GPIO14_EDGE_HIGH: u1,
        GPIO15_LEVEL_LOW: u1,
        GPIO15_LEVEL_HIGH: u1,
        GPIO15_EDGE_LOW: u1,
        GPIO15_EDGE_HIGH: u1,
    }),
    /// Raw Interrupts
    /// offset: 0xf8
    INTR2: mmio.Mmio(packed struct(u32) {
        GPIO16_LEVEL_LOW: u1,
        GPIO16_LEVEL_HIGH: u1,
        GPIO16_EDGE_LOW: u1,
        GPIO16_EDGE_HIGH: u1,
        GPIO17_LEVEL_LOW: u1,
        GPIO17_LEVEL_HIGH: u1,
        GPIO17_EDGE_LOW: u1,
        GPIO17_EDGE_HIGH: u1,
        GPIO18_LEVEL_LOW: u1,
        GPIO18_LEVEL_HIGH: u1,
        GPIO18_EDGE_LOW: u1,
        GPIO18_EDGE_HIGH: u1,
        GPIO19_LEVEL_LOW: u1,
        GPIO19_LEVEL_HIGH: u1,
        GPIO19_EDGE_LOW: u1,
        GPIO19_EDGE_HIGH: u1,
        GPIO20_LEVEL_LOW: u1,
        GPIO20_LEVEL_HIGH: u1,
        GPIO20_EDGE_LOW: u1,
        GPIO20_EDGE_HIGH: u1,
        GPIO21_LEVEL_LOW: u1,
        GPIO21_LEVEL_HIGH: u1,
        GPIO21_EDGE_LOW: u1,
        GPIO21_EDGE_HIGH: u1,
        GPIO22_LEVEL_LOW: u1,
        GPIO22_LEVEL_HIGH: u1,
        GPIO22_EDGE_LOW: u1,
        GPIO22_EDGE_HIGH: u1,
        GPIO23_LEVEL_LOW: u1,
        GPIO23_LEVEL_HIGH: u1,
        GPIO23_EDGE_LOW: u1,
        GPIO23_EDGE_HIGH: u1,
    }),
    /// Raw Interrupts
    /// offset: 0xfc
    INTR3: mmio.Mmio(packed struct(u32) {
        GPIO24_LEVEL_LOW: u1,
        GPIO24_LEVEL_HIGH: u1,
        GPIO24_EDGE_LOW: u1,
        GPIO24_EDGE_HIGH: u1,
        GPIO25_LEVEL_LOW: u1,
        GPIO25_LEVEL_HIGH: u1,
        GPIO25_EDGE_LOW: u1,
        GPIO25_EDGE_HIGH: u1,
        GPIO26_LEVEL_LOW: u1,
        GPIO26_LEVEL_HIGH: u1,
        GPIO26_EDGE_LOW: u1,
        GPIO26_EDGE_HIGH: u1,
        GPIO27_LEVEL_LOW: u1,
        GPIO27_LEVEL_HIGH: u1,
        GPIO27_EDGE_LOW: u1,
        GPIO27_EDGE_HIGH: u1,
        GPIO28_LEVEL_LOW: u1,
        GPIO28_LEVEL_HIGH: u1,
        GPIO28_EDGE_LOW: u1,
        GPIO28_EDGE_HIGH: u1,
        GPIO29_LEVEL_LOW: u1,
        GPIO29_LEVEL_HIGH: u1,
        GPIO29_EDGE_LOW: u1,
        GPIO29_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Enable for proc0
    /// offset: 0x100
    PROC0_INTE0: mmio.Mmio(packed struct(u32) {
        GPIO0_LEVEL_LOW: u1,
        GPIO0_LEVEL_HIGH: u1,
        GPIO0_EDGE_LOW: u1,
        GPIO0_EDGE_HIGH: u1,
        GPIO1_LEVEL_LOW: u1,
        GPIO1_LEVEL_HIGH: u1,
        GPIO1_EDGE_LOW: u1,
        GPIO1_EDGE_HIGH: u1,
        GPIO2_LEVEL_LOW: u1,
        GPIO2_LEVEL_HIGH: u1,
        GPIO2_EDGE_LOW: u1,
        GPIO2_EDGE_HIGH: u1,
        GPIO3_LEVEL_LOW: u1,
        GPIO3_LEVEL_HIGH: u1,
        GPIO3_EDGE_LOW: u1,
        GPIO3_EDGE_HIGH: u1,
        GPIO4_LEVEL_LOW: u1,
        GPIO4_LEVEL_HIGH: u1,
        GPIO4_EDGE_LOW: u1,
        GPIO4_EDGE_HIGH: u1,
        GPIO5_LEVEL_LOW: u1,
        GPIO5_LEVEL_HIGH: u1,
        GPIO5_EDGE_LOW: u1,
        GPIO5_EDGE_HIGH: u1,
        GPIO6_LEVEL_LOW: u1,
        GPIO6_LEVEL_HIGH: u1,
        GPIO6_EDGE_LOW: u1,
        GPIO6_EDGE_HIGH: u1,
        GPIO7_LEVEL_LOW: u1,
        GPIO7_LEVEL_HIGH: u1,
        GPIO7_EDGE_LOW: u1,
        GPIO7_EDGE_HIGH: u1,
    }),
    /// Interrupt Enable for proc0
    /// offset: 0x104
    PROC0_INTE1: mmio.Mmio(packed struct(u32) {
        GPIO8_LEVEL_LOW: u1,
        GPIO8_LEVEL_HIGH: u1,
        GPIO8_EDGE_LOW: u1,
        GPIO8_EDGE_HIGH: u1,
        GPIO9_LEVEL_LOW: u1,
        GPIO9_LEVEL_HIGH: u1,
        GPIO9_EDGE_LOW: u1,
        GPIO9_EDGE_HIGH: u1,
        GPIO10_LEVEL_LOW: u1,
        GPIO10_LEVEL_HIGH: u1,
        GPIO10_EDGE_LOW: u1,
        GPIO10_EDGE_HIGH: u1,
        GPIO11_LEVEL_LOW: u1,
        GPIO11_LEVEL_HIGH: u1,
        GPIO11_EDGE_LOW: u1,
        GPIO11_EDGE_HIGH: u1,
        GPIO12_LEVEL_LOW: u1,
        GPIO12_LEVEL_HIGH: u1,
        GPIO12_EDGE_LOW: u1,
        GPIO12_EDGE_HIGH: u1,
        GPIO13_LEVEL_LOW: u1,
        GPIO13_LEVEL_HIGH: u1,
        GPIO13_EDGE_LOW: u1,
        GPIO13_EDGE_HIGH: u1,
        GPIO14_LEVEL_LOW: u1,
        GPIO14_LEVEL_HIGH: u1,
        GPIO14_EDGE_LOW: u1,
        GPIO14_EDGE_HIGH: u1,
        GPIO15_LEVEL_LOW: u1,
        GPIO15_LEVEL_HIGH: u1,
        GPIO15_EDGE_LOW: u1,
        GPIO15_EDGE_HIGH: u1,
    }),
    /// Interrupt Enable for proc0
    /// offset: 0x108
    PROC0_INTE2: mmio.Mmio(packed struct(u32) {
        GPIO16_LEVEL_LOW: u1,
        GPIO16_LEVEL_HIGH: u1,
        GPIO16_EDGE_LOW: u1,
        GPIO16_EDGE_HIGH: u1,
        GPIO17_LEVEL_LOW: u1,
        GPIO17_LEVEL_HIGH: u1,
        GPIO17_EDGE_LOW: u1,
        GPIO17_EDGE_HIGH: u1,
        GPIO18_LEVEL_LOW: u1,
        GPIO18_LEVEL_HIGH: u1,
        GPIO18_EDGE_LOW: u1,
        GPIO18_EDGE_HIGH: u1,
        GPIO19_LEVEL_LOW: u1,
        GPIO19_LEVEL_HIGH: u1,
        GPIO19_EDGE_LOW: u1,
        GPIO19_EDGE_HIGH: u1,
        GPIO20_LEVEL_LOW: u1,
        GPIO20_LEVEL_HIGH: u1,
        GPIO20_EDGE_LOW: u1,
        GPIO20_EDGE_HIGH: u1,
        GPIO21_LEVEL_LOW: u1,
        GPIO21_LEVEL_HIGH: u1,
        GPIO21_EDGE_LOW: u1,
        GPIO21_EDGE_HIGH: u1,
        GPIO22_LEVEL_LOW: u1,
        GPIO22_LEVEL_HIGH: u1,
        GPIO22_EDGE_LOW: u1,
        GPIO22_EDGE_HIGH: u1,
        GPIO23_LEVEL_LOW: u1,
        GPIO23_LEVEL_HIGH: u1,
        GPIO23_EDGE_LOW: u1,
        GPIO23_EDGE_HIGH: u1,
    }),
    /// Interrupt Enable for proc0
    /// offset: 0x10c
    PROC0_INTE3: mmio.Mmio(packed struct(u32) {
        GPIO24_LEVEL_LOW: u1,
        GPIO24_LEVEL_HIGH: u1,
        GPIO24_EDGE_LOW: u1,
        GPIO24_EDGE_HIGH: u1,
        GPIO25_LEVEL_LOW: u1,
        GPIO25_LEVEL_HIGH: u1,
        GPIO25_EDGE_LOW: u1,
        GPIO25_EDGE_HIGH: u1,
        GPIO26_LEVEL_LOW: u1,
        GPIO26_LEVEL_HIGH: u1,
        GPIO26_EDGE_LOW: u1,
        GPIO26_EDGE_HIGH: u1,
        GPIO27_LEVEL_LOW: u1,
        GPIO27_LEVEL_HIGH: u1,
        GPIO27_EDGE_LOW: u1,
        GPIO27_EDGE_HIGH: u1,
        GPIO28_LEVEL_LOW: u1,
        GPIO28_LEVEL_HIGH: u1,
        GPIO28_EDGE_LOW: u1,
        GPIO28_EDGE_HIGH: u1,
        GPIO29_LEVEL_LOW: u1,
        GPIO29_LEVEL_HIGH: u1,
        GPIO29_EDGE_LOW: u1,
        GPIO29_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Force for proc0
    /// offset: 0x110
    PROC0_INTF0: mmio.Mmio(packed struct(u32) {
        GPIO0_LEVEL_LOW: u1,
        GPIO0_LEVEL_HIGH: u1,
        GPIO0_EDGE_LOW: u1,
        GPIO0_EDGE_HIGH: u1,
        GPIO1_LEVEL_LOW: u1,
        GPIO1_LEVEL_HIGH: u1,
        GPIO1_EDGE_LOW: u1,
        GPIO1_EDGE_HIGH: u1,
        GPIO2_LEVEL_LOW: u1,
        GPIO2_LEVEL_HIGH: u1,
        GPIO2_EDGE_LOW: u1,
        GPIO2_EDGE_HIGH: u1,
        GPIO3_LEVEL_LOW: u1,
        GPIO3_LEVEL_HIGH: u1,
        GPIO3_EDGE_LOW: u1,
        GPIO3_EDGE_HIGH: u1,
        GPIO4_LEVEL_LOW: u1,
        GPIO4_LEVEL_HIGH: u1,
        GPIO4_EDGE_LOW: u1,
        GPIO4_EDGE_HIGH: u1,
        GPIO5_LEVEL_LOW: u1,
        GPIO5_LEVEL_HIGH: u1,
        GPIO5_EDGE_LOW: u1,
        GPIO5_EDGE_HIGH: u1,
        GPIO6_LEVEL_LOW: u1,
        GPIO6_LEVEL_HIGH: u1,
        GPIO6_EDGE_LOW: u1,
        GPIO6_EDGE_HIGH: u1,
        GPIO7_LEVEL_LOW: u1,
        GPIO7_LEVEL_HIGH: u1,
        GPIO7_EDGE_LOW: u1,
        GPIO7_EDGE_HIGH: u1,
    }),
    /// Interrupt Force for proc0
    /// offset: 0x114
    PROC0_INTF1: mmio.Mmio(packed struct(u32) {
        GPIO8_LEVEL_LOW: u1,
        GPIO8_LEVEL_HIGH: u1,
        GPIO8_EDGE_LOW: u1,
        GPIO8_EDGE_HIGH: u1,
        GPIO9_LEVEL_LOW: u1,
        GPIO9_LEVEL_HIGH: u1,
        GPIO9_EDGE_LOW: u1,
        GPIO9_EDGE_HIGH: u1,
        GPIO10_LEVEL_LOW: u1,
        GPIO10_LEVEL_HIGH: u1,
        GPIO10_EDGE_LOW: u1,
        GPIO10_EDGE_HIGH: u1,
        GPIO11_LEVEL_LOW: u1,
        GPIO11_LEVEL_HIGH: u1,
        GPIO11_EDGE_LOW: u1,
        GPIO11_EDGE_HIGH: u1,
        GPIO12_LEVEL_LOW: u1,
        GPIO12_LEVEL_HIGH: u1,
        GPIO12_EDGE_LOW: u1,
        GPIO12_EDGE_HIGH: u1,
        GPIO13_LEVEL_LOW: u1,
        GPIO13_LEVEL_HIGH: u1,
        GPIO13_EDGE_LOW: u1,
        GPIO13_EDGE_HIGH: u1,
        GPIO14_LEVEL_LOW: u1,
        GPIO14_LEVEL_HIGH: u1,
        GPIO14_EDGE_LOW: u1,
        GPIO14_EDGE_HIGH: u1,
        GPIO15_LEVEL_LOW: u1,
        GPIO15_LEVEL_HIGH: u1,
        GPIO15_EDGE_LOW: u1,
        GPIO15_EDGE_HIGH: u1,
    }),
    /// Interrupt Force for proc0
    /// offset: 0x118
    PROC0_INTF2: mmio.Mmio(packed struct(u32) {
        GPIO16_LEVEL_LOW: u1,
        GPIO16_LEVEL_HIGH: u1,
        GPIO16_EDGE_LOW: u1,
        GPIO16_EDGE_HIGH: u1,
        GPIO17_LEVEL_LOW: u1,
        GPIO17_LEVEL_HIGH: u1,
        GPIO17_EDGE_LOW: u1,
        GPIO17_EDGE_HIGH: u1,
        GPIO18_LEVEL_LOW: u1,
        GPIO18_LEVEL_HIGH: u1,
        GPIO18_EDGE_LOW: u1,
        GPIO18_EDGE_HIGH: u1,
        GPIO19_LEVEL_LOW: u1,
        GPIO19_LEVEL_HIGH: u1,
        GPIO19_EDGE_LOW: u1,
        GPIO19_EDGE_HIGH: u1,
        GPIO20_LEVEL_LOW: u1,
        GPIO20_LEVEL_HIGH: u1,
        GPIO20_EDGE_LOW: u1,
        GPIO20_EDGE_HIGH: u1,
        GPIO21_LEVEL_LOW: u1,
        GPIO21_LEVEL_HIGH: u1,
        GPIO21_EDGE_LOW: u1,
        GPIO21_EDGE_HIGH: u1,
        GPIO22_LEVEL_LOW: u1,
        GPIO22_LEVEL_HIGH: u1,
        GPIO22_EDGE_LOW: u1,
        GPIO22_EDGE_HIGH: u1,
        GPIO23_LEVEL_LOW: u1,
        GPIO23_LEVEL_HIGH: u1,
        GPIO23_EDGE_LOW: u1,
        GPIO23_EDGE_HIGH: u1,
    }),
    /// Interrupt Force for proc0
    /// offset: 0x11c
    PROC0_INTF3: mmio.Mmio(packed struct(u32) {
        GPIO24_LEVEL_LOW: u1,
        GPIO24_LEVEL_HIGH: u1,
        GPIO24_EDGE_LOW: u1,
        GPIO24_EDGE_HIGH: u1,
        GPIO25_LEVEL_LOW: u1,
        GPIO25_LEVEL_HIGH: u1,
        GPIO25_EDGE_LOW: u1,
        GPIO25_EDGE_HIGH: u1,
        GPIO26_LEVEL_LOW: u1,
        GPIO26_LEVEL_HIGH: u1,
        GPIO26_EDGE_LOW: u1,
        GPIO26_EDGE_HIGH: u1,
        GPIO27_LEVEL_LOW: u1,
        GPIO27_LEVEL_HIGH: u1,
        GPIO27_EDGE_LOW: u1,
        GPIO27_EDGE_HIGH: u1,
        GPIO28_LEVEL_LOW: u1,
        GPIO28_LEVEL_HIGH: u1,
        GPIO28_EDGE_LOW: u1,
        GPIO28_EDGE_HIGH: u1,
        GPIO29_LEVEL_LOW: u1,
        GPIO29_LEVEL_HIGH: u1,
        GPIO29_EDGE_LOW: u1,
        GPIO29_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt status after masking & forcing for proc0
    /// offset: 0x120
    PROC0_INTS0: mmio.Mmio(packed struct(u32) {
        GPIO0_LEVEL_LOW: u1,
        GPIO0_LEVEL_HIGH: u1,
        GPIO0_EDGE_LOW: u1,
        GPIO0_EDGE_HIGH: u1,
        GPIO1_LEVEL_LOW: u1,
        GPIO1_LEVEL_HIGH: u1,
        GPIO1_EDGE_LOW: u1,
        GPIO1_EDGE_HIGH: u1,
        GPIO2_LEVEL_LOW: u1,
        GPIO2_LEVEL_HIGH: u1,
        GPIO2_EDGE_LOW: u1,
        GPIO2_EDGE_HIGH: u1,
        GPIO3_LEVEL_LOW: u1,
        GPIO3_LEVEL_HIGH: u1,
        GPIO3_EDGE_LOW: u1,
        GPIO3_EDGE_HIGH: u1,
        GPIO4_LEVEL_LOW: u1,
        GPIO4_LEVEL_HIGH: u1,
        GPIO4_EDGE_LOW: u1,
        GPIO4_EDGE_HIGH: u1,
        GPIO5_LEVEL_LOW: u1,
        GPIO5_LEVEL_HIGH: u1,
        GPIO5_EDGE_LOW: u1,
        GPIO5_EDGE_HIGH: u1,
        GPIO6_LEVEL_LOW: u1,
        GPIO6_LEVEL_HIGH: u1,
        GPIO6_EDGE_LOW: u1,
        GPIO6_EDGE_HIGH: u1,
        GPIO7_LEVEL_LOW: u1,
        GPIO7_LEVEL_HIGH: u1,
        GPIO7_EDGE_LOW: u1,
        GPIO7_EDGE_HIGH: u1,
    }),
    /// Interrupt status after masking & forcing for proc0
    /// offset: 0x124
    PROC0_INTS1: mmio.Mmio(packed struct(u32) {
        GPIO8_LEVEL_LOW: u1,
        GPIO8_LEVEL_HIGH: u1,
        GPIO8_EDGE_LOW: u1,
        GPIO8_EDGE_HIGH: u1,
        GPIO9_LEVEL_LOW: u1,
        GPIO9_LEVEL_HIGH: u1,
        GPIO9_EDGE_LOW: u1,
        GPIO9_EDGE_HIGH: u1,
        GPIO10_LEVEL_LOW: u1,
        GPIO10_LEVEL_HIGH: u1,
        GPIO10_EDGE_LOW: u1,
        GPIO10_EDGE_HIGH: u1,
        GPIO11_LEVEL_LOW: u1,
        GPIO11_LEVEL_HIGH: u1,
        GPIO11_EDGE_LOW: u1,
        GPIO11_EDGE_HIGH: u1,
        GPIO12_LEVEL_LOW: u1,
        GPIO12_LEVEL_HIGH: u1,
        GPIO12_EDGE_LOW: u1,
        GPIO12_EDGE_HIGH: u1,
        GPIO13_LEVEL_LOW: u1,
        GPIO13_LEVEL_HIGH: u1,
        GPIO13_EDGE_LOW: u1,
        GPIO13_EDGE_HIGH: u1,
        GPIO14_LEVEL_LOW: u1,
        GPIO14_LEVEL_HIGH: u1,
        GPIO14_EDGE_LOW: u1,
        GPIO14_EDGE_HIGH: u1,
        GPIO15_LEVEL_LOW: u1,
        GPIO15_LEVEL_HIGH: u1,
        GPIO15_EDGE_LOW: u1,
        GPIO15_EDGE_HIGH: u1,
    }),
    /// Interrupt status after masking & forcing for proc0
    /// offset: 0x128
    PROC0_INTS2: mmio.Mmio(packed struct(u32) {
        GPIO16_LEVEL_LOW: u1,
        GPIO16_LEVEL_HIGH: u1,
        GPIO16_EDGE_LOW: u1,
        GPIO16_EDGE_HIGH: u1,
        GPIO17_LEVEL_LOW: u1,
        GPIO17_LEVEL_HIGH: u1,
        GPIO17_EDGE_LOW: u1,
        GPIO17_EDGE_HIGH: u1,
        GPIO18_LEVEL_LOW: u1,
        GPIO18_LEVEL_HIGH: u1,
        GPIO18_EDGE_LOW: u1,
        GPIO18_EDGE_HIGH: u1,
        GPIO19_LEVEL_LOW: u1,
        GPIO19_LEVEL_HIGH: u1,
        GPIO19_EDGE_LOW: u1,
        GPIO19_EDGE_HIGH: u1,
        GPIO20_LEVEL_LOW: u1,
        GPIO20_LEVEL_HIGH: u1,
        GPIO20_EDGE_LOW: u1,
        GPIO20_EDGE_HIGH: u1,
        GPIO21_LEVEL_LOW: u1,
        GPIO21_LEVEL_HIGH: u1,
        GPIO21_EDGE_LOW: u1,
        GPIO21_EDGE_HIGH: u1,
        GPIO22_LEVEL_LOW: u1,
        GPIO22_LEVEL_HIGH: u1,
        GPIO22_EDGE_LOW: u1,
        GPIO22_EDGE_HIGH: u1,
        GPIO23_LEVEL_LOW: u1,
        GPIO23_LEVEL_HIGH: u1,
        GPIO23_EDGE_LOW: u1,
        GPIO23_EDGE_HIGH: u1,
    }),
    /// Interrupt status after masking & forcing for proc0
    /// offset: 0x12c
    PROC0_INTS3: mmio.Mmio(packed struct(u32) {
        GPIO24_LEVEL_LOW: u1,
        GPIO24_LEVEL_HIGH: u1,
        GPIO24_EDGE_LOW: u1,
        GPIO24_EDGE_HIGH: u1,
        GPIO25_LEVEL_LOW: u1,
        GPIO25_LEVEL_HIGH: u1,
        GPIO25_EDGE_LOW: u1,
        GPIO25_EDGE_HIGH: u1,
        GPIO26_LEVEL_LOW: u1,
        GPIO26_LEVEL_HIGH: u1,
        GPIO26_EDGE_LOW: u1,
        GPIO26_EDGE_HIGH: u1,
        GPIO27_LEVEL_LOW: u1,
        GPIO27_LEVEL_HIGH: u1,
        GPIO27_EDGE_LOW: u1,
        GPIO27_EDGE_HIGH: u1,
        GPIO28_LEVEL_LOW: u1,
        GPIO28_LEVEL_HIGH: u1,
        GPIO28_EDGE_LOW: u1,
        GPIO28_EDGE_HIGH: u1,
        GPIO29_LEVEL_LOW: u1,
        GPIO29_LEVEL_HIGH: u1,
        GPIO29_EDGE_LOW: u1,
        GPIO29_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Enable for proc1
    /// offset: 0x130
    PROC1_INTE0: mmio.Mmio(packed struct(u32) {
        GPIO0_LEVEL_LOW: u1,
        GPIO0_LEVEL_HIGH: u1,
        GPIO0_EDGE_LOW: u1,
        GPIO0_EDGE_HIGH: u1,
        GPIO1_LEVEL_LOW: u1,
        GPIO1_LEVEL_HIGH: u1,
        GPIO1_EDGE_LOW: u1,
        GPIO1_EDGE_HIGH: u1,
        GPIO2_LEVEL_LOW: u1,
        GPIO2_LEVEL_HIGH: u1,
        GPIO2_EDGE_LOW: u1,
        GPIO2_EDGE_HIGH: u1,
        GPIO3_LEVEL_LOW: u1,
        GPIO3_LEVEL_HIGH: u1,
        GPIO3_EDGE_LOW: u1,
        GPIO3_EDGE_HIGH: u1,
        GPIO4_LEVEL_LOW: u1,
        GPIO4_LEVEL_HIGH: u1,
        GPIO4_EDGE_LOW: u1,
        GPIO4_EDGE_HIGH: u1,
        GPIO5_LEVEL_LOW: u1,
        GPIO5_LEVEL_HIGH: u1,
        GPIO5_EDGE_LOW: u1,
        GPIO5_EDGE_HIGH: u1,
        GPIO6_LEVEL_LOW: u1,
        GPIO6_LEVEL_HIGH: u1,
        GPIO6_EDGE_LOW: u1,
        GPIO6_EDGE_HIGH: u1,
        GPIO7_LEVEL_LOW: u1,
        GPIO7_LEVEL_HIGH: u1,
        GPIO7_EDGE_LOW: u1,
        GPIO7_EDGE_HIGH: u1,
    }),
    /// Interrupt Enable for proc1
    /// offset: 0x134
    PROC1_INTE1: mmio.Mmio(packed struct(u32) {
        GPIO8_LEVEL_LOW: u1,
        GPIO8_LEVEL_HIGH: u1,
        GPIO8_EDGE_LOW: u1,
        GPIO8_EDGE_HIGH: u1,
        GPIO9_LEVEL_LOW: u1,
        GPIO9_LEVEL_HIGH: u1,
        GPIO9_EDGE_LOW: u1,
        GPIO9_EDGE_HIGH: u1,
        GPIO10_LEVEL_LOW: u1,
        GPIO10_LEVEL_HIGH: u1,
        GPIO10_EDGE_LOW: u1,
        GPIO10_EDGE_HIGH: u1,
        GPIO11_LEVEL_LOW: u1,
        GPIO11_LEVEL_HIGH: u1,
        GPIO11_EDGE_LOW: u1,
        GPIO11_EDGE_HIGH: u1,
        GPIO12_LEVEL_LOW: u1,
        GPIO12_LEVEL_HIGH: u1,
        GPIO12_EDGE_LOW: u1,
        GPIO12_EDGE_HIGH: u1,
        GPIO13_LEVEL_LOW: u1,
        GPIO13_LEVEL_HIGH: u1,
        GPIO13_EDGE_LOW: u1,
        GPIO13_EDGE_HIGH: u1,
        GPIO14_LEVEL_LOW: u1,
        GPIO14_LEVEL_HIGH: u1,
        GPIO14_EDGE_LOW: u1,
        GPIO14_EDGE_HIGH: u1,
        GPIO15_LEVEL_LOW: u1,
        GPIO15_LEVEL_HIGH: u1,
        GPIO15_EDGE_LOW: u1,
        GPIO15_EDGE_HIGH: u1,
    }),
    /// Interrupt Enable for proc1
    /// offset: 0x138
    PROC1_INTE2: mmio.Mmio(packed struct(u32) {
        GPIO16_LEVEL_LOW: u1,
        GPIO16_LEVEL_HIGH: u1,
        GPIO16_EDGE_LOW: u1,
        GPIO16_EDGE_HIGH: u1,
        GPIO17_LEVEL_LOW: u1,
        GPIO17_LEVEL_HIGH: u1,
        GPIO17_EDGE_LOW: u1,
        GPIO17_EDGE_HIGH: u1,
        GPIO18_LEVEL_LOW: u1,
        GPIO18_LEVEL_HIGH: u1,
        GPIO18_EDGE_LOW: u1,
        GPIO18_EDGE_HIGH: u1,
        GPIO19_LEVEL_LOW: u1,
        GPIO19_LEVEL_HIGH: u1,
        GPIO19_EDGE_LOW: u1,
        GPIO19_EDGE_HIGH: u1,
        GPIO20_LEVEL_LOW: u1,
        GPIO20_LEVEL_HIGH: u1,
        GPIO20_EDGE_LOW: u1,
        GPIO20_EDGE_HIGH: u1,
        GPIO21_LEVEL_LOW: u1,
        GPIO21_LEVEL_HIGH: u1,
        GPIO21_EDGE_LOW: u1,
        GPIO21_EDGE_HIGH: u1,
        GPIO22_LEVEL_LOW: u1,
        GPIO22_LEVEL_HIGH: u1,
        GPIO22_EDGE_LOW: u1,
        GPIO22_EDGE_HIGH: u1,
        GPIO23_LEVEL_LOW: u1,
        GPIO23_LEVEL_HIGH: u1,
        GPIO23_EDGE_LOW: u1,
        GPIO23_EDGE_HIGH: u1,
    }),
    /// Interrupt Enable for proc1
    /// offset: 0x13c
    PROC1_INTE3: mmio.Mmio(packed struct(u32) {
        GPIO24_LEVEL_LOW: u1,
        GPIO24_LEVEL_HIGH: u1,
        GPIO24_EDGE_LOW: u1,
        GPIO24_EDGE_HIGH: u1,
        GPIO25_LEVEL_LOW: u1,
        GPIO25_LEVEL_HIGH: u1,
        GPIO25_EDGE_LOW: u1,
        GPIO25_EDGE_HIGH: u1,
        GPIO26_LEVEL_LOW: u1,
        GPIO26_LEVEL_HIGH: u1,
        GPIO26_EDGE_LOW: u1,
        GPIO26_EDGE_HIGH: u1,
        GPIO27_LEVEL_LOW: u1,
        GPIO27_LEVEL_HIGH: u1,
        GPIO27_EDGE_LOW: u1,
        GPIO27_EDGE_HIGH: u1,
        GPIO28_LEVEL_LOW: u1,
        GPIO28_LEVEL_HIGH: u1,
        GPIO28_EDGE_LOW: u1,
        GPIO28_EDGE_HIGH: u1,
        GPIO29_LEVEL_LOW: u1,
        GPIO29_LEVEL_HIGH: u1,
        GPIO29_EDGE_LOW: u1,
        GPIO29_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Force for proc1
    /// offset: 0x140
    PROC1_INTF0: mmio.Mmio(packed struct(u32) {
        GPIO0_LEVEL_LOW: u1,
        GPIO0_LEVEL_HIGH: u1,
        GPIO0_EDGE_LOW: u1,
        GPIO0_EDGE_HIGH: u1,
        GPIO1_LEVEL_LOW: u1,
        GPIO1_LEVEL_HIGH: u1,
        GPIO1_EDGE_LOW: u1,
        GPIO1_EDGE_HIGH: u1,
        GPIO2_LEVEL_LOW: u1,
        GPIO2_LEVEL_HIGH: u1,
        GPIO2_EDGE_LOW: u1,
        GPIO2_EDGE_HIGH: u1,
        GPIO3_LEVEL_LOW: u1,
        GPIO3_LEVEL_HIGH: u1,
        GPIO3_EDGE_LOW: u1,
        GPIO3_EDGE_HIGH: u1,
        GPIO4_LEVEL_LOW: u1,
        GPIO4_LEVEL_HIGH: u1,
        GPIO4_EDGE_LOW: u1,
        GPIO4_EDGE_HIGH: u1,
        GPIO5_LEVEL_LOW: u1,
        GPIO5_LEVEL_HIGH: u1,
        GPIO5_EDGE_LOW: u1,
        GPIO5_EDGE_HIGH: u1,
        GPIO6_LEVEL_LOW: u1,
        GPIO6_LEVEL_HIGH: u1,
        GPIO6_EDGE_LOW: u1,
        GPIO6_EDGE_HIGH: u1,
        GPIO7_LEVEL_LOW: u1,
        GPIO7_LEVEL_HIGH: u1,
        GPIO7_EDGE_LOW: u1,
        GPIO7_EDGE_HIGH: u1,
    }),
    /// Interrupt Force for proc1
    /// offset: 0x144
    PROC1_INTF1: mmio.Mmio(packed struct(u32) {
        GPIO8_LEVEL_LOW: u1,
        GPIO8_LEVEL_HIGH: u1,
        GPIO8_EDGE_LOW: u1,
        GPIO8_EDGE_HIGH: u1,
        GPIO9_LEVEL_LOW: u1,
        GPIO9_LEVEL_HIGH: u1,
        GPIO9_EDGE_LOW: u1,
        GPIO9_EDGE_HIGH: u1,
        GPIO10_LEVEL_LOW: u1,
        GPIO10_LEVEL_HIGH: u1,
        GPIO10_EDGE_LOW: u1,
        GPIO10_EDGE_HIGH: u1,
        GPIO11_LEVEL_LOW: u1,
        GPIO11_LEVEL_HIGH: u1,
        GPIO11_EDGE_LOW: u1,
        GPIO11_EDGE_HIGH: u1,
        GPIO12_LEVEL_LOW: u1,
        GPIO12_LEVEL_HIGH: u1,
        GPIO12_EDGE_LOW: u1,
        GPIO12_EDGE_HIGH: u1,
        GPIO13_LEVEL_LOW: u1,
        GPIO13_LEVEL_HIGH: u1,
        GPIO13_EDGE_LOW: u1,
        GPIO13_EDGE_HIGH: u1,
        GPIO14_LEVEL_LOW: u1,
        GPIO14_LEVEL_HIGH: u1,
        GPIO14_EDGE_LOW: u1,
        GPIO14_EDGE_HIGH: u1,
        GPIO15_LEVEL_LOW: u1,
        GPIO15_LEVEL_HIGH: u1,
        GPIO15_EDGE_LOW: u1,
        GPIO15_EDGE_HIGH: u1,
    }),
    /// Interrupt Force for proc1
    /// offset: 0x148
    PROC1_INTF2: mmio.Mmio(packed struct(u32) {
        GPIO16_LEVEL_LOW: u1,
        GPIO16_LEVEL_HIGH: u1,
        GPIO16_EDGE_LOW: u1,
        GPIO16_EDGE_HIGH: u1,
        GPIO17_LEVEL_LOW: u1,
        GPIO17_LEVEL_HIGH: u1,
        GPIO17_EDGE_LOW: u1,
        GPIO17_EDGE_HIGH: u1,
        GPIO18_LEVEL_LOW: u1,
        GPIO18_LEVEL_HIGH: u1,
        GPIO18_EDGE_LOW: u1,
        GPIO18_EDGE_HIGH: u1,
        GPIO19_LEVEL_LOW: u1,
        GPIO19_LEVEL_HIGH: u1,
        GPIO19_EDGE_LOW: u1,
        GPIO19_EDGE_HIGH: u1,
        GPIO20_LEVEL_LOW: u1,
        GPIO20_LEVEL_HIGH: u1,
        GPIO20_EDGE_LOW: u1,
        GPIO20_EDGE_HIGH: u1,
        GPIO21_LEVEL_LOW: u1,
        GPIO21_LEVEL_HIGH: u1,
        GPIO21_EDGE_LOW: u1,
        GPIO21_EDGE_HIGH: u1,
        GPIO22_LEVEL_LOW: u1,
        GPIO22_LEVEL_HIGH: u1,
        GPIO22_EDGE_LOW: u1,
        GPIO22_EDGE_HIGH: u1,
        GPIO23_LEVEL_LOW: u1,
        GPIO23_LEVEL_HIGH: u1,
        GPIO23_EDGE_LOW: u1,
        GPIO23_EDGE_HIGH: u1,
    }),
    /// Interrupt Force for proc1
    /// offset: 0x14c
    PROC1_INTF3: mmio.Mmio(packed struct(u32) {
        GPIO24_LEVEL_LOW: u1,
        GPIO24_LEVEL_HIGH: u1,
        GPIO24_EDGE_LOW: u1,
        GPIO24_EDGE_HIGH: u1,
        GPIO25_LEVEL_LOW: u1,
        GPIO25_LEVEL_HIGH: u1,
        GPIO25_EDGE_LOW: u1,
        GPIO25_EDGE_HIGH: u1,
        GPIO26_LEVEL_LOW: u1,
        GPIO26_LEVEL_HIGH: u1,
        GPIO26_EDGE_LOW: u1,
        GPIO26_EDGE_HIGH: u1,
        GPIO27_LEVEL_LOW: u1,
        GPIO27_LEVEL_HIGH: u1,
        GPIO27_EDGE_LOW: u1,
        GPIO27_EDGE_HIGH: u1,
        GPIO28_LEVEL_LOW: u1,
        GPIO28_LEVEL_HIGH: u1,
        GPIO28_EDGE_LOW: u1,
        GPIO28_EDGE_HIGH: u1,
        GPIO29_LEVEL_LOW: u1,
        GPIO29_LEVEL_HIGH: u1,
        GPIO29_EDGE_LOW: u1,
        GPIO29_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt status after masking & forcing for proc1
    /// offset: 0x150
    PROC1_INTS0: mmio.Mmio(packed struct(u32) {
        GPIO0_LEVEL_LOW: u1,
        GPIO0_LEVEL_HIGH: u1,
        GPIO0_EDGE_LOW: u1,
        GPIO0_EDGE_HIGH: u1,
        GPIO1_LEVEL_LOW: u1,
        GPIO1_LEVEL_HIGH: u1,
        GPIO1_EDGE_LOW: u1,
        GPIO1_EDGE_HIGH: u1,
        GPIO2_LEVEL_LOW: u1,
        GPIO2_LEVEL_HIGH: u1,
        GPIO2_EDGE_LOW: u1,
        GPIO2_EDGE_HIGH: u1,
        GPIO3_LEVEL_LOW: u1,
        GPIO3_LEVEL_HIGH: u1,
        GPIO3_EDGE_LOW: u1,
        GPIO3_EDGE_HIGH: u1,
        GPIO4_LEVEL_LOW: u1,
        GPIO4_LEVEL_HIGH: u1,
        GPIO4_EDGE_LOW: u1,
        GPIO4_EDGE_HIGH: u1,
        GPIO5_LEVEL_LOW: u1,
        GPIO5_LEVEL_HIGH: u1,
        GPIO5_EDGE_LOW: u1,
        GPIO5_EDGE_HIGH: u1,
        GPIO6_LEVEL_LOW: u1,
        GPIO6_LEVEL_HIGH: u1,
        GPIO6_EDGE_LOW: u1,
        GPIO6_EDGE_HIGH: u1,
        GPIO7_LEVEL_LOW: u1,
        GPIO7_LEVEL_HIGH: u1,
        GPIO7_EDGE_LOW: u1,
        GPIO7_EDGE_HIGH: u1,
    }),
    /// Interrupt status after masking & forcing for proc1
    /// offset: 0x154
    PROC1_INTS1: mmio.Mmio(packed struct(u32) {
        GPIO8_LEVEL_LOW: u1,
        GPIO8_LEVEL_HIGH: u1,
        GPIO8_EDGE_LOW: u1,
        GPIO8_EDGE_HIGH: u1,
        GPIO9_LEVEL_LOW: u1,
        GPIO9_LEVEL_HIGH: u1,
        GPIO9_EDGE_LOW: u1,
        GPIO9_EDGE_HIGH: u1,
        GPIO10_LEVEL_LOW: u1,
        GPIO10_LEVEL_HIGH: u1,
        GPIO10_EDGE_LOW: u1,
        GPIO10_EDGE_HIGH: u1,
        GPIO11_LEVEL_LOW: u1,
        GPIO11_LEVEL_HIGH: u1,
        GPIO11_EDGE_LOW: u1,
        GPIO11_EDGE_HIGH: u1,
        GPIO12_LEVEL_LOW: u1,
        GPIO12_LEVEL_HIGH: u1,
        GPIO12_EDGE_LOW: u1,
        GPIO12_EDGE_HIGH: u1,
        GPIO13_LEVEL_LOW: u1,
        GPIO13_LEVEL_HIGH: u1,
        GPIO13_EDGE_LOW: u1,
        GPIO13_EDGE_HIGH: u1,
        GPIO14_LEVEL_LOW: u1,
        GPIO14_LEVEL_HIGH: u1,
        GPIO14_EDGE_LOW: u1,
        GPIO14_EDGE_HIGH: u1,
        GPIO15_LEVEL_LOW: u1,
        GPIO15_LEVEL_HIGH: u1,
        GPIO15_EDGE_LOW: u1,
        GPIO15_EDGE_HIGH: u1,
    }),
    /// Interrupt status after masking & forcing for proc1
    /// offset: 0x158
    PROC1_INTS2: mmio.Mmio(packed struct(u32) {
        GPIO16_LEVEL_LOW: u1,
        GPIO16_LEVEL_HIGH: u1,
        GPIO16_EDGE_LOW: u1,
        GPIO16_EDGE_HIGH: u1,
        GPIO17_LEVEL_LOW: u1,
        GPIO17_LEVEL_HIGH: u1,
        GPIO17_EDGE_LOW: u1,
        GPIO17_EDGE_HIGH: u1,
        GPIO18_LEVEL_LOW: u1,
        GPIO18_LEVEL_HIGH: u1,
        GPIO18_EDGE_LOW: u1,
        GPIO18_EDGE_HIGH: u1,
        GPIO19_LEVEL_LOW: u1,
        GPIO19_LEVEL_HIGH: u1,
        GPIO19_EDGE_LOW: u1,
        GPIO19_EDGE_HIGH: u1,
        GPIO20_LEVEL_LOW: u1,
        GPIO20_LEVEL_HIGH: u1,
        GPIO20_EDGE_LOW: u1,
        GPIO20_EDGE_HIGH: u1,
        GPIO21_LEVEL_LOW: u1,
        GPIO21_LEVEL_HIGH: u1,
        GPIO21_EDGE_LOW: u1,
        GPIO21_EDGE_HIGH: u1,
        GPIO22_LEVEL_LOW: u1,
        GPIO22_LEVEL_HIGH: u1,
        GPIO22_EDGE_LOW: u1,
        GPIO22_EDGE_HIGH: u1,
        GPIO23_LEVEL_LOW: u1,
        GPIO23_LEVEL_HIGH: u1,
        GPIO23_EDGE_LOW: u1,
        GPIO23_EDGE_HIGH: u1,
    }),
    /// Interrupt status after masking & forcing for proc1
    /// offset: 0x15c
    PROC1_INTS3: mmio.Mmio(packed struct(u32) {
        GPIO24_LEVEL_LOW: u1,
        GPIO24_LEVEL_HIGH: u1,
        GPIO24_EDGE_LOW: u1,
        GPIO24_EDGE_HIGH: u1,
        GPIO25_LEVEL_LOW: u1,
        GPIO25_LEVEL_HIGH: u1,
        GPIO25_EDGE_LOW: u1,
        GPIO25_EDGE_HIGH: u1,
        GPIO26_LEVEL_LOW: u1,
        GPIO26_LEVEL_HIGH: u1,
        GPIO26_EDGE_LOW: u1,
        GPIO26_EDGE_HIGH: u1,
        GPIO27_LEVEL_LOW: u1,
        GPIO27_LEVEL_HIGH: u1,
        GPIO27_EDGE_LOW: u1,
        GPIO27_EDGE_HIGH: u1,
        GPIO28_LEVEL_LOW: u1,
        GPIO28_LEVEL_HIGH: u1,
        GPIO28_EDGE_LOW: u1,
        GPIO28_EDGE_HIGH: u1,
        GPIO29_LEVEL_LOW: u1,
        GPIO29_LEVEL_HIGH: u1,
        GPIO29_EDGE_LOW: u1,
        GPIO29_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Enable for dormant_wake
    /// offset: 0x160
    DORMANT_WAKE_INTE0: mmio.Mmio(packed struct(u32) {
        GPIO0_LEVEL_LOW: u1,
        GPIO0_LEVEL_HIGH: u1,
        GPIO0_EDGE_LOW: u1,
        GPIO0_EDGE_HIGH: u1,
        GPIO1_LEVEL_LOW: u1,
        GPIO1_LEVEL_HIGH: u1,
        GPIO1_EDGE_LOW: u1,
        GPIO1_EDGE_HIGH: u1,
        GPIO2_LEVEL_LOW: u1,
        GPIO2_LEVEL_HIGH: u1,
        GPIO2_EDGE_LOW: u1,
        GPIO2_EDGE_HIGH: u1,
        GPIO3_LEVEL_LOW: u1,
        GPIO3_LEVEL_HIGH: u1,
        GPIO3_EDGE_LOW: u1,
        GPIO3_EDGE_HIGH: u1,
        GPIO4_LEVEL_LOW: u1,
        GPIO4_LEVEL_HIGH: u1,
        GPIO4_EDGE_LOW: u1,
        GPIO4_EDGE_HIGH: u1,
        GPIO5_LEVEL_LOW: u1,
        GPIO5_LEVEL_HIGH: u1,
        GPIO5_EDGE_LOW: u1,
        GPIO5_EDGE_HIGH: u1,
        GPIO6_LEVEL_LOW: u1,
        GPIO6_LEVEL_HIGH: u1,
        GPIO6_EDGE_LOW: u1,
        GPIO6_EDGE_HIGH: u1,
        GPIO7_LEVEL_LOW: u1,
        GPIO7_LEVEL_HIGH: u1,
        GPIO7_EDGE_LOW: u1,
        GPIO7_EDGE_HIGH: u1,
    }),
    /// Interrupt Enable for dormant_wake
    /// offset: 0x164
    DORMANT_WAKE_INTE1: mmio.Mmio(packed struct(u32) {
        GPIO8_LEVEL_LOW: u1,
        GPIO8_LEVEL_HIGH: u1,
        GPIO8_EDGE_LOW: u1,
        GPIO8_EDGE_HIGH: u1,
        GPIO9_LEVEL_LOW: u1,
        GPIO9_LEVEL_HIGH: u1,
        GPIO9_EDGE_LOW: u1,
        GPIO9_EDGE_HIGH: u1,
        GPIO10_LEVEL_LOW: u1,
        GPIO10_LEVEL_HIGH: u1,
        GPIO10_EDGE_LOW: u1,
        GPIO10_EDGE_HIGH: u1,
        GPIO11_LEVEL_LOW: u1,
        GPIO11_LEVEL_HIGH: u1,
        GPIO11_EDGE_LOW: u1,
        GPIO11_EDGE_HIGH: u1,
        GPIO12_LEVEL_LOW: u1,
        GPIO12_LEVEL_HIGH: u1,
        GPIO12_EDGE_LOW: u1,
        GPIO12_EDGE_HIGH: u1,
        GPIO13_LEVEL_LOW: u1,
        GPIO13_LEVEL_HIGH: u1,
        GPIO13_EDGE_LOW: u1,
        GPIO13_EDGE_HIGH: u1,
        GPIO14_LEVEL_LOW: u1,
        GPIO14_LEVEL_HIGH: u1,
        GPIO14_EDGE_LOW: u1,
        GPIO14_EDGE_HIGH: u1,
        GPIO15_LEVEL_LOW: u1,
        GPIO15_LEVEL_HIGH: u1,
        GPIO15_EDGE_LOW: u1,
        GPIO15_EDGE_HIGH: u1,
    }),
    /// Interrupt Enable for dormant_wake
    /// offset: 0x168
    DORMANT_WAKE_INTE2: mmio.Mmio(packed struct(u32) {
        GPIO16_LEVEL_LOW: u1,
        GPIO16_LEVEL_HIGH: u1,
        GPIO16_EDGE_LOW: u1,
        GPIO16_EDGE_HIGH: u1,
        GPIO17_LEVEL_LOW: u1,
        GPIO17_LEVEL_HIGH: u1,
        GPIO17_EDGE_LOW: u1,
        GPIO17_EDGE_HIGH: u1,
        GPIO18_LEVEL_LOW: u1,
        GPIO18_LEVEL_HIGH: u1,
        GPIO18_EDGE_LOW: u1,
        GPIO18_EDGE_HIGH: u1,
        GPIO19_LEVEL_LOW: u1,
        GPIO19_LEVEL_HIGH: u1,
        GPIO19_EDGE_LOW: u1,
        GPIO19_EDGE_HIGH: u1,
        GPIO20_LEVEL_LOW: u1,
        GPIO20_LEVEL_HIGH: u1,
        GPIO20_EDGE_LOW: u1,
        GPIO20_EDGE_HIGH: u1,
        GPIO21_LEVEL_LOW: u1,
        GPIO21_LEVEL_HIGH: u1,
        GPIO21_EDGE_LOW: u1,
        GPIO21_EDGE_HIGH: u1,
        GPIO22_LEVEL_LOW: u1,
        GPIO22_LEVEL_HIGH: u1,
        GPIO22_EDGE_LOW: u1,
        GPIO22_EDGE_HIGH: u1,
        GPIO23_LEVEL_LOW: u1,
        GPIO23_LEVEL_HIGH: u1,
        GPIO23_EDGE_LOW: u1,
        GPIO23_EDGE_HIGH: u1,
    }),
    /// Interrupt Enable for dormant_wake
    /// offset: 0x16c
    DORMANT_WAKE_INTE3: mmio.Mmio(packed struct(u32) {
        GPIO24_LEVEL_LOW: u1,
        GPIO24_LEVEL_HIGH: u1,
        GPIO24_EDGE_LOW: u1,
        GPIO24_EDGE_HIGH: u1,
        GPIO25_LEVEL_LOW: u1,
        GPIO25_LEVEL_HIGH: u1,
        GPIO25_EDGE_LOW: u1,
        GPIO25_EDGE_HIGH: u1,
        GPIO26_LEVEL_LOW: u1,
        GPIO26_LEVEL_HIGH: u1,
        GPIO26_EDGE_LOW: u1,
        GPIO26_EDGE_HIGH: u1,
        GPIO27_LEVEL_LOW: u1,
        GPIO27_LEVEL_HIGH: u1,
        GPIO27_EDGE_LOW: u1,
        GPIO27_EDGE_HIGH: u1,
        GPIO28_LEVEL_LOW: u1,
        GPIO28_LEVEL_HIGH: u1,
        GPIO28_EDGE_LOW: u1,
        GPIO28_EDGE_HIGH: u1,
        GPIO29_LEVEL_LOW: u1,
        GPIO29_LEVEL_HIGH: u1,
        GPIO29_EDGE_LOW: u1,
        GPIO29_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Force for dormant_wake
    /// offset: 0x170
    DORMANT_WAKE_INTF0: mmio.Mmio(packed struct(u32) {
        GPIO0_LEVEL_LOW: u1,
        GPIO0_LEVEL_HIGH: u1,
        GPIO0_EDGE_LOW: u1,
        GPIO0_EDGE_HIGH: u1,
        GPIO1_LEVEL_LOW: u1,
        GPIO1_LEVEL_HIGH: u1,
        GPIO1_EDGE_LOW: u1,
        GPIO1_EDGE_HIGH: u1,
        GPIO2_LEVEL_LOW: u1,
        GPIO2_LEVEL_HIGH: u1,
        GPIO2_EDGE_LOW: u1,
        GPIO2_EDGE_HIGH: u1,
        GPIO3_LEVEL_LOW: u1,
        GPIO3_LEVEL_HIGH: u1,
        GPIO3_EDGE_LOW: u1,
        GPIO3_EDGE_HIGH: u1,
        GPIO4_LEVEL_LOW: u1,
        GPIO4_LEVEL_HIGH: u1,
        GPIO4_EDGE_LOW: u1,
        GPIO4_EDGE_HIGH: u1,
        GPIO5_LEVEL_LOW: u1,
        GPIO5_LEVEL_HIGH: u1,
        GPIO5_EDGE_LOW: u1,
        GPIO5_EDGE_HIGH: u1,
        GPIO6_LEVEL_LOW: u1,
        GPIO6_LEVEL_HIGH: u1,
        GPIO6_EDGE_LOW: u1,
        GPIO6_EDGE_HIGH: u1,
        GPIO7_LEVEL_LOW: u1,
        GPIO7_LEVEL_HIGH: u1,
        GPIO7_EDGE_LOW: u1,
        GPIO7_EDGE_HIGH: u1,
    }),
    /// Interrupt Force for dormant_wake
    /// offset: 0x174
    DORMANT_WAKE_INTF1: mmio.Mmio(packed struct(u32) {
        GPIO8_LEVEL_LOW: u1,
        GPIO8_LEVEL_HIGH: u1,
        GPIO8_EDGE_LOW: u1,
        GPIO8_EDGE_HIGH: u1,
        GPIO9_LEVEL_LOW: u1,
        GPIO9_LEVEL_HIGH: u1,
        GPIO9_EDGE_LOW: u1,
        GPIO9_EDGE_HIGH: u1,
        GPIO10_LEVEL_LOW: u1,
        GPIO10_LEVEL_HIGH: u1,
        GPIO10_EDGE_LOW: u1,
        GPIO10_EDGE_HIGH: u1,
        GPIO11_LEVEL_LOW: u1,
        GPIO11_LEVEL_HIGH: u1,
        GPIO11_EDGE_LOW: u1,
        GPIO11_EDGE_HIGH: u1,
        GPIO12_LEVEL_LOW: u1,
        GPIO12_LEVEL_HIGH: u1,
        GPIO12_EDGE_LOW: u1,
        GPIO12_EDGE_HIGH: u1,
        GPIO13_LEVEL_LOW: u1,
        GPIO13_LEVEL_HIGH: u1,
        GPIO13_EDGE_LOW: u1,
        GPIO13_EDGE_HIGH: u1,
        GPIO14_LEVEL_LOW: u1,
        GPIO14_LEVEL_HIGH: u1,
        GPIO14_EDGE_LOW: u1,
        GPIO14_EDGE_HIGH: u1,
        GPIO15_LEVEL_LOW: u1,
        GPIO15_LEVEL_HIGH: u1,
        GPIO15_EDGE_LOW: u1,
        GPIO15_EDGE_HIGH: u1,
    }),
    /// Interrupt Force for dormant_wake
    /// offset: 0x178
    DORMANT_WAKE_INTF2: mmio.Mmio(packed struct(u32) {
        GPIO16_LEVEL_LOW: u1,
        GPIO16_LEVEL_HIGH: u1,
        GPIO16_EDGE_LOW: u1,
        GPIO16_EDGE_HIGH: u1,
        GPIO17_LEVEL_LOW: u1,
        GPIO17_LEVEL_HIGH: u1,
        GPIO17_EDGE_LOW: u1,
        GPIO17_EDGE_HIGH: u1,
        GPIO18_LEVEL_LOW: u1,
        GPIO18_LEVEL_HIGH: u1,
        GPIO18_EDGE_LOW: u1,
        GPIO18_EDGE_HIGH: u1,
        GPIO19_LEVEL_LOW: u1,
        GPIO19_LEVEL_HIGH: u1,
        GPIO19_EDGE_LOW: u1,
        GPIO19_EDGE_HIGH: u1,
        GPIO20_LEVEL_LOW: u1,
        GPIO20_LEVEL_HIGH: u1,
        GPIO20_EDGE_LOW: u1,
        GPIO20_EDGE_HIGH: u1,
        GPIO21_LEVEL_LOW: u1,
        GPIO21_LEVEL_HIGH: u1,
        GPIO21_EDGE_LOW: u1,
        GPIO21_EDGE_HIGH: u1,
        GPIO22_LEVEL_LOW: u1,
        GPIO22_LEVEL_HIGH: u1,
        GPIO22_EDGE_LOW: u1,
        GPIO22_EDGE_HIGH: u1,
        GPIO23_LEVEL_LOW: u1,
        GPIO23_LEVEL_HIGH: u1,
        GPIO23_EDGE_LOW: u1,
        GPIO23_EDGE_HIGH: u1,
    }),
    /// Interrupt Force for dormant_wake
    /// offset: 0x17c
    DORMANT_WAKE_INTF3: mmio.Mmio(packed struct(u32) {
        GPIO24_LEVEL_LOW: u1,
        GPIO24_LEVEL_HIGH: u1,
        GPIO24_EDGE_LOW: u1,
        GPIO24_EDGE_HIGH: u1,
        GPIO25_LEVEL_LOW: u1,
        GPIO25_LEVEL_HIGH: u1,
        GPIO25_EDGE_LOW: u1,
        GPIO25_EDGE_HIGH: u1,
        GPIO26_LEVEL_LOW: u1,
        GPIO26_LEVEL_HIGH: u1,
        GPIO26_EDGE_LOW: u1,
        GPIO26_EDGE_HIGH: u1,
        GPIO27_LEVEL_LOW: u1,
        GPIO27_LEVEL_HIGH: u1,
        GPIO27_EDGE_LOW: u1,
        GPIO27_EDGE_HIGH: u1,
        GPIO28_LEVEL_LOW: u1,
        GPIO28_LEVEL_HIGH: u1,
        GPIO28_EDGE_LOW: u1,
        GPIO28_EDGE_HIGH: u1,
        GPIO29_LEVEL_LOW: u1,
        GPIO29_LEVEL_HIGH: u1,
        GPIO29_EDGE_LOW: u1,
        GPIO29_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt status after masking & forcing for dormant_wake
    /// offset: 0x180
    DORMANT_WAKE_INTS0: mmio.Mmio(packed struct(u32) {
        GPIO0_LEVEL_LOW: u1,
        GPIO0_LEVEL_HIGH: u1,
        GPIO0_EDGE_LOW: u1,
        GPIO0_EDGE_HIGH: u1,
        GPIO1_LEVEL_LOW: u1,
        GPIO1_LEVEL_HIGH: u1,
        GPIO1_EDGE_LOW: u1,
        GPIO1_EDGE_HIGH: u1,
        GPIO2_LEVEL_LOW: u1,
        GPIO2_LEVEL_HIGH: u1,
        GPIO2_EDGE_LOW: u1,
        GPIO2_EDGE_HIGH: u1,
        GPIO3_LEVEL_LOW: u1,
        GPIO3_LEVEL_HIGH: u1,
        GPIO3_EDGE_LOW: u1,
        GPIO3_EDGE_HIGH: u1,
        GPIO4_LEVEL_LOW: u1,
        GPIO4_LEVEL_HIGH: u1,
        GPIO4_EDGE_LOW: u1,
        GPIO4_EDGE_HIGH: u1,
        GPIO5_LEVEL_LOW: u1,
        GPIO5_LEVEL_HIGH: u1,
        GPIO5_EDGE_LOW: u1,
        GPIO5_EDGE_HIGH: u1,
        GPIO6_LEVEL_LOW: u1,
        GPIO6_LEVEL_HIGH: u1,
        GPIO6_EDGE_LOW: u1,
        GPIO6_EDGE_HIGH: u1,
        GPIO7_LEVEL_LOW: u1,
        GPIO7_LEVEL_HIGH: u1,
        GPIO7_EDGE_LOW: u1,
        GPIO7_EDGE_HIGH: u1,
    }),
    /// Interrupt status after masking & forcing for dormant_wake
    /// offset: 0x184
    DORMANT_WAKE_INTS1: mmio.Mmio(packed struct(u32) {
        GPIO8_LEVEL_LOW: u1,
        GPIO8_LEVEL_HIGH: u1,
        GPIO8_EDGE_LOW: u1,
        GPIO8_EDGE_HIGH: u1,
        GPIO9_LEVEL_LOW: u1,
        GPIO9_LEVEL_HIGH: u1,
        GPIO9_EDGE_LOW: u1,
        GPIO9_EDGE_HIGH: u1,
        GPIO10_LEVEL_LOW: u1,
        GPIO10_LEVEL_HIGH: u1,
        GPIO10_EDGE_LOW: u1,
        GPIO10_EDGE_HIGH: u1,
        GPIO11_LEVEL_LOW: u1,
        GPIO11_LEVEL_HIGH: u1,
        GPIO11_EDGE_LOW: u1,
        GPIO11_EDGE_HIGH: u1,
        GPIO12_LEVEL_LOW: u1,
        GPIO12_LEVEL_HIGH: u1,
        GPIO12_EDGE_LOW: u1,
        GPIO12_EDGE_HIGH: u1,
        GPIO13_LEVEL_LOW: u1,
        GPIO13_LEVEL_HIGH: u1,
        GPIO13_EDGE_LOW: u1,
        GPIO13_EDGE_HIGH: u1,
        GPIO14_LEVEL_LOW: u1,
        GPIO14_LEVEL_HIGH: u1,
        GPIO14_EDGE_LOW: u1,
        GPIO14_EDGE_HIGH: u1,
        GPIO15_LEVEL_LOW: u1,
        GPIO15_LEVEL_HIGH: u1,
        GPIO15_EDGE_LOW: u1,
        GPIO15_EDGE_HIGH: u1,
    }),
    /// Interrupt status after masking & forcing for dormant_wake
    /// offset: 0x188
    DORMANT_WAKE_INTS2: mmio.Mmio(packed struct(u32) {
        GPIO16_LEVEL_LOW: u1,
        GPIO16_LEVEL_HIGH: u1,
        GPIO16_EDGE_LOW: u1,
        GPIO16_EDGE_HIGH: u1,
        GPIO17_LEVEL_LOW: u1,
        GPIO17_LEVEL_HIGH: u1,
        GPIO17_EDGE_LOW: u1,
        GPIO17_EDGE_HIGH: u1,
        GPIO18_LEVEL_LOW: u1,
        GPIO18_LEVEL_HIGH: u1,
        GPIO18_EDGE_LOW: u1,
        GPIO18_EDGE_HIGH: u1,
        GPIO19_LEVEL_LOW: u1,
        GPIO19_LEVEL_HIGH: u1,
        GPIO19_EDGE_LOW: u1,
        GPIO19_EDGE_HIGH: u1,
        GPIO20_LEVEL_LOW: u1,
        GPIO20_LEVEL_HIGH: u1,
        GPIO20_EDGE_LOW: u1,
        GPIO20_EDGE_HIGH: u1,
        GPIO21_LEVEL_LOW: u1,
        GPIO21_LEVEL_HIGH: u1,
        GPIO21_EDGE_LOW: u1,
        GPIO21_EDGE_HIGH: u1,
        GPIO22_LEVEL_LOW: u1,
        GPIO22_LEVEL_HIGH: u1,
        GPIO22_EDGE_LOW: u1,
        GPIO22_EDGE_HIGH: u1,
        GPIO23_LEVEL_LOW: u1,
        GPIO23_LEVEL_HIGH: u1,
        GPIO23_EDGE_LOW: u1,
        GPIO23_EDGE_HIGH: u1,
    }),
    /// Interrupt status after masking & forcing for dormant_wake
    /// offset: 0x18c
    DORMANT_WAKE_INTS3: mmio.Mmio(packed struct(u32) {
        GPIO24_LEVEL_LOW: u1,
        GPIO24_LEVEL_HIGH: u1,
        GPIO24_EDGE_LOW: u1,
        GPIO24_EDGE_HIGH: u1,
        GPIO25_LEVEL_LOW: u1,
        GPIO25_LEVEL_HIGH: u1,
        GPIO25_EDGE_LOW: u1,
        GPIO25_EDGE_HIGH: u1,
        GPIO26_LEVEL_LOW: u1,
        GPIO26_LEVEL_HIGH: u1,
        GPIO26_EDGE_LOW: u1,
        GPIO26_EDGE_HIGH: u1,
        GPIO27_LEVEL_LOW: u1,
        GPIO27_LEVEL_HIGH: u1,
        GPIO27_EDGE_LOW: u1,
        GPIO27_EDGE_HIGH: u1,
        GPIO28_LEVEL_LOW: u1,
        GPIO28_LEVEL_HIGH: u1,
        GPIO28_EDGE_LOW: u1,
        GPIO28_EDGE_HIGH: u1,
        GPIO29_LEVEL_LOW: u1,
        GPIO29_LEVEL_HIGH: u1,
        GPIO29_EDGE_LOW: u1,
        GPIO29_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
};
