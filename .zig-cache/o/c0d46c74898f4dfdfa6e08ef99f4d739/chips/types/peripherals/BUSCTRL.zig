const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Register block for busfabric control signals and performance counters
pub const BUSCTRL = extern struct {
    /// Set the priority of each master for bus arbitration.
    /// offset: 0x00
    BUS_PRIORITY: mmio.Mmio(packed struct(u32) {
        /// 0 - low priority, 1 - high priority
        PROC0: u1,
        reserved4: u3 = 0,
        /// 0 - low priority, 1 - high priority
        PROC1: u1,
        reserved8: u3 = 0,
        /// 0 - low priority, 1 - high priority
        DMA_R: u1,
        reserved12: u3 = 0,
        /// 0 - low priority, 1 - high priority
        DMA_W: u1,
        padding: u19 = 0,
    }),
    /// Bus priority acknowledge
    /// offset: 0x04
    BUS_PRIORITY_ACK: mmio.Mmio(packed struct(u32) {
        /// Goes to 1 once all arbiters have registered the new global priority levels. Arbiters update their local priority when servicing a new nonsequential access. In normal circumstances this will happen almost immediately.
        BUS_PRIORITY_ACK: u1,
        padding: u31 = 0,
    }),
    /// Bus fabric performance counter 0
    /// offset: 0x08
    PERFCTR0: mmio.Mmio(packed struct(u32) {
        /// Busfabric saturating performance counter 0 Count some event signal from the busfabric arbiters. Write any value to clear. Select an event to count using PERFSEL0
        PERFCTR0: u24,
        padding: u8 = 0,
    }),
    /// Bus fabric performance event select for PERFCTR0
    /// offset: 0x0c
    PERFSEL0: mmio.Mmio(packed struct(u32) {
        /// Select an event for PERFCTR0. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        PERFSEL0: enum(u5) {
            apb_contested = 0x0,
            apb = 0x1,
            fastperi_contested = 0x2,
            fastperi = 0x3,
            sram5_contested = 0x4,
            sram5 = 0x5,
            sram4_contested = 0x6,
            sram4 = 0x7,
            sram3_contested = 0x8,
            sram3 = 0x9,
            sram2_contested = 0xa,
            sram2 = 0xb,
            sram1_contested = 0xc,
            sram1 = 0xd,
            sram0_contested = 0xe,
            sram0 = 0xf,
            xip_main_contested = 0x10,
            xip_main = 0x11,
            rom_contested = 0x12,
            rom = 0x13,
            _,
        },
        padding: u27 = 0,
    }),
    /// Bus fabric performance counter 1
    /// offset: 0x10
    PERFCTR1: mmio.Mmio(packed struct(u32) {
        /// Busfabric saturating performance counter 1 Count some event signal from the busfabric arbiters. Write any value to clear. Select an event to count using PERFSEL1
        PERFCTR1: u24,
        padding: u8 = 0,
    }),
    /// Bus fabric performance event select for PERFCTR1
    /// offset: 0x14
    PERFSEL1: mmio.Mmio(packed struct(u32) {
        /// Select an event for PERFCTR1. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        PERFSEL1: enum(u5) {
            apb_contested = 0x0,
            apb = 0x1,
            fastperi_contested = 0x2,
            fastperi = 0x3,
            sram5_contested = 0x4,
            sram5 = 0x5,
            sram4_contested = 0x6,
            sram4 = 0x7,
            sram3_contested = 0x8,
            sram3 = 0x9,
            sram2_contested = 0xa,
            sram2 = 0xb,
            sram1_contested = 0xc,
            sram1 = 0xd,
            sram0_contested = 0xe,
            sram0 = 0xf,
            xip_main_contested = 0x10,
            xip_main = 0x11,
            rom_contested = 0x12,
            rom = 0x13,
            _,
        },
        padding: u27 = 0,
    }),
    /// Bus fabric performance counter 2
    /// offset: 0x18
    PERFCTR2: mmio.Mmio(packed struct(u32) {
        /// Busfabric saturating performance counter 2 Count some event signal from the busfabric arbiters. Write any value to clear. Select an event to count using PERFSEL2
        PERFCTR2: u24,
        padding: u8 = 0,
    }),
    /// Bus fabric performance event select for PERFCTR2
    /// offset: 0x1c
    PERFSEL2: mmio.Mmio(packed struct(u32) {
        /// Select an event for PERFCTR2. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        PERFSEL2: enum(u5) {
            apb_contested = 0x0,
            apb = 0x1,
            fastperi_contested = 0x2,
            fastperi = 0x3,
            sram5_contested = 0x4,
            sram5 = 0x5,
            sram4_contested = 0x6,
            sram4 = 0x7,
            sram3_contested = 0x8,
            sram3 = 0x9,
            sram2_contested = 0xa,
            sram2 = 0xb,
            sram1_contested = 0xc,
            sram1 = 0xd,
            sram0_contested = 0xe,
            sram0 = 0xf,
            xip_main_contested = 0x10,
            xip_main = 0x11,
            rom_contested = 0x12,
            rom = 0x13,
            _,
        },
        padding: u27 = 0,
    }),
    /// Bus fabric performance counter 3
    /// offset: 0x20
    PERFCTR3: mmio.Mmio(packed struct(u32) {
        /// Busfabric saturating performance counter 3 Count some event signal from the busfabric arbiters. Write any value to clear. Select an event to count using PERFSEL3
        PERFCTR3: u24,
        padding: u8 = 0,
    }),
    /// Bus fabric performance event select for PERFCTR3
    /// offset: 0x24
    PERFSEL3: mmio.Mmio(packed struct(u32) {
        /// Select an event for PERFCTR3. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        PERFSEL3: enum(u5) {
            apb_contested = 0x0,
            apb = 0x1,
            fastperi_contested = 0x2,
            fastperi = 0x3,
            sram5_contested = 0x4,
            sram5 = 0x5,
            sram4_contested = 0x6,
            sram4 = 0x7,
            sram3_contested = 0x8,
            sram3 = 0x9,
            sram2_contested = 0xa,
            sram2 = 0xb,
            sram1_contested = 0xc,
            sram1 = 0xd,
            sram0_contested = 0xe,
            sram0 = 0xf,
            xip_main_contested = 0x10,
            xip_main = 0x11,
            rom_contested = 0x12,
            rom = 0x13,
            _,
        },
        padding: u27 = 0,
    }),
};
