const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const WATCHDOG = extern struct {
    /// Watchdog control The rst_wdsel register determines which subsystems are reset when the watchdog is triggered. The watchdog can be triggered in software.
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Indicates the number of ticks / 2 (see errata RP2040-E1) before a watchdog reset will be triggered
        TIME: u24,
        /// Pause the watchdog timer when JTAG is accessing the bus fabric
        PAUSE_JTAG: u1,
        /// Pause the watchdog timer when processor 0 is in debug mode
        PAUSE_DBG0: u1,
        /// Pause the watchdog timer when processor 1 is in debug mode
        PAUSE_DBG1: u1,
        reserved30: u3 = 0,
        /// When not enabled the watchdog timer is paused
        ENABLE: u1,
        /// Trigger a watchdog reset
        TRIGGER: u1,
    }),
    /// Load the watchdog timer. The maximum setting is 0xffffff which corresponds to 0xffffff / 2 ticks before triggering a watchdog reset (see errata RP2040-E1).
    /// offset: 0x04
    LOAD: mmio.Mmio(packed struct(u32) {
        LOAD: u24,
        padding: u8 = 0,
    }),
    /// Logs the reason for the last reset. Both bits are zero for the case of a hardware reset.
    /// offset: 0x08
    REASON: mmio.Mmio(packed struct(u32) {
        TIMER: u1,
        FORCE: u1,
        padding: u30 = 0,
    }),
    /// Scratch register. Information persists through soft reset of the chip.
    /// offset: 0x0c
    SCRATCH0: mmio.Mmio(packed struct(u32) {
        SCRATCH0: u32,
    }),
    /// Scratch register. Information persists through soft reset of the chip.
    /// offset: 0x10
    SCRATCH1: mmio.Mmio(packed struct(u32) {
        SCRATCH1: u32,
    }),
    /// Scratch register. Information persists through soft reset of the chip.
    /// offset: 0x14
    SCRATCH2: mmio.Mmio(packed struct(u32) {
        SCRATCH2: u32,
    }),
    /// Scratch register. Information persists through soft reset of the chip.
    /// offset: 0x18
    SCRATCH3: mmio.Mmio(packed struct(u32) {
        SCRATCH3: u32,
    }),
    /// Scratch register. Information persists through soft reset of the chip.
    /// offset: 0x1c
    SCRATCH4: mmio.Mmio(packed struct(u32) {
        SCRATCH4: u32,
    }),
    /// Scratch register. Information persists through soft reset of the chip.
    /// offset: 0x20
    SCRATCH5: mmio.Mmio(packed struct(u32) {
        SCRATCH5: u32,
    }),
    /// Scratch register. Information persists through soft reset of the chip.
    /// offset: 0x24
    SCRATCH6: mmio.Mmio(packed struct(u32) {
        SCRATCH6: u32,
    }),
    /// Scratch register. Information persists through soft reset of the chip.
    /// offset: 0x28
    SCRATCH7: mmio.Mmio(packed struct(u32) {
        SCRATCH7: u32,
    }),
    /// Controls the tick generator
    /// offset: 0x2c
    TICK: mmio.Mmio(packed struct(u32) {
        /// Total number of clk_tick cycles before the next tick.
        CYCLES: u9,
        /// start / stop tick generation
        ENABLE: u1,
        /// Is the tick generator running?
        RUNNING: u1,
        /// Count down timer: the remaining number clk_tick cycles before the next tick is generated.
        COUNT: u9,
        padding: u12 = 0,
    }),
};
