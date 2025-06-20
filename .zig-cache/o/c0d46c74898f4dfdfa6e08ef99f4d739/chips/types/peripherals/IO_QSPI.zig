const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const IO_QSPI = extern struct {
    /// GPIO status
    /// offset: 0x00
    GPIO_QSPI_SCLK_STATUS: mmio.Mmio(packed struct(u32) {
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
    GPIO_QSPI_SCLK_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            xip_sclk = 0x0,
            sio_30 = 0x5,
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
    GPIO_QSPI_SS_STATUS: mmio.Mmio(packed struct(u32) {
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
    GPIO_QSPI_SS_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            xip_ss_n = 0x0,
            sio_31 = 0x5,
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
    GPIO_QSPI_SD0_STATUS: mmio.Mmio(packed struct(u32) {
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
    GPIO_QSPI_SD0_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            xip_sd0 = 0x0,
            sio_32 = 0x5,
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
    GPIO_QSPI_SD1_STATUS: mmio.Mmio(packed struct(u32) {
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
    GPIO_QSPI_SD1_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            xip_sd1 = 0x0,
            sio_33 = 0x5,
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
    GPIO_QSPI_SD2_STATUS: mmio.Mmio(packed struct(u32) {
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
    GPIO_QSPI_SD2_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            xip_sd2 = 0x0,
            sio_34 = 0x5,
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
    GPIO_QSPI_SD3_STATUS: mmio.Mmio(packed struct(u32) {
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
    GPIO_QSPI_SD3_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0-31 -> selects pin function according to the gpio table 31 == NULL
        FUNCSEL: enum(u5) {
            xip_sd3 = 0x0,
            sio_35 = 0x5,
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
    /// offset: 0x30
    INTR: mmio.Mmio(packed struct(u32) {
        GPIO_QSPI_SCLK_LEVEL_LOW: u1,
        GPIO_QSPI_SCLK_LEVEL_HIGH: u1,
        GPIO_QSPI_SCLK_EDGE_LOW: u1,
        GPIO_QSPI_SCLK_EDGE_HIGH: u1,
        GPIO_QSPI_SS_LEVEL_LOW: u1,
        GPIO_QSPI_SS_LEVEL_HIGH: u1,
        GPIO_QSPI_SS_EDGE_LOW: u1,
        GPIO_QSPI_SS_EDGE_HIGH: u1,
        GPIO_QSPI_SD0_LEVEL_LOW: u1,
        GPIO_QSPI_SD0_LEVEL_HIGH: u1,
        GPIO_QSPI_SD0_EDGE_LOW: u1,
        GPIO_QSPI_SD0_EDGE_HIGH: u1,
        GPIO_QSPI_SD1_LEVEL_LOW: u1,
        GPIO_QSPI_SD1_LEVEL_HIGH: u1,
        GPIO_QSPI_SD1_EDGE_LOW: u1,
        GPIO_QSPI_SD1_EDGE_HIGH: u1,
        GPIO_QSPI_SD2_LEVEL_LOW: u1,
        GPIO_QSPI_SD2_LEVEL_HIGH: u1,
        GPIO_QSPI_SD2_EDGE_LOW: u1,
        GPIO_QSPI_SD2_EDGE_HIGH: u1,
        GPIO_QSPI_SD3_LEVEL_LOW: u1,
        GPIO_QSPI_SD3_LEVEL_HIGH: u1,
        GPIO_QSPI_SD3_EDGE_LOW: u1,
        GPIO_QSPI_SD3_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Enable for proc0
    /// offset: 0x34
    PROC0_INTE: mmio.Mmio(packed struct(u32) {
        GPIO_QSPI_SCLK_LEVEL_LOW: u1,
        GPIO_QSPI_SCLK_LEVEL_HIGH: u1,
        GPIO_QSPI_SCLK_EDGE_LOW: u1,
        GPIO_QSPI_SCLK_EDGE_HIGH: u1,
        GPIO_QSPI_SS_LEVEL_LOW: u1,
        GPIO_QSPI_SS_LEVEL_HIGH: u1,
        GPIO_QSPI_SS_EDGE_LOW: u1,
        GPIO_QSPI_SS_EDGE_HIGH: u1,
        GPIO_QSPI_SD0_LEVEL_LOW: u1,
        GPIO_QSPI_SD0_LEVEL_HIGH: u1,
        GPIO_QSPI_SD0_EDGE_LOW: u1,
        GPIO_QSPI_SD0_EDGE_HIGH: u1,
        GPIO_QSPI_SD1_LEVEL_LOW: u1,
        GPIO_QSPI_SD1_LEVEL_HIGH: u1,
        GPIO_QSPI_SD1_EDGE_LOW: u1,
        GPIO_QSPI_SD1_EDGE_HIGH: u1,
        GPIO_QSPI_SD2_LEVEL_LOW: u1,
        GPIO_QSPI_SD2_LEVEL_HIGH: u1,
        GPIO_QSPI_SD2_EDGE_LOW: u1,
        GPIO_QSPI_SD2_EDGE_HIGH: u1,
        GPIO_QSPI_SD3_LEVEL_LOW: u1,
        GPIO_QSPI_SD3_LEVEL_HIGH: u1,
        GPIO_QSPI_SD3_EDGE_LOW: u1,
        GPIO_QSPI_SD3_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Force for proc0
    /// offset: 0x38
    PROC0_INTF: mmio.Mmio(packed struct(u32) {
        GPIO_QSPI_SCLK_LEVEL_LOW: u1,
        GPIO_QSPI_SCLK_LEVEL_HIGH: u1,
        GPIO_QSPI_SCLK_EDGE_LOW: u1,
        GPIO_QSPI_SCLK_EDGE_HIGH: u1,
        GPIO_QSPI_SS_LEVEL_LOW: u1,
        GPIO_QSPI_SS_LEVEL_HIGH: u1,
        GPIO_QSPI_SS_EDGE_LOW: u1,
        GPIO_QSPI_SS_EDGE_HIGH: u1,
        GPIO_QSPI_SD0_LEVEL_LOW: u1,
        GPIO_QSPI_SD0_LEVEL_HIGH: u1,
        GPIO_QSPI_SD0_EDGE_LOW: u1,
        GPIO_QSPI_SD0_EDGE_HIGH: u1,
        GPIO_QSPI_SD1_LEVEL_LOW: u1,
        GPIO_QSPI_SD1_LEVEL_HIGH: u1,
        GPIO_QSPI_SD1_EDGE_LOW: u1,
        GPIO_QSPI_SD1_EDGE_HIGH: u1,
        GPIO_QSPI_SD2_LEVEL_LOW: u1,
        GPIO_QSPI_SD2_LEVEL_HIGH: u1,
        GPIO_QSPI_SD2_EDGE_LOW: u1,
        GPIO_QSPI_SD2_EDGE_HIGH: u1,
        GPIO_QSPI_SD3_LEVEL_LOW: u1,
        GPIO_QSPI_SD3_LEVEL_HIGH: u1,
        GPIO_QSPI_SD3_EDGE_LOW: u1,
        GPIO_QSPI_SD3_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt status after masking & forcing for proc0
    /// offset: 0x3c
    PROC0_INTS: mmio.Mmio(packed struct(u32) {
        GPIO_QSPI_SCLK_LEVEL_LOW: u1,
        GPIO_QSPI_SCLK_LEVEL_HIGH: u1,
        GPIO_QSPI_SCLK_EDGE_LOW: u1,
        GPIO_QSPI_SCLK_EDGE_HIGH: u1,
        GPIO_QSPI_SS_LEVEL_LOW: u1,
        GPIO_QSPI_SS_LEVEL_HIGH: u1,
        GPIO_QSPI_SS_EDGE_LOW: u1,
        GPIO_QSPI_SS_EDGE_HIGH: u1,
        GPIO_QSPI_SD0_LEVEL_LOW: u1,
        GPIO_QSPI_SD0_LEVEL_HIGH: u1,
        GPIO_QSPI_SD0_EDGE_LOW: u1,
        GPIO_QSPI_SD0_EDGE_HIGH: u1,
        GPIO_QSPI_SD1_LEVEL_LOW: u1,
        GPIO_QSPI_SD1_LEVEL_HIGH: u1,
        GPIO_QSPI_SD1_EDGE_LOW: u1,
        GPIO_QSPI_SD1_EDGE_HIGH: u1,
        GPIO_QSPI_SD2_LEVEL_LOW: u1,
        GPIO_QSPI_SD2_LEVEL_HIGH: u1,
        GPIO_QSPI_SD2_EDGE_LOW: u1,
        GPIO_QSPI_SD2_EDGE_HIGH: u1,
        GPIO_QSPI_SD3_LEVEL_LOW: u1,
        GPIO_QSPI_SD3_LEVEL_HIGH: u1,
        GPIO_QSPI_SD3_EDGE_LOW: u1,
        GPIO_QSPI_SD3_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Enable for proc1
    /// offset: 0x40
    PROC1_INTE: mmio.Mmio(packed struct(u32) {
        GPIO_QSPI_SCLK_LEVEL_LOW: u1,
        GPIO_QSPI_SCLK_LEVEL_HIGH: u1,
        GPIO_QSPI_SCLK_EDGE_LOW: u1,
        GPIO_QSPI_SCLK_EDGE_HIGH: u1,
        GPIO_QSPI_SS_LEVEL_LOW: u1,
        GPIO_QSPI_SS_LEVEL_HIGH: u1,
        GPIO_QSPI_SS_EDGE_LOW: u1,
        GPIO_QSPI_SS_EDGE_HIGH: u1,
        GPIO_QSPI_SD0_LEVEL_LOW: u1,
        GPIO_QSPI_SD0_LEVEL_HIGH: u1,
        GPIO_QSPI_SD0_EDGE_LOW: u1,
        GPIO_QSPI_SD0_EDGE_HIGH: u1,
        GPIO_QSPI_SD1_LEVEL_LOW: u1,
        GPIO_QSPI_SD1_LEVEL_HIGH: u1,
        GPIO_QSPI_SD1_EDGE_LOW: u1,
        GPIO_QSPI_SD1_EDGE_HIGH: u1,
        GPIO_QSPI_SD2_LEVEL_LOW: u1,
        GPIO_QSPI_SD2_LEVEL_HIGH: u1,
        GPIO_QSPI_SD2_EDGE_LOW: u1,
        GPIO_QSPI_SD2_EDGE_HIGH: u1,
        GPIO_QSPI_SD3_LEVEL_LOW: u1,
        GPIO_QSPI_SD3_LEVEL_HIGH: u1,
        GPIO_QSPI_SD3_EDGE_LOW: u1,
        GPIO_QSPI_SD3_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Force for proc1
    /// offset: 0x44
    PROC1_INTF: mmio.Mmio(packed struct(u32) {
        GPIO_QSPI_SCLK_LEVEL_LOW: u1,
        GPIO_QSPI_SCLK_LEVEL_HIGH: u1,
        GPIO_QSPI_SCLK_EDGE_LOW: u1,
        GPIO_QSPI_SCLK_EDGE_HIGH: u1,
        GPIO_QSPI_SS_LEVEL_LOW: u1,
        GPIO_QSPI_SS_LEVEL_HIGH: u1,
        GPIO_QSPI_SS_EDGE_LOW: u1,
        GPIO_QSPI_SS_EDGE_HIGH: u1,
        GPIO_QSPI_SD0_LEVEL_LOW: u1,
        GPIO_QSPI_SD0_LEVEL_HIGH: u1,
        GPIO_QSPI_SD0_EDGE_LOW: u1,
        GPIO_QSPI_SD0_EDGE_HIGH: u1,
        GPIO_QSPI_SD1_LEVEL_LOW: u1,
        GPIO_QSPI_SD1_LEVEL_HIGH: u1,
        GPIO_QSPI_SD1_EDGE_LOW: u1,
        GPIO_QSPI_SD1_EDGE_HIGH: u1,
        GPIO_QSPI_SD2_LEVEL_LOW: u1,
        GPIO_QSPI_SD2_LEVEL_HIGH: u1,
        GPIO_QSPI_SD2_EDGE_LOW: u1,
        GPIO_QSPI_SD2_EDGE_HIGH: u1,
        GPIO_QSPI_SD3_LEVEL_LOW: u1,
        GPIO_QSPI_SD3_LEVEL_HIGH: u1,
        GPIO_QSPI_SD3_EDGE_LOW: u1,
        GPIO_QSPI_SD3_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt status after masking & forcing for proc1
    /// offset: 0x48
    PROC1_INTS: mmio.Mmio(packed struct(u32) {
        GPIO_QSPI_SCLK_LEVEL_LOW: u1,
        GPIO_QSPI_SCLK_LEVEL_HIGH: u1,
        GPIO_QSPI_SCLK_EDGE_LOW: u1,
        GPIO_QSPI_SCLK_EDGE_HIGH: u1,
        GPIO_QSPI_SS_LEVEL_LOW: u1,
        GPIO_QSPI_SS_LEVEL_HIGH: u1,
        GPIO_QSPI_SS_EDGE_LOW: u1,
        GPIO_QSPI_SS_EDGE_HIGH: u1,
        GPIO_QSPI_SD0_LEVEL_LOW: u1,
        GPIO_QSPI_SD0_LEVEL_HIGH: u1,
        GPIO_QSPI_SD0_EDGE_LOW: u1,
        GPIO_QSPI_SD0_EDGE_HIGH: u1,
        GPIO_QSPI_SD1_LEVEL_LOW: u1,
        GPIO_QSPI_SD1_LEVEL_HIGH: u1,
        GPIO_QSPI_SD1_EDGE_LOW: u1,
        GPIO_QSPI_SD1_EDGE_HIGH: u1,
        GPIO_QSPI_SD2_LEVEL_LOW: u1,
        GPIO_QSPI_SD2_LEVEL_HIGH: u1,
        GPIO_QSPI_SD2_EDGE_LOW: u1,
        GPIO_QSPI_SD2_EDGE_HIGH: u1,
        GPIO_QSPI_SD3_LEVEL_LOW: u1,
        GPIO_QSPI_SD3_LEVEL_HIGH: u1,
        GPIO_QSPI_SD3_EDGE_LOW: u1,
        GPIO_QSPI_SD3_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Enable for dormant_wake
    /// offset: 0x4c
    DORMANT_WAKE_INTE: mmio.Mmio(packed struct(u32) {
        GPIO_QSPI_SCLK_LEVEL_LOW: u1,
        GPIO_QSPI_SCLK_LEVEL_HIGH: u1,
        GPIO_QSPI_SCLK_EDGE_LOW: u1,
        GPIO_QSPI_SCLK_EDGE_HIGH: u1,
        GPIO_QSPI_SS_LEVEL_LOW: u1,
        GPIO_QSPI_SS_LEVEL_HIGH: u1,
        GPIO_QSPI_SS_EDGE_LOW: u1,
        GPIO_QSPI_SS_EDGE_HIGH: u1,
        GPIO_QSPI_SD0_LEVEL_LOW: u1,
        GPIO_QSPI_SD0_LEVEL_HIGH: u1,
        GPIO_QSPI_SD0_EDGE_LOW: u1,
        GPIO_QSPI_SD0_EDGE_HIGH: u1,
        GPIO_QSPI_SD1_LEVEL_LOW: u1,
        GPIO_QSPI_SD1_LEVEL_HIGH: u1,
        GPIO_QSPI_SD1_EDGE_LOW: u1,
        GPIO_QSPI_SD1_EDGE_HIGH: u1,
        GPIO_QSPI_SD2_LEVEL_LOW: u1,
        GPIO_QSPI_SD2_LEVEL_HIGH: u1,
        GPIO_QSPI_SD2_EDGE_LOW: u1,
        GPIO_QSPI_SD2_EDGE_HIGH: u1,
        GPIO_QSPI_SD3_LEVEL_LOW: u1,
        GPIO_QSPI_SD3_LEVEL_HIGH: u1,
        GPIO_QSPI_SD3_EDGE_LOW: u1,
        GPIO_QSPI_SD3_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt Force for dormant_wake
    /// offset: 0x50
    DORMANT_WAKE_INTF: mmio.Mmio(packed struct(u32) {
        GPIO_QSPI_SCLK_LEVEL_LOW: u1,
        GPIO_QSPI_SCLK_LEVEL_HIGH: u1,
        GPIO_QSPI_SCLK_EDGE_LOW: u1,
        GPIO_QSPI_SCLK_EDGE_HIGH: u1,
        GPIO_QSPI_SS_LEVEL_LOW: u1,
        GPIO_QSPI_SS_LEVEL_HIGH: u1,
        GPIO_QSPI_SS_EDGE_LOW: u1,
        GPIO_QSPI_SS_EDGE_HIGH: u1,
        GPIO_QSPI_SD0_LEVEL_LOW: u1,
        GPIO_QSPI_SD0_LEVEL_HIGH: u1,
        GPIO_QSPI_SD0_EDGE_LOW: u1,
        GPIO_QSPI_SD0_EDGE_HIGH: u1,
        GPIO_QSPI_SD1_LEVEL_LOW: u1,
        GPIO_QSPI_SD1_LEVEL_HIGH: u1,
        GPIO_QSPI_SD1_EDGE_LOW: u1,
        GPIO_QSPI_SD1_EDGE_HIGH: u1,
        GPIO_QSPI_SD2_LEVEL_LOW: u1,
        GPIO_QSPI_SD2_LEVEL_HIGH: u1,
        GPIO_QSPI_SD2_EDGE_LOW: u1,
        GPIO_QSPI_SD2_EDGE_HIGH: u1,
        GPIO_QSPI_SD3_LEVEL_LOW: u1,
        GPIO_QSPI_SD3_LEVEL_HIGH: u1,
        GPIO_QSPI_SD3_EDGE_LOW: u1,
        GPIO_QSPI_SD3_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
    /// Interrupt status after masking & forcing for dormant_wake
    /// offset: 0x54
    DORMANT_WAKE_INTS: mmio.Mmio(packed struct(u32) {
        GPIO_QSPI_SCLK_LEVEL_LOW: u1,
        GPIO_QSPI_SCLK_LEVEL_HIGH: u1,
        GPIO_QSPI_SCLK_EDGE_LOW: u1,
        GPIO_QSPI_SCLK_EDGE_HIGH: u1,
        GPIO_QSPI_SS_LEVEL_LOW: u1,
        GPIO_QSPI_SS_LEVEL_HIGH: u1,
        GPIO_QSPI_SS_EDGE_LOW: u1,
        GPIO_QSPI_SS_EDGE_HIGH: u1,
        GPIO_QSPI_SD0_LEVEL_LOW: u1,
        GPIO_QSPI_SD0_LEVEL_HIGH: u1,
        GPIO_QSPI_SD0_EDGE_LOW: u1,
        GPIO_QSPI_SD0_EDGE_HIGH: u1,
        GPIO_QSPI_SD1_LEVEL_LOW: u1,
        GPIO_QSPI_SD1_LEVEL_HIGH: u1,
        GPIO_QSPI_SD1_EDGE_LOW: u1,
        GPIO_QSPI_SD1_EDGE_HIGH: u1,
        GPIO_QSPI_SD2_LEVEL_LOW: u1,
        GPIO_QSPI_SD2_LEVEL_HIGH: u1,
        GPIO_QSPI_SD2_EDGE_LOW: u1,
        GPIO_QSPI_SD2_EDGE_HIGH: u1,
        GPIO_QSPI_SD3_LEVEL_LOW: u1,
        GPIO_QSPI_SD3_LEVEL_HIGH: u1,
        GPIO_QSPI_SD3_EDGE_LOW: u1,
        GPIO_QSPI_SD3_EDGE_HIGH: u1,
        padding: u8 = 0,
    }),
};
