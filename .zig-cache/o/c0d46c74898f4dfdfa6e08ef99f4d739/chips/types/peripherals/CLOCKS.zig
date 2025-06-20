const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const CLOCKS = extern struct {
    /// Clock control, can be changed on-the-fly (except for auxsrc)
    /// offset: 0x00
    CLK_GPOUT0_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// Selects the auxiliary clock source, will glitch when switching
        AUXSRC: enum(u4) {
            clksrc_pll_sys = 0x0,
            clksrc_gpin0 = 0x1,
            clksrc_gpin1 = 0x2,
            clksrc_pll_usb = 0x3,
            rosc_clksrc = 0x4,
            xosc_clksrc = 0x5,
            clk_sys = 0x6,
            clk_usb = 0x7,
            clk_adc = 0x8,
            clk_rtc = 0x9,
            clk_ref = 0xa,
            _,
        },
        reserved10: u1 = 0,
        /// Asynchronously kills the clock generator
        KILL: u1,
        /// Starts and stops the clock generator cleanly
        ENABLE: u1,
        /// Enables duty cycle correction for odd divisors
        DC50: u1,
        reserved16: u3 = 0,
        /// This delays the enable signal by up to 3 cycles of the input clock This must be set before the clock is enabled to have any effect
        PHASE: u2,
        reserved20: u2 = 0,
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock This can be done at any time
        NUDGE: u1,
        padding: u11 = 0,
    }),
    /// Clock divisor, can be changed on-the-fly
    /// offset: 0x04
    CLK_GPOUT0_DIV: mmio.Mmio(packed struct(u32) {
        /// Fractional component of the divisor
        FRAC: u8,
        /// Integer component of the divisor, 0 -> divide by 2^16
        INT: u24,
    }),
    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// offset: 0x08
    CLK_GPOUT0_SELECTED: mmio.Mmio(packed struct(u32) {
        /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
        CLK_GPOUT0_SELECTED: u32,
    }),
    /// Clock control, can be changed on-the-fly (except for auxsrc)
    /// offset: 0x0c
    CLK_GPOUT1_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// Selects the auxiliary clock source, will glitch when switching
        AUXSRC: enum(u4) {
            clksrc_pll_sys = 0x0,
            clksrc_gpin0 = 0x1,
            clksrc_gpin1 = 0x2,
            clksrc_pll_usb = 0x3,
            rosc_clksrc = 0x4,
            xosc_clksrc = 0x5,
            clk_sys = 0x6,
            clk_usb = 0x7,
            clk_adc = 0x8,
            clk_rtc = 0x9,
            clk_ref = 0xa,
            _,
        },
        reserved10: u1 = 0,
        /// Asynchronously kills the clock generator
        KILL: u1,
        /// Starts and stops the clock generator cleanly
        ENABLE: u1,
        /// Enables duty cycle correction for odd divisors
        DC50: u1,
        reserved16: u3 = 0,
        /// This delays the enable signal by up to 3 cycles of the input clock This must be set before the clock is enabled to have any effect
        PHASE: u2,
        reserved20: u2 = 0,
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock This can be done at any time
        NUDGE: u1,
        padding: u11 = 0,
    }),
    /// Clock divisor, can be changed on-the-fly
    /// offset: 0x10
    CLK_GPOUT1_DIV: mmio.Mmio(packed struct(u32) {
        /// Fractional component of the divisor
        FRAC: u8,
        /// Integer component of the divisor, 0 -> divide by 2^16
        INT: u24,
    }),
    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// offset: 0x14
    CLK_GPOUT1_SELECTED: mmio.Mmio(packed struct(u32) {
        /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
        CLK_GPOUT1_SELECTED: u32,
    }),
    /// Clock control, can be changed on-the-fly (except for auxsrc)
    /// offset: 0x18
    CLK_GPOUT2_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// Selects the auxiliary clock source, will glitch when switching
        AUXSRC: enum(u4) {
            clksrc_pll_sys = 0x0,
            clksrc_gpin0 = 0x1,
            clksrc_gpin1 = 0x2,
            clksrc_pll_usb = 0x3,
            rosc_clksrc_ph = 0x4,
            xosc_clksrc = 0x5,
            clk_sys = 0x6,
            clk_usb = 0x7,
            clk_adc = 0x8,
            clk_rtc = 0x9,
            clk_ref = 0xa,
            _,
        },
        reserved10: u1 = 0,
        /// Asynchronously kills the clock generator
        KILL: u1,
        /// Starts and stops the clock generator cleanly
        ENABLE: u1,
        /// Enables duty cycle correction for odd divisors
        DC50: u1,
        reserved16: u3 = 0,
        /// This delays the enable signal by up to 3 cycles of the input clock This must be set before the clock is enabled to have any effect
        PHASE: u2,
        reserved20: u2 = 0,
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock This can be done at any time
        NUDGE: u1,
        padding: u11 = 0,
    }),
    /// Clock divisor, can be changed on-the-fly
    /// offset: 0x1c
    CLK_GPOUT2_DIV: mmio.Mmio(packed struct(u32) {
        /// Fractional component of the divisor
        FRAC: u8,
        /// Integer component of the divisor, 0 -> divide by 2^16
        INT: u24,
    }),
    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// offset: 0x20
    CLK_GPOUT2_SELECTED: mmio.Mmio(packed struct(u32) {
        /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
        CLK_GPOUT2_SELECTED: u32,
    }),
    /// Clock control, can be changed on-the-fly (except for auxsrc)
    /// offset: 0x24
    CLK_GPOUT3_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// Selects the auxiliary clock source, will glitch when switching
        AUXSRC: enum(u4) {
            clksrc_pll_sys = 0x0,
            clksrc_gpin0 = 0x1,
            clksrc_gpin1 = 0x2,
            clksrc_pll_usb = 0x3,
            rosc_clksrc_ph = 0x4,
            xosc_clksrc = 0x5,
            clk_sys = 0x6,
            clk_usb = 0x7,
            clk_adc = 0x8,
            clk_rtc = 0x9,
            clk_ref = 0xa,
            _,
        },
        reserved10: u1 = 0,
        /// Asynchronously kills the clock generator
        KILL: u1,
        /// Starts and stops the clock generator cleanly
        ENABLE: u1,
        /// Enables duty cycle correction for odd divisors
        DC50: u1,
        reserved16: u3 = 0,
        /// This delays the enable signal by up to 3 cycles of the input clock This must be set before the clock is enabled to have any effect
        PHASE: u2,
        reserved20: u2 = 0,
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock This can be done at any time
        NUDGE: u1,
        padding: u11 = 0,
    }),
    /// Clock divisor, can be changed on-the-fly
    /// offset: 0x28
    CLK_GPOUT3_DIV: mmio.Mmio(packed struct(u32) {
        /// Fractional component of the divisor
        FRAC: u8,
        /// Integer component of the divisor, 0 -> divide by 2^16
        INT: u24,
    }),
    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// offset: 0x2c
    CLK_GPOUT3_SELECTED: mmio.Mmio(packed struct(u32) {
        /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
        CLK_GPOUT3_SELECTED: u32,
    }),
    /// Clock control, can be changed on-the-fly (except for auxsrc)
    /// offset: 0x30
    CLK_REF_CTRL: mmio.Mmio(packed struct(u32) {
        /// Selects the clock source glitchlessly, can be changed on-the-fly
        SRC: enum(u2) {
            rosc_clksrc_ph = 0x0,
            clksrc_clk_ref_aux = 0x1,
            xosc_clksrc = 0x2,
            _,
        },
        reserved5: u3 = 0,
        /// Selects the auxiliary clock source, will glitch when switching
        AUXSRC: enum(u2) {
            clksrc_pll_usb = 0x0,
            clksrc_gpin0 = 0x1,
            clksrc_gpin1 = 0x2,
            _,
        },
        padding: u25 = 0,
    }),
    /// Clock divisor, can be changed on-the-fly
    /// offset: 0x34
    CLK_REF_DIV: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Integer component of the divisor, 0 -> divide by 2^16
        INT: u2,
        padding: u22 = 0,
    }),
    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// offset: 0x38
    CLK_REF_SELECTED: mmio.Mmio(packed struct(u32) {
        /// The glitchless multiplexer does not switch instantaneously (to avoid glitches), so software should poll this register to wait for the switch to complete. This register contains one decoded bit for each of the clock sources enumerated in the CTRL SRC field. At most one of these bits will be set at any time, indicating that clock is currently present at the output of the glitchless mux. Whilst switching is in progress, this register may briefly show all-0s.
        CLK_REF_SELECTED: u32,
    }),
    /// Clock control, can be changed on-the-fly (except for auxsrc)
    /// offset: 0x3c
    CLK_SYS_CTRL: mmio.Mmio(packed struct(u32) {
        /// Selects the clock source glitchlessly, can be changed on-the-fly
        SRC: enum(u1) {
            clk_ref = 0x0,
            clksrc_clk_sys_aux = 0x1,
        },
        reserved5: u4 = 0,
        /// Selects the auxiliary clock source, will glitch when switching
        AUXSRC: enum(u3) {
            clksrc_pll_sys = 0x0,
            clksrc_pll_usb = 0x1,
            rosc_clksrc = 0x2,
            xosc_clksrc = 0x3,
            clksrc_gpin0 = 0x4,
            clksrc_gpin1 = 0x5,
            _,
        },
        padding: u24 = 0,
    }),
    /// Clock divisor, can be changed on-the-fly
    /// offset: 0x40
    CLK_SYS_DIV: mmio.Mmio(packed struct(u32) {
        /// Fractional component of the divisor
        FRAC: u8,
        /// Integer component of the divisor, 0 -> divide by 2^16
        INT: u24,
    }),
    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// offset: 0x44
    CLK_SYS_SELECTED: mmio.Mmio(packed struct(u32) {
        /// The glitchless multiplexer does not switch instantaneously (to avoid glitches), so software should poll this register to wait for the switch to complete. This register contains one decoded bit for each of the clock sources enumerated in the CTRL SRC field. At most one of these bits will be set at any time, indicating that clock is currently present at the output of the glitchless mux. Whilst switching is in progress, this register may briefly show all-0s.
        CLK_SYS_SELECTED: u32,
    }),
    /// Clock control, can be changed on-the-fly (except for auxsrc)
    /// offset: 0x48
    CLK_PERI_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// Selects the auxiliary clock source, will glitch when switching
        AUXSRC: enum(u3) {
            clk_sys = 0x0,
            clksrc_pll_sys = 0x1,
            clksrc_pll_usb = 0x2,
            rosc_clksrc_ph = 0x3,
            xosc_clksrc = 0x4,
            clksrc_gpin0 = 0x5,
            clksrc_gpin1 = 0x6,
            _,
        },
        reserved10: u2 = 0,
        /// Asynchronously kills the clock generator
        KILL: u1,
        /// Starts and stops the clock generator cleanly
        ENABLE: u1,
        padding: u20 = 0,
    }),
    /// Clock divisor, can be changed on-the-fly
    /// offset: 0x4c
    CLK_PERI_DIV: mmio.Mmio(packed struct(u32) {
        /// Fractional component of the divisor
        FRAC: u8,
        /// Integer component of the divisor, 0 -> divide by 2^16
        INT: u24,
    }),
    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// offset: 0x50
    CLK_PERI_SELECTED: mmio.Mmio(packed struct(u32) {
        /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
        CLK_PERI_SELECTED: u32,
    }),
    /// Clock control, can be changed on-the-fly (except for auxsrc)
    /// offset: 0x54
    CLK_USB_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// Selects the auxiliary clock source, will glitch when switching
        AUXSRC: enum(u3) {
            clksrc_pll_usb = 0x0,
            clksrc_pll_sys = 0x1,
            rosc_clksrc_ph = 0x2,
            xosc_clksrc = 0x3,
            clksrc_gpin0 = 0x4,
            clksrc_gpin1 = 0x5,
            _,
        },
        reserved10: u2 = 0,
        /// Asynchronously kills the clock generator
        KILL: u1,
        /// Starts and stops the clock generator cleanly
        ENABLE: u1,
        reserved16: u4 = 0,
        /// This delays the enable signal by up to 3 cycles of the input clock This must be set before the clock is enabled to have any effect
        PHASE: u2,
        reserved20: u2 = 0,
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock This can be done at any time
        NUDGE: u1,
        padding: u11 = 0,
    }),
    /// Clock divisor, can be changed on-the-fly
    /// offset: 0x58
    CLK_USB_DIV: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Integer component of the divisor, 0 -> divide by 2^16
        INT: u2,
        padding: u22 = 0,
    }),
    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// offset: 0x5c
    CLK_USB_SELECTED: mmio.Mmio(packed struct(u32) {
        /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
        CLK_USB_SELECTED: u32,
    }),
    /// Clock control, can be changed on-the-fly (except for auxsrc)
    /// offset: 0x60
    CLK_ADC_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// Selects the auxiliary clock source, will glitch when switching
        AUXSRC: enum(u3) {
            clksrc_pll_usb = 0x0,
            clksrc_pll_sys = 0x1,
            rosc_clksrc_ph = 0x2,
            xosc_clksrc = 0x3,
            clksrc_gpin0 = 0x4,
            clksrc_gpin1 = 0x5,
            _,
        },
        reserved10: u2 = 0,
        /// Asynchronously kills the clock generator
        KILL: u1,
        /// Starts and stops the clock generator cleanly
        ENABLE: u1,
        reserved16: u4 = 0,
        /// This delays the enable signal by up to 3 cycles of the input clock This must be set before the clock is enabled to have any effect
        PHASE: u2,
        reserved20: u2 = 0,
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock This can be done at any time
        NUDGE: u1,
        padding: u11 = 0,
    }),
    /// Clock divisor, can be changed on-the-fly
    /// offset: 0x64
    CLK_ADC_DIV: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Integer component of the divisor, 0 -> divide by 2^16
        INT: u2,
        padding: u22 = 0,
    }),
    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// offset: 0x68
    CLK_ADC_SELECTED: mmio.Mmio(packed struct(u32) {
        /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
        CLK_ADC_SELECTED: u32,
    }),
    /// Clock control, can be changed on-the-fly (except for auxsrc)
    /// offset: 0x6c
    CLK_RTC_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// Selects the auxiliary clock source, will glitch when switching
        AUXSRC: enum(u3) {
            clksrc_pll_usb = 0x0,
            clksrc_pll_sys = 0x1,
            rosc_clksrc_ph = 0x2,
            xosc_clksrc = 0x3,
            clksrc_gpin0 = 0x4,
            clksrc_gpin1 = 0x5,
            _,
        },
        reserved10: u2 = 0,
        /// Asynchronously kills the clock generator
        KILL: u1,
        /// Starts and stops the clock generator cleanly
        ENABLE: u1,
        reserved16: u4 = 0,
        /// This delays the enable signal by up to 3 cycles of the input clock This must be set before the clock is enabled to have any effect
        PHASE: u2,
        reserved20: u2 = 0,
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock This can be done at any time
        NUDGE: u1,
        padding: u11 = 0,
    }),
    /// Clock divisor, can be changed on-the-fly
    /// offset: 0x70
    CLK_RTC_DIV: mmio.Mmio(packed struct(u32) {
        /// Fractional component of the divisor
        FRAC: u8,
        /// Integer component of the divisor, 0 -> divide by 2^16
        INT: u24,
    }),
    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// offset: 0x74
    CLK_RTC_SELECTED: mmio.Mmio(packed struct(u32) {
        /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
        CLK_RTC_SELECTED: u32,
    }),
    /// offset: 0x78
    CLK_SYS_RESUS_CTRL: mmio.Mmio(packed struct(u32) {
        /// This is expressed as a number of clk_ref cycles and must be >= 2x clk_ref_freq/min_clk_tst_freq
        TIMEOUT: u8,
        /// Enable resus
        ENABLE: u1,
        reserved12: u3 = 0,
        /// Force a resus, for test purposes only
        FRCE: u1,
        reserved16: u3 = 0,
        /// For clearing the resus after the fault that triggered it has been corrected
        CLEAR: u1,
        padding: u15 = 0,
    }),
    /// offset: 0x7c
    CLK_SYS_RESUS_STATUS: mmio.Mmio(packed struct(u32) {
        /// Clock has been resuscitated, correct the error then send ctrl_clear=1
        RESUSSED: u1,
        padding: u31 = 0,
    }),
    /// Reference clock frequency in kHz
    /// offset: 0x80
    FC0_REF_KHZ: mmio.Mmio(packed struct(u32) {
        FC0_REF_KHZ: u20,
        padding: u12 = 0,
    }),
    /// Minimum pass frequency in kHz. This is optional. Set to 0 if you are not using the pass/fail flags
    /// offset: 0x84
    FC0_MIN_KHZ: mmio.Mmio(packed struct(u32) {
        FC0_MIN_KHZ: u25,
        padding: u7 = 0,
    }),
    /// Maximum pass frequency in kHz. This is optional. Set to 0x1ffffff if you are not using the pass/fail flags
    /// offset: 0x88
    FC0_MAX_KHZ: mmio.Mmio(packed struct(u32) {
        FC0_MAX_KHZ: u25,
        padding: u7 = 0,
    }),
    /// Delays the start of frequency counting to allow the mux to settle Delay is measured in multiples of the reference clock period
    /// offset: 0x8c
    FC0_DELAY: mmio.Mmio(packed struct(u32) {
        FC0_DELAY: u3,
        padding: u29 = 0,
    }),
    /// The test interval is 0.98us * 2**interval, but let's call it 1us * 2**interval The default gives a test interval of 250us
    /// offset: 0x90
    FC0_INTERVAL: mmio.Mmio(packed struct(u32) {
        FC0_INTERVAL: u4,
        padding: u28 = 0,
    }),
    /// Clock sent to frequency counter, set to 0 when not required Writing to this register initiates the frequency count
    /// offset: 0x94
    FC0_SRC: mmio.Mmio(packed struct(u32) {
        FC0_SRC: enum(u8) {
            NULL = 0x0,
            pll_sys_clksrc_primary = 0x1,
            pll_usb_clksrc_primary = 0x2,
            rosc_clksrc = 0x3,
            rosc_clksrc_ph = 0x4,
            xosc_clksrc = 0x5,
            clksrc_gpin0 = 0x6,
            clksrc_gpin1 = 0x7,
            clk_ref = 0x8,
            clk_sys = 0x9,
            clk_peri = 0xa,
            clk_usb = 0xb,
            clk_adc = 0xc,
            clk_rtc = 0xd,
            _,
        },
        padding: u24 = 0,
    }),
    /// Frequency counter status
    /// offset: 0x98
    FC0_STATUS: mmio.Mmio(packed struct(u32) {
        /// Test passed
        PASS: u1,
        reserved4: u3 = 0,
        /// Test complete
        DONE: u1,
        reserved8: u3 = 0,
        /// Test running
        RUNNING: u1,
        reserved12: u3 = 0,
        /// Waiting for test clock to start
        WAITING: u1,
        reserved16: u3 = 0,
        /// Test failed
        FAIL: u1,
        reserved20: u3 = 0,
        /// Test clock slower than expected, only valid when status_done=1
        SLOW: u1,
        reserved24: u3 = 0,
        /// Test clock faster than expected, only valid when status_done=1
        FAST: u1,
        reserved28: u3 = 0,
        /// Test clock stopped during test
        DIED: u1,
        padding: u3 = 0,
    }),
    /// Result of frequency measurement, only valid when status_done=1
    /// offset: 0x9c
    FC0_RESULT: mmio.Mmio(packed struct(u32) {
        FRAC: u5,
        KHZ: u25,
        padding: u2 = 0,
    }),
    /// enable clock in wake mode
    /// offset: 0xa0
    WAKE_EN0: mmio.Mmio(packed struct(u32) {
        CLK_SYS_CLOCKS: u1,
        CLK_ADC_ADC: u1,
        CLK_SYS_ADC: u1,
        CLK_SYS_BUSCTRL: u1,
        CLK_SYS_BUSFABRIC: u1,
        CLK_SYS_DMA: u1,
        CLK_SYS_I2C0: u1,
        CLK_SYS_I2C1: u1,
        CLK_SYS_IO: u1,
        CLK_SYS_JTAG: u1,
        CLK_SYS_VREG_AND_CHIP_RESET: u1,
        CLK_SYS_PADS: u1,
        CLK_SYS_PIO0: u1,
        CLK_SYS_PIO1: u1,
        CLK_SYS_PLL_SYS: u1,
        CLK_SYS_PLL_USB: u1,
        CLK_SYS_PSM: u1,
        CLK_SYS_PWM: u1,
        CLK_SYS_RESETS: u1,
        CLK_SYS_ROM: u1,
        CLK_SYS_ROSC: u1,
        CLK_RTC_RTC: u1,
        CLK_SYS_RTC: u1,
        CLK_SYS_SIO: u1,
        CLK_PERI_SPI0: u1,
        CLK_SYS_SPI0: u1,
        CLK_PERI_SPI1: u1,
        CLK_SYS_SPI1: u1,
        CLK_SYS_SRAM0: u1,
        CLK_SYS_SRAM1: u1,
        CLK_SYS_SRAM2: u1,
        CLK_SYS_SRAM3: u1,
    }),
    /// enable clock in wake mode
    /// offset: 0xa4
    WAKE_EN1: mmio.Mmio(packed struct(u32) {
        CLK_SYS_SRAM4: u1,
        CLK_SYS_SRAM5: u1,
        CLK_SYS_SYSCFG: u1,
        CLK_SYS_SYSINFO: u1,
        CLK_SYS_TBMAN: u1,
        CLK_SYS_TIMER: u1,
        CLK_PERI_UART0: u1,
        CLK_SYS_UART0: u1,
        CLK_PERI_UART1: u1,
        CLK_SYS_UART1: u1,
        CLK_SYS_USBCTRL: u1,
        CLK_USB_USBCTRL: u1,
        CLK_SYS_WATCHDOG: u1,
        CLK_SYS_XIP: u1,
        CLK_SYS_XOSC: u1,
        padding: u17 = 0,
    }),
    /// enable clock in sleep mode
    /// offset: 0xa8
    SLEEP_EN0: mmio.Mmio(packed struct(u32) {
        CLK_SYS_CLOCKS: u1,
        CLK_ADC_ADC: u1,
        CLK_SYS_ADC: u1,
        CLK_SYS_BUSCTRL: u1,
        CLK_SYS_BUSFABRIC: u1,
        CLK_SYS_DMA: u1,
        CLK_SYS_I2C0: u1,
        CLK_SYS_I2C1: u1,
        CLK_SYS_IO: u1,
        CLK_SYS_JTAG: u1,
        CLK_SYS_VREG_AND_CHIP_RESET: u1,
        CLK_SYS_PADS: u1,
        CLK_SYS_PIO0: u1,
        CLK_SYS_PIO1: u1,
        CLK_SYS_PLL_SYS: u1,
        CLK_SYS_PLL_USB: u1,
        CLK_SYS_PSM: u1,
        CLK_SYS_PWM: u1,
        CLK_SYS_RESETS: u1,
        CLK_SYS_ROM: u1,
        CLK_SYS_ROSC: u1,
        CLK_RTC_RTC: u1,
        CLK_SYS_RTC: u1,
        CLK_SYS_SIO: u1,
        CLK_PERI_SPI0: u1,
        CLK_SYS_SPI0: u1,
        CLK_PERI_SPI1: u1,
        CLK_SYS_SPI1: u1,
        CLK_SYS_SRAM0: u1,
        CLK_SYS_SRAM1: u1,
        CLK_SYS_SRAM2: u1,
        CLK_SYS_SRAM3: u1,
    }),
    /// enable clock in sleep mode
    /// offset: 0xac
    SLEEP_EN1: mmio.Mmio(packed struct(u32) {
        CLK_SYS_SRAM4: u1,
        CLK_SYS_SRAM5: u1,
        CLK_SYS_SYSCFG: u1,
        CLK_SYS_SYSINFO: u1,
        CLK_SYS_TBMAN: u1,
        CLK_SYS_TIMER: u1,
        CLK_PERI_UART0: u1,
        CLK_SYS_UART0: u1,
        CLK_PERI_UART1: u1,
        CLK_SYS_UART1: u1,
        CLK_SYS_USBCTRL: u1,
        CLK_USB_USBCTRL: u1,
        CLK_SYS_WATCHDOG: u1,
        CLK_SYS_XIP: u1,
        CLK_SYS_XOSC: u1,
        padding: u17 = 0,
    }),
    /// indicates the state of the clock enable
    /// offset: 0xb0
    ENABLED0: mmio.Mmio(packed struct(u32) {
        CLK_SYS_CLOCKS: u1,
        CLK_ADC_ADC: u1,
        CLK_SYS_ADC: u1,
        CLK_SYS_BUSCTRL: u1,
        CLK_SYS_BUSFABRIC: u1,
        CLK_SYS_DMA: u1,
        CLK_SYS_I2C0: u1,
        CLK_SYS_I2C1: u1,
        CLK_SYS_IO: u1,
        CLK_SYS_JTAG: u1,
        CLK_SYS_VREG_AND_CHIP_RESET: u1,
        CLK_SYS_PADS: u1,
        CLK_SYS_PIO0: u1,
        CLK_SYS_PIO1: u1,
        CLK_SYS_PLL_SYS: u1,
        CLK_SYS_PLL_USB: u1,
        CLK_SYS_PSM: u1,
        CLK_SYS_PWM: u1,
        CLK_SYS_RESETS: u1,
        CLK_SYS_ROM: u1,
        CLK_SYS_ROSC: u1,
        CLK_RTC_RTC: u1,
        CLK_SYS_RTC: u1,
        CLK_SYS_SIO: u1,
        CLK_PERI_SPI0: u1,
        CLK_SYS_SPI0: u1,
        CLK_PERI_SPI1: u1,
        CLK_SYS_SPI1: u1,
        CLK_SYS_SRAM0: u1,
        CLK_SYS_SRAM1: u1,
        CLK_SYS_SRAM2: u1,
        CLK_SYS_SRAM3: u1,
    }),
    /// indicates the state of the clock enable
    /// offset: 0xb4
    ENABLED1: mmio.Mmio(packed struct(u32) {
        CLK_SYS_SRAM4: u1,
        CLK_SYS_SRAM5: u1,
        CLK_SYS_SYSCFG: u1,
        CLK_SYS_SYSINFO: u1,
        CLK_SYS_TBMAN: u1,
        CLK_SYS_TIMER: u1,
        CLK_PERI_UART0: u1,
        CLK_SYS_UART0: u1,
        CLK_PERI_UART1: u1,
        CLK_SYS_UART1: u1,
        CLK_SYS_USBCTRL: u1,
        CLK_USB_USBCTRL: u1,
        CLK_SYS_WATCHDOG: u1,
        CLK_SYS_XIP: u1,
        CLK_SYS_XOSC: u1,
        padding: u17 = 0,
    }),
    /// Raw Interrupts
    /// offset: 0xb8
    INTR: mmio.Mmio(packed struct(u32) {
        CLK_SYS_RESUS: u1,
        padding: u31 = 0,
    }),
    /// Interrupt Enable
    /// offset: 0xbc
    INTE: mmio.Mmio(packed struct(u32) {
        CLK_SYS_RESUS: u1,
        padding: u31 = 0,
    }),
    /// Interrupt Force
    /// offset: 0xc0
    INTF: mmio.Mmio(packed struct(u32) {
        CLK_SYS_RESUS: u1,
        padding: u31 = 0,
    }),
    /// Interrupt status after masking & forcing
    /// offset: 0xc4
    INTS: mmio.Mmio(packed struct(u32) {
        CLK_SYS_RESUS: u1,
        padding: u31 = 0,
    }),
};
