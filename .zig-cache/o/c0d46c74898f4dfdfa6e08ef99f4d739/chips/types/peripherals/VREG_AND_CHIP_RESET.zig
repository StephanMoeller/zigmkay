const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// control and status for on-chip voltage regulator and chip level reset subsystem
pub const VREG_AND_CHIP_RESET = extern struct {
    /// Voltage regulator control and status
    /// offset: 0x00
    VREG: mmio.Mmio(packed struct(u32) {
        /// enable 0=not enabled, 1=enabled
        EN: u1,
        /// high impedance mode select 0=not in high impedance mode, 1=in high impedance mode
        HIZ: u1,
        reserved4: u2 = 0,
        /// output voltage select 0000 to 0101 - 0.80V 0110 - 0.85V 0111 - 0.90V 1000 - 0.95V 1001 - 1.00V 1010 - 1.05V 1011 - 1.10V (default) 1100 - 1.15V 1101 - 1.20V 1110 - 1.25V 1111 - 1.30V
        VSEL: u4,
        reserved12: u4 = 0,
        /// regulation status 0=not in regulation, 1=in regulation
        ROK: u1,
        padding: u19 = 0,
    }),
    /// brown-out detection control
    /// offset: 0x04
    BOD: mmio.Mmio(packed struct(u32) {
        /// enable 0=not enabled, 1=enabled
        EN: u1,
        reserved4: u3 = 0,
        /// threshold select 0000 - 0.473V 0001 - 0.516V 0010 - 0.559V 0011 - 0.602V 0100 - 0.645V 0101 - 0.688V 0110 - 0.731V 0111 - 0.774V 1000 - 0.817V 1001 - 0.860V (default) 1010 - 0.903V 1011 - 0.946V 1100 - 0.989V 1101 - 1.032V 1110 - 1.075V 1111 - 1.118V
        VSEL: u4,
        padding: u24 = 0,
    }),
    /// Chip reset control and status
    /// offset: 0x08
    CHIP_RESET: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Last reset was from the power-on reset or brown-out detection blocks
        HAD_POR: u1,
        reserved16: u7 = 0,
        /// Last reset was from the RUN pin
        HAD_RUN: u1,
        reserved20: u3 = 0,
        /// Last reset was from the debug port
        HAD_PSM_RESTART: u1,
        reserved24: u3 = 0,
        /// This is set by psm_restart from the debugger. Its purpose is to branch bootcode to a safe mode when the debugger has issued a psm_restart in order to recover from a boot lock-up. In the safe mode the debugger can repair the boot code, clear this flag then reboot the processor.
        PSM_RESTART_FLAG: u1,
        padding: u7 = 0,
    }),
};
