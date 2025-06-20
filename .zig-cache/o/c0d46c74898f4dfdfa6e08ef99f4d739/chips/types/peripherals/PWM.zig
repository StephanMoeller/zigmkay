const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Simple PWM
pub const PWM = extern struct {
    /// Control and status register
    /// offset: 0x00
    CH0_CSR: mmio.Mmio(packed struct(u32) {
        /// Enable the PWM channel.
        EN: u1,
        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        PH_CORRECT: u1,
        /// Invert output A
        A_INV: u1,
        /// Invert output B
        B_INV: u1,
        DIVMODE: enum(u2) {
            /// Free-running counting at rate dictated by fractional divider
            div = 0x0,
            /// Fractional divider operation is gated by the PWM B pin.
            level = 0x1,
            /// Counter advances with each rising edge of the PWM B pin.
            rise = 0x2,
            /// Counter advances with each falling edge of the PWM B pin.
            fall = 0x3,
        },
        /// Retard the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running.
        PH_RET: u1,
        /// Advance the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running at less than full speed (div_int + div_frac / 16 > 1)
        PH_ADV: u1,
        padding: u24 = 0,
    }),
    /// INT and FRAC form a fixed-point fractional number. Counting rate is system clock frequency divided by this number. Fractional division uses simple 1st-order sigma-delta.
    /// offset: 0x04
    CH0_DIV: mmio.Mmio(packed struct(u32) {
        FRAC: u4,
        INT: u8,
        padding: u20 = 0,
    }),
    /// Direct access to the PWM counter
    /// offset: 0x08
    CH0_CTR: mmio.Mmio(packed struct(u32) {
        CH0_CTR: u16,
        padding: u16 = 0,
    }),
    /// Counter compare values
    /// offset: 0x0c
    CH0_CC: mmio.Mmio(packed struct(u32) {
        A: u16,
        B: u16,
    }),
    /// Counter wrap value
    /// offset: 0x10
    CH0_TOP: mmio.Mmio(packed struct(u32) {
        CH0_TOP: u16,
        padding: u16 = 0,
    }),
    /// Control and status register
    /// offset: 0x14
    CH1_CSR: mmio.Mmio(packed struct(u32) {
        /// Enable the PWM channel.
        EN: u1,
        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        PH_CORRECT: u1,
        /// Invert output A
        A_INV: u1,
        /// Invert output B
        B_INV: u1,
        DIVMODE: enum(u2) {
            /// Free-running counting at rate dictated by fractional divider
            div = 0x0,
            /// Fractional divider operation is gated by the PWM B pin.
            level = 0x1,
            /// Counter advances with each rising edge of the PWM B pin.
            rise = 0x2,
            /// Counter advances with each falling edge of the PWM B pin.
            fall = 0x3,
        },
        /// Retard the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running.
        PH_RET: u1,
        /// Advance the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running at less than full speed (div_int + div_frac / 16 > 1)
        PH_ADV: u1,
        padding: u24 = 0,
    }),
    /// INT and FRAC form a fixed-point fractional number. Counting rate is system clock frequency divided by this number. Fractional division uses simple 1st-order sigma-delta.
    /// offset: 0x18
    CH1_DIV: mmio.Mmio(packed struct(u32) {
        FRAC: u4,
        INT: u8,
        padding: u20 = 0,
    }),
    /// Direct access to the PWM counter
    /// offset: 0x1c
    CH1_CTR: mmio.Mmio(packed struct(u32) {
        CH1_CTR: u16,
        padding: u16 = 0,
    }),
    /// Counter compare values
    /// offset: 0x20
    CH1_CC: mmio.Mmio(packed struct(u32) {
        A: u16,
        B: u16,
    }),
    /// Counter wrap value
    /// offset: 0x24
    CH1_TOP: mmio.Mmio(packed struct(u32) {
        CH1_TOP: u16,
        padding: u16 = 0,
    }),
    /// Control and status register
    /// offset: 0x28
    CH2_CSR: mmio.Mmio(packed struct(u32) {
        /// Enable the PWM channel.
        EN: u1,
        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        PH_CORRECT: u1,
        /// Invert output A
        A_INV: u1,
        /// Invert output B
        B_INV: u1,
        DIVMODE: enum(u2) {
            /// Free-running counting at rate dictated by fractional divider
            div = 0x0,
            /// Fractional divider operation is gated by the PWM B pin.
            level = 0x1,
            /// Counter advances with each rising edge of the PWM B pin.
            rise = 0x2,
            /// Counter advances with each falling edge of the PWM B pin.
            fall = 0x3,
        },
        /// Retard the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running.
        PH_RET: u1,
        /// Advance the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running at less than full speed (div_int + div_frac / 16 > 1)
        PH_ADV: u1,
        padding: u24 = 0,
    }),
    /// INT and FRAC form a fixed-point fractional number. Counting rate is system clock frequency divided by this number. Fractional division uses simple 1st-order sigma-delta.
    /// offset: 0x2c
    CH2_DIV: mmio.Mmio(packed struct(u32) {
        FRAC: u4,
        INT: u8,
        padding: u20 = 0,
    }),
    /// Direct access to the PWM counter
    /// offset: 0x30
    CH2_CTR: mmio.Mmio(packed struct(u32) {
        CH2_CTR: u16,
        padding: u16 = 0,
    }),
    /// Counter compare values
    /// offset: 0x34
    CH2_CC: mmio.Mmio(packed struct(u32) {
        A: u16,
        B: u16,
    }),
    /// Counter wrap value
    /// offset: 0x38
    CH2_TOP: mmio.Mmio(packed struct(u32) {
        CH2_TOP: u16,
        padding: u16 = 0,
    }),
    /// Control and status register
    /// offset: 0x3c
    CH3_CSR: mmio.Mmio(packed struct(u32) {
        /// Enable the PWM channel.
        EN: u1,
        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        PH_CORRECT: u1,
        /// Invert output A
        A_INV: u1,
        /// Invert output B
        B_INV: u1,
        DIVMODE: enum(u2) {
            /// Free-running counting at rate dictated by fractional divider
            div = 0x0,
            /// Fractional divider operation is gated by the PWM B pin.
            level = 0x1,
            /// Counter advances with each rising edge of the PWM B pin.
            rise = 0x2,
            /// Counter advances with each falling edge of the PWM B pin.
            fall = 0x3,
        },
        /// Retard the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running.
        PH_RET: u1,
        /// Advance the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running at less than full speed (div_int + div_frac / 16 > 1)
        PH_ADV: u1,
        padding: u24 = 0,
    }),
    /// INT and FRAC form a fixed-point fractional number. Counting rate is system clock frequency divided by this number. Fractional division uses simple 1st-order sigma-delta.
    /// offset: 0x40
    CH3_DIV: mmio.Mmio(packed struct(u32) {
        FRAC: u4,
        INT: u8,
        padding: u20 = 0,
    }),
    /// Direct access to the PWM counter
    /// offset: 0x44
    CH3_CTR: mmio.Mmio(packed struct(u32) {
        CH3_CTR: u16,
        padding: u16 = 0,
    }),
    /// Counter compare values
    /// offset: 0x48
    CH3_CC: mmio.Mmio(packed struct(u32) {
        A: u16,
        B: u16,
    }),
    /// Counter wrap value
    /// offset: 0x4c
    CH3_TOP: mmio.Mmio(packed struct(u32) {
        CH3_TOP: u16,
        padding: u16 = 0,
    }),
    /// Control and status register
    /// offset: 0x50
    CH4_CSR: mmio.Mmio(packed struct(u32) {
        /// Enable the PWM channel.
        EN: u1,
        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        PH_CORRECT: u1,
        /// Invert output A
        A_INV: u1,
        /// Invert output B
        B_INV: u1,
        DIVMODE: enum(u2) {
            /// Free-running counting at rate dictated by fractional divider
            div = 0x0,
            /// Fractional divider operation is gated by the PWM B pin.
            level = 0x1,
            /// Counter advances with each rising edge of the PWM B pin.
            rise = 0x2,
            /// Counter advances with each falling edge of the PWM B pin.
            fall = 0x3,
        },
        /// Retard the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running.
        PH_RET: u1,
        /// Advance the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running at less than full speed (div_int + div_frac / 16 > 1)
        PH_ADV: u1,
        padding: u24 = 0,
    }),
    /// INT and FRAC form a fixed-point fractional number. Counting rate is system clock frequency divided by this number. Fractional division uses simple 1st-order sigma-delta.
    /// offset: 0x54
    CH4_DIV: mmio.Mmio(packed struct(u32) {
        FRAC: u4,
        INT: u8,
        padding: u20 = 0,
    }),
    /// Direct access to the PWM counter
    /// offset: 0x58
    CH4_CTR: mmio.Mmio(packed struct(u32) {
        CH4_CTR: u16,
        padding: u16 = 0,
    }),
    /// Counter compare values
    /// offset: 0x5c
    CH4_CC: mmio.Mmio(packed struct(u32) {
        A: u16,
        B: u16,
    }),
    /// Counter wrap value
    /// offset: 0x60
    CH4_TOP: mmio.Mmio(packed struct(u32) {
        CH4_TOP: u16,
        padding: u16 = 0,
    }),
    /// Control and status register
    /// offset: 0x64
    CH5_CSR: mmio.Mmio(packed struct(u32) {
        /// Enable the PWM channel.
        EN: u1,
        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        PH_CORRECT: u1,
        /// Invert output A
        A_INV: u1,
        /// Invert output B
        B_INV: u1,
        DIVMODE: enum(u2) {
            /// Free-running counting at rate dictated by fractional divider
            div = 0x0,
            /// Fractional divider operation is gated by the PWM B pin.
            level = 0x1,
            /// Counter advances with each rising edge of the PWM B pin.
            rise = 0x2,
            /// Counter advances with each falling edge of the PWM B pin.
            fall = 0x3,
        },
        /// Retard the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running.
        PH_RET: u1,
        /// Advance the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running at less than full speed (div_int + div_frac / 16 > 1)
        PH_ADV: u1,
        padding: u24 = 0,
    }),
    /// INT and FRAC form a fixed-point fractional number. Counting rate is system clock frequency divided by this number. Fractional division uses simple 1st-order sigma-delta.
    /// offset: 0x68
    CH5_DIV: mmio.Mmio(packed struct(u32) {
        FRAC: u4,
        INT: u8,
        padding: u20 = 0,
    }),
    /// Direct access to the PWM counter
    /// offset: 0x6c
    CH5_CTR: mmio.Mmio(packed struct(u32) {
        CH5_CTR: u16,
        padding: u16 = 0,
    }),
    /// Counter compare values
    /// offset: 0x70
    CH5_CC: mmio.Mmio(packed struct(u32) {
        A: u16,
        B: u16,
    }),
    /// Counter wrap value
    /// offset: 0x74
    CH5_TOP: mmio.Mmio(packed struct(u32) {
        CH5_TOP: u16,
        padding: u16 = 0,
    }),
    /// Control and status register
    /// offset: 0x78
    CH6_CSR: mmio.Mmio(packed struct(u32) {
        /// Enable the PWM channel.
        EN: u1,
        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        PH_CORRECT: u1,
        /// Invert output A
        A_INV: u1,
        /// Invert output B
        B_INV: u1,
        DIVMODE: enum(u2) {
            /// Free-running counting at rate dictated by fractional divider
            div = 0x0,
            /// Fractional divider operation is gated by the PWM B pin.
            level = 0x1,
            /// Counter advances with each rising edge of the PWM B pin.
            rise = 0x2,
            /// Counter advances with each falling edge of the PWM B pin.
            fall = 0x3,
        },
        /// Retard the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running.
        PH_RET: u1,
        /// Advance the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running at less than full speed (div_int + div_frac / 16 > 1)
        PH_ADV: u1,
        padding: u24 = 0,
    }),
    /// INT and FRAC form a fixed-point fractional number. Counting rate is system clock frequency divided by this number. Fractional division uses simple 1st-order sigma-delta.
    /// offset: 0x7c
    CH6_DIV: mmio.Mmio(packed struct(u32) {
        FRAC: u4,
        INT: u8,
        padding: u20 = 0,
    }),
    /// Direct access to the PWM counter
    /// offset: 0x80
    CH6_CTR: mmio.Mmio(packed struct(u32) {
        CH6_CTR: u16,
        padding: u16 = 0,
    }),
    /// Counter compare values
    /// offset: 0x84
    CH6_CC: mmio.Mmio(packed struct(u32) {
        A: u16,
        B: u16,
    }),
    /// Counter wrap value
    /// offset: 0x88
    CH6_TOP: mmio.Mmio(packed struct(u32) {
        CH6_TOP: u16,
        padding: u16 = 0,
    }),
    /// Control and status register
    /// offset: 0x8c
    CH7_CSR: mmio.Mmio(packed struct(u32) {
        /// Enable the PWM channel.
        EN: u1,
        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        PH_CORRECT: u1,
        /// Invert output A
        A_INV: u1,
        /// Invert output B
        B_INV: u1,
        DIVMODE: enum(u2) {
            /// Free-running counting at rate dictated by fractional divider
            div = 0x0,
            /// Fractional divider operation is gated by the PWM B pin.
            level = 0x1,
            /// Counter advances with each rising edge of the PWM B pin.
            rise = 0x2,
            /// Counter advances with each falling edge of the PWM B pin.
            fall = 0x3,
        },
        /// Retard the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running.
        PH_RET: u1,
        /// Advance the phase of the counter by 1 count, while it is running. Self-clearing. Write a 1, and poll until low. Counter must be running at less than full speed (div_int + div_frac / 16 > 1)
        PH_ADV: u1,
        padding: u24 = 0,
    }),
    /// INT and FRAC form a fixed-point fractional number. Counting rate is system clock frequency divided by this number. Fractional division uses simple 1st-order sigma-delta.
    /// offset: 0x90
    CH7_DIV: mmio.Mmio(packed struct(u32) {
        FRAC: u4,
        INT: u8,
        padding: u20 = 0,
    }),
    /// Direct access to the PWM counter
    /// offset: 0x94
    CH7_CTR: mmio.Mmio(packed struct(u32) {
        CH7_CTR: u16,
        padding: u16 = 0,
    }),
    /// Counter compare values
    /// offset: 0x98
    CH7_CC: mmio.Mmio(packed struct(u32) {
        A: u16,
        B: u16,
    }),
    /// Counter wrap value
    /// offset: 0x9c
    CH7_TOP: mmio.Mmio(packed struct(u32) {
        CH7_TOP: u16,
        padding: u16 = 0,
    }),
    /// This register aliases the CSR_EN bits for all channels. Writing to this register allows multiple channels to be enabled or disabled simultaneously, so they can run in perfect sync. For each channel, there is only one physical EN register bit, which can be accessed through here or CHx_CSR.
    /// offset: 0xa0
    EN: mmio.Mmio(packed struct(u32) {
        CH0: u1,
        CH1: u1,
        CH2: u1,
        CH3: u1,
        CH4: u1,
        CH5: u1,
        CH6: u1,
        CH7: u1,
        padding: u24 = 0,
    }),
    /// Raw Interrupts
    /// offset: 0xa4
    INTR: mmio.Mmio(packed struct(u32) {
        CH0: u1,
        CH1: u1,
        CH2: u1,
        CH3: u1,
        CH4: u1,
        CH5: u1,
        CH6: u1,
        CH7: u1,
        padding: u24 = 0,
    }),
    /// Interrupt Enable
    /// offset: 0xa8
    INTE: mmio.Mmio(packed struct(u32) {
        CH0: u1,
        CH1: u1,
        CH2: u1,
        CH3: u1,
        CH4: u1,
        CH5: u1,
        CH6: u1,
        CH7: u1,
        padding: u24 = 0,
    }),
    /// Interrupt Force
    /// offset: 0xac
    INTF: mmio.Mmio(packed struct(u32) {
        CH0: u1,
        CH1: u1,
        CH2: u1,
        CH3: u1,
        CH4: u1,
        CH5: u1,
        CH6: u1,
        CH7: u1,
        padding: u24 = 0,
    }),
    /// Interrupt status after masking & forcing
    /// offset: 0xb0
    INTS: mmio.Mmio(packed struct(u32) {
        CH0: u1,
        CH1: u1,
        CH2: u1,
        CH3: u1,
        CH4: u1,
        CH5: u1,
        CH6: u1,
        CH7: u1,
        padding: u24 = 0,
    }),
};
