const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Register block for various chip control signals
pub const SYSCFG = extern struct {
    /// Processor core 0 NMI source mask
    /// offset: 0x00
    PROC0_NMI_MASK: mmio.Mmio(packed struct(u32) {
        /// Set a bit high to enable NMI from that IRQ
        PROC0_NMI_MASK: u32,
    }),
    /// Processor core 1 NMI source mask
    /// offset: 0x04
    PROC1_NMI_MASK: mmio.Mmio(packed struct(u32) {
        /// Set a bit high to enable NMI from that IRQ
        PROC1_NMI_MASK: u32,
    }),
    /// Configuration for processors
    /// offset: 0x08
    PROC_CONFIG: mmio.Mmio(packed struct(u32) {
        /// Indication that proc0 has halted
        PROC0_HALTED: u1,
        /// Indication that proc1 has halted
        PROC1_HALTED: u1,
        reserved24: u22 = 0,
        /// Configure proc0 DAP instance ID. Recommend that this is NOT changed until you require debug access in multi-chip environment WARNING: do not set to 15 as this is reserved for RescueDP
        PROC0_DAP_INSTID: u4,
        /// Configure proc1 DAP instance ID. Recommend that this is NOT changed until you require debug access in multi-chip environment WARNING: do not set to 15 as this is reserved for RescueDP
        PROC1_DAP_INSTID: u4,
    }),
    /// For each bit, if 1, bypass the input synchronizer between that GPIO and the GPIO input register in the SIO. The input synchronizers should generally be unbypassed, to avoid injecting metastabilities into processors. If you're feeling brave, you can bypass to save two cycles of input latency. This register applies to GPIO 0...29.
    /// offset: 0x0c
    PROC_IN_SYNC_BYPASS: mmio.Mmio(packed struct(u32) {
        PROC_IN_SYNC_BYPASS: u30,
        padding: u2 = 0,
    }),
    /// For each bit, if 1, bypass the input synchronizer between that GPIO and the GPIO input register in the SIO. The input synchronizers should generally be unbypassed, to avoid injecting metastabilities into processors. If you're feeling brave, you can bypass to save two cycles of input latency. This register applies to GPIO 30...35 (the QSPI IOs).
    /// offset: 0x10
    PROC_IN_SYNC_BYPASS_HI: mmio.Mmio(packed struct(u32) {
        PROC_IN_SYNC_BYPASS_HI: u6,
        padding: u26 = 0,
    }),
    /// Directly control the SWD debug port of either processor
    /// offset: 0x14
    DBGFORCE: mmio.Mmio(packed struct(u32) {
        /// Observe the value of processor 0 SWDIO output.
        PROC0_SWDO: u1,
        /// Directly drive processor 0 SWDIO input, if PROC0_ATTACH is set
        PROC0_SWDI: u1,
        /// Directly drive processor 0 SWCLK, if PROC0_ATTACH is set
        PROC0_SWCLK: u1,
        /// Attach processor 0 debug port to syscfg controls, and disconnect it from external SWD pads.
        PROC0_ATTACH: u1,
        /// Observe the value of processor 1 SWDIO output.
        PROC1_SWDO: u1,
        /// Directly drive processor 1 SWDIO input, if PROC1_ATTACH is set
        PROC1_SWDI: u1,
        /// Directly drive processor 1 SWCLK, if PROC1_ATTACH is set
        PROC1_SWCLK: u1,
        /// Attach processor 1 debug port to syscfg controls, and disconnect it from external SWD pads.
        PROC1_ATTACH: u1,
        padding: u24 = 0,
    }),
    /// Control power downs to memories. Set high to power down memories. Use with extreme caution
    /// offset: 0x18
    MEMPOWERDOWN: mmio.Mmio(packed struct(u32) {
        SRAM0: u1,
        SRAM1: u1,
        SRAM2: u1,
        SRAM3: u1,
        SRAM4: u1,
        SRAM5: u1,
        USB: u1,
        ROM: u1,
        padding: u24 = 0,
    }),
};
