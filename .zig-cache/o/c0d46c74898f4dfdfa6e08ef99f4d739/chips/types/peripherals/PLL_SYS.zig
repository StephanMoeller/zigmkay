const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const PLL_SYS = extern struct {
    /// Control and Status GENERAL CONSTRAINTS: Reference clock frequency min=5MHz, max=800MHz Feedback divider min=16, max=320 VCO frequency min=750MHz, max=1600MHz
    /// offset: 0x00
    CS: mmio.Mmio(packed struct(u32) {
        /// Divides the PLL input reference clock. Behaviour is undefined for div=0. PLL output will be unpredictable during refdiv changes, wait for lock=1 before using it.
        REFDIV: u6,
        reserved8: u2 = 0,
        /// Passes the reference clock to the output instead of the divided VCO. The VCO continues to run so the user can switch between the reference clock and the divided VCO but the output will glitch when doing so.
        BYPASS: u1,
        reserved31: u22 = 0,
        /// PLL is locked
        LOCK: u1,
    }),
    /// Controls the PLL power modes.
    /// offset: 0x04
    PWR: mmio.Mmio(packed struct(u32) {
        /// PLL powerdown To save power set high when PLL output not required.
        PD: u1,
        reserved2: u1 = 0,
        /// PLL DSM powerdown Nothing is achieved by setting this low.
        DSMPD: u1,
        /// PLL post divider powerdown To save power set high when PLL output not required or bypass=1.
        POSTDIVPD: u1,
        reserved5: u1 = 0,
        /// PLL VCO powerdown To save power set high when PLL output not required or bypass=1.
        VCOPD: u1,
        padding: u26 = 0,
    }),
    /// Feedback divisor (note: this PLL does not support fractional division)
    /// offset: 0x08
    FBDIV_INT: mmio.Mmio(packed struct(u32) {
        /// see ctrl reg description for constraints
        FBDIV_INT: u12,
        padding: u20 = 0,
    }),
    /// Controls the PLL post dividers for the primary output (note: this PLL does not have a secondary output) the primary output is driven from VCO divided by postdiv1*postdiv2
    /// offset: 0x0c
    PRIM: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// divide by 1-7
        POSTDIV2: u3,
        reserved16: u1 = 0,
        /// divide by 1-7
        POSTDIV1: u3,
        padding: u13 = 0,
    }),
};
