const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Control and data interface to SAR ADC
pub const ADC = extern struct {
    /// ADC Control and Status
    /// offset: 0x00
    CS: mmio.Mmio(packed struct(u32) {
        /// Power on ADC and enable its clock. 1 - enabled. 0 - disabled.
        EN: u1,
        /// Power on temperature sensor. 1 - enabled. 0 - disabled.
        TS_EN: u1,
        /// Start a single conversion. Self-clearing. Ignored if start_many is asserted.
        START_ONCE: u1,
        /// Continuously perform conversions whilst this bit is 1. A new conversion will start immediately after the previous finishes.
        START_MANY: u1,
        reserved8: u4 = 0,
        /// 1 if the ADC is ready to start a new conversion. Implies any previous conversion has completed. 0 whilst conversion in progress.
        READY: u1,
        /// The most recent ADC conversion encountered an error; result is undefined or noisy.
        ERR: u1,
        /// Some past ADC conversion encountered an error. Write 1 to clear.
        ERR_STICKY: u1,
        reserved12: u1 = 0,
        /// Select analog mux input. Updated automatically in round-robin mode.
        AINSEL: u3,
        reserved16: u1 = 0,
        /// Round-robin sampling. 1 bit per channel. Set all bits to 0 to disable. Otherwise, the ADC will cycle through each enabled channel in a round-robin fashion. The first channel to be sampled will be the one currently indicated by AINSEL. AINSEL will be updated after each conversion with the newly-selected channel.
        RROBIN: u5,
        padding: u11 = 0,
    }),
    /// Result of most recent ADC conversion
    /// offset: 0x04
    RESULT: mmio.Mmio(packed struct(u32) {
        RESULT: u12,
        padding: u20 = 0,
    }),
    /// FIFO control and status
    /// offset: 0x08
    FCS: mmio.Mmio(packed struct(u32) {
        /// If 1: write result to the FIFO after each conversion.
        EN: u1,
        /// If 1: FIFO results are right-shifted to be one byte in size. Enables DMA to byte buffers.
        SHIFT: u1,
        /// If 1: conversion error bit appears in the FIFO alongside the result
        ERR: u1,
        /// If 1: assert DMA requests when FIFO contains data
        DREQ_EN: u1,
        reserved8: u4 = 0,
        EMPTY: u1,
        FULL: u1,
        /// 1 if the FIFO has been underflowed. Write 1 to clear.
        UNDER: u1,
        /// 1 if the FIFO has been overflowed. Write 1 to clear.
        OVER: u1,
        reserved16: u4 = 0,
        /// The number of conversion results currently waiting in the FIFO
        LEVEL: u4,
        reserved24: u4 = 0,
        /// DREQ/IRQ asserted when level >= threshold
        THRESH: u4,
        padding: u4 = 0,
    }),
    /// Conversion result FIFO
    /// offset: 0x0c
    FIFO: mmio.Mmio(packed struct(u32) {
        VAL: u12,
        reserved15: u3 = 0,
        /// 1 if this particular sample experienced a conversion error. Remains in the same location if the sample is shifted.
        ERR: u1,
        padding: u16 = 0,
    }),
    /// Clock divider. If non-zero, CS_START_MANY will start conversions at regular intervals rather than back-to-back. The divider is reset when either of these fields are written. Total period is 1 + INT + FRAC / 256
    /// offset: 0x10
    DIV: mmio.Mmio(packed struct(u32) {
        /// Fractional part of clock divisor. First-order delta-sigma.
        FRAC: u8,
        /// Integer part of clock divisor.
        INT: u16,
        padding: u8 = 0,
    }),
    /// Raw Interrupts
    /// offset: 0x14
    INTR: mmio.Mmio(packed struct(u32) {
        /// Triggered when the sample FIFO reaches a certain level. This level can be programmed via the FCS_THRESH field.
        FIFO: u1,
        padding: u31 = 0,
    }),
    /// Interrupt Enable
    /// offset: 0x18
    INTE: mmio.Mmio(packed struct(u32) {
        /// Triggered when the sample FIFO reaches a certain level. This level can be programmed via the FCS_THRESH field.
        FIFO: u1,
        padding: u31 = 0,
    }),
    /// Interrupt Force
    /// offset: 0x1c
    INTF: mmio.Mmio(packed struct(u32) {
        /// Triggered when the sample FIFO reaches a certain level. This level can be programmed via the FCS_THRESH field.
        FIFO: u1,
        padding: u31 = 0,
    }),
    /// Interrupt status after masking & forcing
    /// offset: 0x20
    INTS: mmio.Mmio(packed struct(u32) {
        /// Triggered when the sample FIFO reaches a certain level. This level can be programmed via the FCS_THRESH field.
        FIFO: u1,
        padding: u31 = 0,
    }),
};
