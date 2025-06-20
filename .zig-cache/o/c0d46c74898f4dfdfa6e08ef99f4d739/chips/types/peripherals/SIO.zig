const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Single-cycle IO block Provides core-local and inter-core hardware for the two processors, with single-cycle access.
pub const SIO = extern struct {
    /// Processor core identifier
    /// offset: 0x00
    CPUID: mmio.Mmio(packed struct(u32) {
        /// Value is 0 when read from processor core 0, and 1 when read from processor core 1.
        CPUID: u32,
    }),
    /// Input value for GPIO pins
    /// offset: 0x04
    GPIO_IN: mmio.Mmio(packed struct(u32) {
        /// Input value for GPIO0...29
        GPIO_IN: u30,
        padding: u2 = 0,
    }),
    /// Input value for QSPI pins
    /// offset: 0x08
    GPIO_HI_IN: mmio.Mmio(packed struct(u32) {
        /// Input value on QSPI IO in order 0..5: SCLK, SSn, SD0, SD1, SD2, SD3
        GPIO_HI_IN: u6,
        padding: u26 = 0,
    }),
    /// offset: 0x0c
    reserved12: [4]u8,
    /// GPIO output value
    /// offset: 0x10
    GPIO_OUT: mmio.Mmio(packed struct(u32) {
        /// Set output level (1/0 -> high/low) for GPIO0...29. Reading back gives the last value written, NOT the input value from the pins. If core 0 and core 1 both write to GPIO_OUT simultaneously (or to a SET/CLR/XOR alias), the result is as though the write from core 0 took place first, and the write from core 1 was then applied to that intermediate result.
        GPIO_OUT: u30,
        padding: u2 = 0,
    }),
    /// GPIO output value set
    /// offset: 0x14
    GPIO_OUT_SET: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bit-set on GPIO_OUT, i.e. `GPIO_OUT |= wdata`
        GPIO_OUT_SET: u30,
        padding: u2 = 0,
    }),
    /// GPIO output value clear
    /// offset: 0x18
    GPIO_OUT_CLR: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bit-clear on GPIO_OUT, i.e. `GPIO_OUT &= ~wdata`
        GPIO_OUT_CLR: u30,
        padding: u2 = 0,
    }),
    /// GPIO output value XOR
    /// offset: 0x1c
    GPIO_OUT_XOR: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bitwise XOR on GPIO_OUT, i.e. `GPIO_OUT ^= wdata`
        GPIO_OUT_XOR: u30,
        padding: u2 = 0,
    }),
    /// GPIO output enable
    /// offset: 0x20
    GPIO_OE: mmio.Mmio(packed struct(u32) {
        /// Set output enable (1/0 -> output/input) for GPIO0...29. Reading back gives the last value written. If core 0 and core 1 both write to GPIO_OE simultaneously (or to a SET/CLR/XOR alias), the result is as though the write from core 0 took place first, and the write from core 1 was then applied to that intermediate result.
        GPIO_OE: u30,
        padding: u2 = 0,
    }),
    /// GPIO output enable set
    /// offset: 0x24
    GPIO_OE_SET: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bit-set on GPIO_OE, i.e. `GPIO_OE |= wdata`
        GPIO_OE_SET: u30,
        padding: u2 = 0,
    }),
    /// GPIO output enable clear
    /// offset: 0x28
    GPIO_OE_CLR: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bit-clear on GPIO_OE, i.e. `GPIO_OE &= ~wdata`
        GPIO_OE_CLR: u30,
        padding: u2 = 0,
    }),
    /// GPIO output enable XOR
    /// offset: 0x2c
    GPIO_OE_XOR: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bitwise XOR on GPIO_OE, i.e. `GPIO_OE ^= wdata`
        GPIO_OE_XOR: u30,
        padding: u2 = 0,
    }),
    /// QSPI output value
    /// offset: 0x30
    GPIO_HI_OUT: mmio.Mmio(packed struct(u32) {
        /// Set output level (1/0 -> high/low) for QSPI IO0...5. Reading back gives the last value written, NOT the input value from the pins. If core 0 and core 1 both write to GPIO_HI_OUT simultaneously (or to a SET/CLR/XOR alias), the result is as though the write from core 0 took place first, and the write from core 1 was then applied to that intermediate result.
        GPIO_HI_OUT: u6,
        padding: u26 = 0,
    }),
    /// QSPI output value set
    /// offset: 0x34
    GPIO_HI_OUT_SET: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bit-set on GPIO_HI_OUT, i.e. `GPIO_HI_OUT |= wdata`
        GPIO_HI_OUT_SET: u6,
        padding: u26 = 0,
    }),
    /// QSPI output value clear
    /// offset: 0x38
    GPIO_HI_OUT_CLR: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bit-clear on GPIO_HI_OUT, i.e. `GPIO_HI_OUT &= ~wdata`
        GPIO_HI_OUT_CLR: u6,
        padding: u26 = 0,
    }),
    /// QSPI output value XOR
    /// offset: 0x3c
    GPIO_HI_OUT_XOR: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bitwise XOR on GPIO_HI_OUT, i.e. `GPIO_HI_OUT ^= wdata`
        GPIO_HI_OUT_XOR: u6,
        padding: u26 = 0,
    }),
    /// QSPI output enable
    /// offset: 0x40
    GPIO_HI_OE: mmio.Mmio(packed struct(u32) {
        /// Set output enable (1/0 -> output/input) for QSPI IO0...5. Reading back gives the last value written. If core 0 and core 1 both write to GPIO_HI_OE simultaneously (or to a SET/CLR/XOR alias), the result is as though the write from core 0 took place first, and the write from core 1 was then applied to that intermediate result.
        GPIO_HI_OE: u6,
        padding: u26 = 0,
    }),
    /// QSPI output enable set
    /// offset: 0x44
    GPIO_HI_OE_SET: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bit-set on GPIO_HI_OE, i.e. `GPIO_HI_OE |= wdata`
        GPIO_HI_OE_SET: u6,
        padding: u26 = 0,
    }),
    /// QSPI output enable clear
    /// offset: 0x48
    GPIO_HI_OE_CLR: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bit-clear on GPIO_HI_OE, i.e. `GPIO_HI_OE &= ~wdata`
        GPIO_HI_OE_CLR: u6,
        padding: u26 = 0,
    }),
    /// QSPI output enable XOR
    /// offset: 0x4c
    GPIO_HI_OE_XOR: mmio.Mmio(packed struct(u32) {
        /// Perform an atomic bitwise XOR on GPIO_HI_OE, i.e. `GPIO_HI_OE ^= wdata`
        GPIO_HI_OE_XOR: u6,
        padding: u26 = 0,
    }),
    /// Status register for inter-core FIFOs (mailboxes). There is one FIFO in the core 0 -> core 1 direction, and one core 1 -> core 0. Both are 32 bits wide and 8 words deep. Core 0 can see the read side of the 1->0 FIFO (RX), and the write side of 0->1 FIFO (TX). Core 1 can see the read side of the 0->1 FIFO (RX), and the write side of 1->0 FIFO (TX). The SIO IRQ for each core is the logical OR of the VLD, WOF and ROE fields of its FIFO_ST register.
    /// offset: 0x50
    FIFO_ST: mmio.Mmio(packed struct(u32) {
        /// Value is 1 if this core's RX FIFO is not empty (i.e. if FIFO_RD is valid)
        VLD: u1,
        /// Value is 1 if this core's TX FIFO is not full (i.e. if FIFO_WR is ready for more data)
        RDY: u1,
        /// Sticky flag indicating the TX FIFO was written when full. This write was ignored by the FIFO.
        WOF: u1,
        /// Sticky flag indicating the RX FIFO was read when empty. This read was ignored by the FIFO.
        ROE: u1,
        padding: u28 = 0,
    }),
    /// Write access to this core's TX FIFO
    /// offset: 0x54
    FIFO_WR: mmio.Mmio(packed struct(u32) {
        FIFO_WR: u32,
    }),
    /// Read access to this core's RX FIFO
    /// offset: 0x58
    FIFO_RD: mmio.Mmio(packed struct(u32) {
        FIFO_RD: u32,
    }),
    /// Spinlock state A bitmap containing the state of all 32 spinlocks (1=locked). Mainly intended for debugging.
    /// offset: 0x5c
    SPINLOCK_ST: mmio.Mmio(packed struct(u32) {
        SPINLOCK_ST: u32,
    }),
    /// Divider unsigned dividend Write to the DIVIDEND operand of the divider, i.e. the p in `p / q`. Any operand write starts a new calculation. The results appear in QUOTIENT, REMAINDER. UDIVIDEND/SDIVIDEND are aliases of the same internal register. The U alias starts an unsigned calculation, and the S alias starts a signed calculation.
    /// offset: 0x60
    DIV_UDIVIDEND: mmio.Mmio(packed struct(u32) {
        DIV_UDIVIDEND: u32,
    }),
    /// Divider unsigned divisor Write to the DIVISOR operand of the divider, i.e. the q in `p / q`. Any operand write starts a new calculation. The results appear in QUOTIENT, REMAINDER. UDIVISOR/SDIVISOR are aliases of the same internal register. The U alias starts an unsigned calculation, and the S alias starts a signed calculation.
    /// offset: 0x64
    DIV_UDIVISOR: mmio.Mmio(packed struct(u32) {
        DIV_UDIVISOR: u32,
    }),
    /// Divider signed dividend The same as UDIVIDEND, but starts a signed calculation, rather than unsigned.
    /// offset: 0x68
    DIV_SDIVIDEND: mmio.Mmio(packed struct(u32) {
        DIV_SDIVIDEND: u32,
    }),
    /// Divider signed divisor The same as UDIVISOR, but starts a signed calculation, rather than unsigned.
    /// offset: 0x6c
    DIV_SDIVISOR: mmio.Mmio(packed struct(u32) {
        DIV_SDIVISOR: u32,
    }),
    /// Divider result quotient The result of `DIVIDEND / DIVISOR` (division). Contents undefined while CSR_READY is low. For signed calculations, QUOTIENT is negative when the signs of DIVIDEND and DIVISOR differ. This register can be written to directly, for context save/restore purposes. This halts any in-progress calculation and sets the CSR_READY and CSR_DIRTY flags. Reading from QUOTIENT clears the CSR_DIRTY flag, so should read results in the order REMAINDER, QUOTIENT if CSR_DIRTY is used.
    /// offset: 0x70
    DIV_QUOTIENT: mmio.Mmio(packed struct(u32) {
        DIV_QUOTIENT: u32,
    }),
    /// Divider result remainder The result of `DIVIDEND % DIVISOR` (modulo). Contents undefined while CSR_READY is low. For signed calculations, REMAINDER is negative only when DIVIDEND is negative. This register can be written to directly, for context save/restore purposes. This halts any in-progress calculation and sets the CSR_READY and CSR_DIRTY flags.
    /// offset: 0x74
    DIV_REMAINDER: mmio.Mmio(packed struct(u32) {
        DIV_REMAINDER: u32,
    }),
    /// Control and status register for divider.
    /// offset: 0x78
    DIV_CSR: mmio.Mmio(packed struct(u32) {
        /// Reads as 0 when a calculation is in progress, 1 otherwise. Writing an operand (xDIVIDEND, xDIVISOR) will immediately start a new calculation, no matter if one is already in progress. Writing to a result register will immediately terminate any in-progress calculation and set the READY and DIRTY flags.
        READY: u1,
        /// Changes to 1 when any register is written, and back to 0 when QUOTIENT is read. Software can use this flag to make save/restore more efficient (skip if not DIRTY). If the flag is used in this way, it's recommended to either read QUOTIENT only, or REMAINDER and then QUOTIENT, to prevent data loss on context switch.
        DIRTY: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x7c
    reserved124: [4]u8,
    /// Read/write access to accumulator 0
    /// offset: 0x80
    INTERP0_ACCUM0: mmio.Mmio(packed struct(u32) {
        INTERP0_ACCUM0: u32,
    }),
    /// Read/write access to accumulator 1
    /// offset: 0x84
    INTERP0_ACCUM1: mmio.Mmio(packed struct(u32) {
        INTERP0_ACCUM1: u32,
    }),
    /// Read/write access to BASE0 register.
    /// offset: 0x88
    INTERP0_BASE0: mmio.Mmio(packed struct(u32) {
        INTERP0_BASE0: u32,
    }),
    /// Read/write access to BASE1 register.
    /// offset: 0x8c
    INTERP0_BASE1: mmio.Mmio(packed struct(u32) {
        INTERP0_BASE1: u32,
    }),
    /// Read/write access to BASE2 register.
    /// offset: 0x90
    INTERP0_BASE2: mmio.Mmio(packed struct(u32) {
        INTERP0_BASE2: u32,
    }),
    /// Read LANE0 result, and simultaneously write lane results to both accumulators (POP).
    /// offset: 0x94
    INTERP0_POP_LANE0: mmio.Mmio(packed struct(u32) {
        INTERP0_POP_LANE0: u32,
    }),
    /// Read LANE1 result, and simultaneously write lane results to both accumulators (POP).
    /// offset: 0x98
    INTERP0_POP_LANE1: mmio.Mmio(packed struct(u32) {
        INTERP0_POP_LANE1: u32,
    }),
    /// Read FULL result, and simultaneously write lane results to both accumulators (POP).
    /// offset: 0x9c
    INTERP0_POP_FULL: mmio.Mmio(packed struct(u32) {
        INTERP0_POP_FULL: u32,
    }),
    /// Read LANE0 result, without altering any internal state (PEEK).
    /// offset: 0xa0
    INTERP0_PEEK_LANE0: mmio.Mmio(packed struct(u32) {
        INTERP0_PEEK_LANE0: u32,
    }),
    /// Read LANE1 result, without altering any internal state (PEEK).
    /// offset: 0xa4
    INTERP0_PEEK_LANE1: mmio.Mmio(packed struct(u32) {
        INTERP0_PEEK_LANE1: u32,
    }),
    /// Read FULL result, without altering any internal state (PEEK).
    /// offset: 0xa8
    INTERP0_PEEK_FULL: mmio.Mmio(packed struct(u32) {
        INTERP0_PEEK_FULL: u32,
    }),
    /// Control register for lane 0
    /// offset: 0xac
    INTERP0_CTRL_LANE0: mmio.Mmio(packed struct(u32) {
        /// Logical right-shift applied to accumulator before masking
        SHIFT: u5,
        /// The least-significant bit allowed to pass by the mask (inclusive)
        MASK_LSB: u5,
        /// The most-significant bit allowed to pass by the mask (inclusive) Setting MSB < LSB may cause chip to turn inside-out
        MASK_MSB: u5,
        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits before adding to BASE0, and LANE0 PEEK/POP appear extended to 32 bits when read by processor.
        SIGNED: u1,
        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware. Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        CROSS_INPUT: u1,
        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        CROSS_RESULT: u1,
        /// If 1, mask + shift is bypassed for LANE0 result. This does not affect FULL result.
        ADD_RAW: u1,
        /// ORed into bits 29:28 of the lane result presented to the processor on the bus. No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence of pointers into flash or SRAM.
        FORCE_MSB: u2,
        /// Only present on INTERP0 on each core. If BLEND mode is enabled: - LANE1 result is a linear interpolation between BASE0 and BASE1, controlled by the 8 LSBs of lane 1 shift and mask value (a fractional number between 0 and 255/256ths) - LANE0 result does not have BASE0 added (yields only the 8 LSBs of lane 1 shift+mask value) - FULL result does not have lane 1 shift+mask value added (BASE2 + lane 0 shift+mask) LANE1 SIGNED flag controls whether the interpolation is signed or unsigned.
        BLEND: u1,
        reserved23: u1 = 0,
        /// Indicates if any masked-off MSBs in ACCUM0 are set.
        OVERF0: u1,
        /// Indicates if any masked-off MSBs in ACCUM1 are set.
        OVERF1: u1,
        /// Set if either OVERF0 or OVERF1 is set.
        OVERF: u1,
        padding: u6 = 0,
    }),
    /// Control register for lane 1
    /// offset: 0xb0
    INTERP0_CTRL_LANE1: mmio.Mmio(packed struct(u32) {
        /// Logical right-shift applied to accumulator before masking
        SHIFT: u5,
        /// The least-significant bit allowed to pass by the mask (inclusive)
        MASK_LSB: u5,
        /// The most-significant bit allowed to pass by the mask (inclusive) Setting MSB < LSB may cause chip to turn inside-out
        MASK_MSB: u5,
        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits before adding to BASE1, and LANE1 PEEK/POP appear extended to 32 bits when read by processor.
        SIGNED: u1,
        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware. Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        CROSS_INPUT: u1,
        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        CROSS_RESULT: u1,
        /// If 1, mask + shift is bypassed for LANE1 result. This does not affect FULL result.
        ADD_RAW: u1,
        /// ORed into bits 29:28 of the lane result presented to the processor on the bus. No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence of pointers into flash or SRAM.
        FORCE_MSB: u2,
        padding: u11 = 0,
    }),
    /// Values written here are atomically added to ACCUM0 Reading yields lane 0's raw shift and mask value (BASE0 not added).
    /// offset: 0xb4
    INTERP0_ACCUM0_ADD: mmio.Mmio(packed struct(u32) {
        INTERP0_ACCUM0_ADD: u24,
        padding: u8 = 0,
    }),
    /// Values written here are atomically added to ACCUM1 Reading yields lane 1's raw shift and mask value (BASE1 not added).
    /// offset: 0xb8
    INTERP0_ACCUM1_ADD: mmio.Mmio(packed struct(u32) {
        INTERP0_ACCUM1_ADD: u24,
        padding: u8 = 0,
    }),
    /// On write, the lower 16 bits go to BASE0, upper bits to BASE1 simultaneously. Each half is sign-extended to 32 bits if that lane's SIGNED flag is set.
    /// offset: 0xbc
    INTERP0_BASE_1AND0: mmio.Mmio(packed struct(u32) {
        INTERP0_BASE_1AND0: u32,
    }),
    /// Read/write access to accumulator 0
    /// offset: 0xc0
    INTERP1_ACCUM0: mmio.Mmio(packed struct(u32) {
        INTERP1_ACCUM0: u32,
    }),
    /// Read/write access to accumulator 1
    /// offset: 0xc4
    INTERP1_ACCUM1: mmio.Mmio(packed struct(u32) {
        INTERP1_ACCUM1: u32,
    }),
    /// Read/write access to BASE0 register.
    /// offset: 0xc8
    INTERP1_BASE0: mmio.Mmio(packed struct(u32) {
        INTERP1_BASE0: u32,
    }),
    /// Read/write access to BASE1 register.
    /// offset: 0xcc
    INTERP1_BASE1: mmio.Mmio(packed struct(u32) {
        INTERP1_BASE1: u32,
    }),
    /// Read/write access to BASE2 register.
    /// offset: 0xd0
    INTERP1_BASE2: mmio.Mmio(packed struct(u32) {
        INTERP1_BASE2: u32,
    }),
    /// Read LANE0 result, and simultaneously write lane results to both accumulators (POP).
    /// offset: 0xd4
    INTERP1_POP_LANE0: mmio.Mmio(packed struct(u32) {
        INTERP1_POP_LANE0: u32,
    }),
    /// Read LANE1 result, and simultaneously write lane results to both accumulators (POP).
    /// offset: 0xd8
    INTERP1_POP_LANE1: mmio.Mmio(packed struct(u32) {
        INTERP1_POP_LANE1: u32,
    }),
    /// Read FULL result, and simultaneously write lane results to both accumulators (POP).
    /// offset: 0xdc
    INTERP1_POP_FULL: mmio.Mmio(packed struct(u32) {
        INTERP1_POP_FULL: u32,
    }),
    /// Read LANE0 result, without altering any internal state (PEEK).
    /// offset: 0xe0
    INTERP1_PEEK_LANE0: mmio.Mmio(packed struct(u32) {
        INTERP1_PEEK_LANE0: u32,
    }),
    /// Read LANE1 result, without altering any internal state (PEEK).
    /// offset: 0xe4
    INTERP1_PEEK_LANE1: mmio.Mmio(packed struct(u32) {
        INTERP1_PEEK_LANE1: u32,
    }),
    /// Read FULL result, without altering any internal state (PEEK).
    /// offset: 0xe8
    INTERP1_PEEK_FULL: mmio.Mmio(packed struct(u32) {
        INTERP1_PEEK_FULL: u32,
    }),
    /// Control register for lane 0
    /// offset: 0xec
    INTERP1_CTRL_LANE0: mmio.Mmio(packed struct(u32) {
        /// Logical right-shift applied to accumulator before masking
        SHIFT: u5,
        /// The least-significant bit allowed to pass by the mask (inclusive)
        MASK_LSB: u5,
        /// The most-significant bit allowed to pass by the mask (inclusive) Setting MSB < LSB may cause chip to turn inside-out
        MASK_MSB: u5,
        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits before adding to BASE0, and LANE0 PEEK/POP appear extended to 32 bits when read by processor.
        SIGNED: u1,
        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware. Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        CROSS_INPUT: u1,
        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        CROSS_RESULT: u1,
        /// If 1, mask + shift is bypassed for LANE0 result. This does not affect FULL result.
        ADD_RAW: u1,
        /// ORed into bits 29:28 of the lane result presented to the processor on the bus. No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence of pointers into flash or SRAM.
        FORCE_MSB: u2,
        reserved22: u1 = 0,
        /// Only present on INTERP1 on each core. If CLAMP mode is enabled: - LANE0 result is shifted and masked ACCUM0, clamped by a lower bound of BASE0 and an upper bound of BASE1. - Signedness of these comparisons is determined by LANE0_CTRL_SIGNED
        CLAMP: u1,
        /// Indicates if any masked-off MSBs in ACCUM0 are set.
        OVERF0: u1,
        /// Indicates if any masked-off MSBs in ACCUM1 are set.
        OVERF1: u1,
        /// Set if either OVERF0 or OVERF1 is set.
        OVERF: u1,
        padding: u6 = 0,
    }),
    /// Control register for lane 1
    /// offset: 0xf0
    INTERP1_CTRL_LANE1: mmio.Mmio(packed struct(u32) {
        /// Logical right-shift applied to accumulator before masking
        SHIFT: u5,
        /// The least-significant bit allowed to pass by the mask (inclusive)
        MASK_LSB: u5,
        /// The most-significant bit allowed to pass by the mask (inclusive) Setting MSB < LSB may cause chip to turn inside-out
        MASK_MSB: u5,
        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits before adding to BASE1, and LANE1 PEEK/POP appear extended to 32 bits when read by processor.
        SIGNED: u1,
        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware. Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        CROSS_INPUT: u1,
        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        CROSS_RESULT: u1,
        /// If 1, mask + shift is bypassed for LANE1 result. This does not affect FULL result.
        ADD_RAW: u1,
        /// ORed into bits 29:28 of the lane result presented to the processor on the bus. No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence of pointers into flash or SRAM.
        FORCE_MSB: u2,
        padding: u11 = 0,
    }),
    /// Values written here are atomically added to ACCUM0 Reading yields lane 0's raw shift and mask value (BASE0 not added).
    /// offset: 0xf4
    INTERP1_ACCUM0_ADD: mmio.Mmio(packed struct(u32) {
        INTERP1_ACCUM0_ADD: u24,
        padding: u8 = 0,
    }),
    /// Values written here are atomically added to ACCUM1 Reading yields lane 1's raw shift and mask value (BASE1 not added).
    /// offset: 0xf8
    INTERP1_ACCUM1_ADD: mmio.Mmio(packed struct(u32) {
        INTERP1_ACCUM1_ADD: u24,
        padding: u8 = 0,
    }),
    /// On write, the lower 16 bits go to BASE0, upper bits to BASE1 simultaneously. Each half is sign-extended to 32 bits if that lane's SIGNED flag is set.
    /// offset: 0xfc
    INTERP1_BASE_1AND0: mmio.Mmio(packed struct(u32) {
        INTERP1_BASE_1AND0: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x100
    SPINLOCK0: mmio.Mmio(packed struct(u32) {
        SPINLOCK0: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x104
    SPINLOCK1: mmio.Mmio(packed struct(u32) {
        SPINLOCK1: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x108
    SPINLOCK2: mmio.Mmio(packed struct(u32) {
        SPINLOCK2: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x10c
    SPINLOCK3: mmio.Mmio(packed struct(u32) {
        SPINLOCK3: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x110
    SPINLOCK4: mmio.Mmio(packed struct(u32) {
        SPINLOCK4: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x114
    SPINLOCK5: mmio.Mmio(packed struct(u32) {
        SPINLOCK5: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x118
    SPINLOCK6: mmio.Mmio(packed struct(u32) {
        SPINLOCK6: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x11c
    SPINLOCK7: mmio.Mmio(packed struct(u32) {
        SPINLOCK7: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x120
    SPINLOCK8: mmio.Mmio(packed struct(u32) {
        SPINLOCK8: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x124
    SPINLOCK9: mmio.Mmio(packed struct(u32) {
        SPINLOCK9: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x128
    SPINLOCK10: mmio.Mmio(packed struct(u32) {
        SPINLOCK10: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x12c
    SPINLOCK11: mmio.Mmio(packed struct(u32) {
        SPINLOCK11: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x130
    SPINLOCK12: mmio.Mmio(packed struct(u32) {
        SPINLOCK12: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x134
    SPINLOCK13: mmio.Mmio(packed struct(u32) {
        SPINLOCK13: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x138
    SPINLOCK14: mmio.Mmio(packed struct(u32) {
        SPINLOCK14: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x13c
    SPINLOCK15: mmio.Mmio(packed struct(u32) {
        SPINLOCK15: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x140
    SPINLOCK16: mmio.Mmio(packed struct(u32) {
        SPINLOCK16: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x144
    SPINLOCK17: mmio.Mmio(packed struct(u32) {
        SPINLOCK17: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x148
    SPINLOCK18: mmio.Mmio(packed struct(u32) {
        SPINLOCK18: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x14c
    SPINLOCK19: mmio.Mmio(packed struct(u32) {
        SPINLOCK19: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x150
    SPINLOCK20: mmio.Mmio(packed struct(u32) {
        SPINLOCK20: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x154
    SPINLOCK21: mmio.Mmio(packed struct(u32) {
        SPINLOCK21: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x158
    SPINLOCK22: mmio.Mmio(packed struct(u32) {
        SPINLOCK22: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x15c
    SPINLOCK23: mmio.Mmio(packed struct(u32) {
        SPINLOCK23: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x160
    SPINLOCK24: mmio.Mmio(packed struct(u32) {
        SPINLOCK24: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x164
    SPINLOCK25: mmio.Mmio(packed struct(u32) {
        SPINLOCK25: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x168
    SPINLOCK26: mmio.Mmio(packed struct(u32) {
        SPINLOCK26: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x16c
    SPINLOCK27: mmio.Mmio(packed struct(u32) {
        SPINLOCK27: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x170
    SPINLOCK28: mmio.Mmio(packed struct(u32) {
        SPINLOCK28: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x174
    SPINLOCK29: mmio.Mmio(packed struct(u32) {
        SPINLOCK29: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x178
    SPINLOCK30: mmio.Mmio(packed struct(u32) {
        SPINLOCK30: u32,
    }),
    /// Reading from a spinlock address will: - Return 0 if lock is already locked - Otherwise return nonzero, and simultaneously claim the lock Writing (any value) releases the lock. If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins. The value returned on success is 0x1 << lock number.
    /// offset: 0x17c
    SPINLOCK31: mmio.Mmio(packed struct(u32) {
        SPINLOCK31: u32,
    }),
};
