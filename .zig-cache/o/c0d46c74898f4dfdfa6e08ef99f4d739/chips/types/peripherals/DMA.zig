const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// DMA with separate read and write masters
pub const DMA = extern struct {
    pub const DataSize = enum(u2) {
        size_8 = 0x0,
        size_16 = 0x1,
        size_32 = 0x2,
        _,
    };

    pub const Dreq = enum(u6) {
        pio0_tx0 = 0x0,
        pio0_tx1 = 0x1,
        pio0_tx2 = 0x2,
        pio0_tx3 = 0x3,
        pio0_rx0 = 0x4,
        pio0_rx1 = 0x5,
        pio0_rx2 = 0x6,
        pio0_rx3 = 0x7,
        pio1_tx0 = 0x8,
        pio1_tx1 = 0x9,
        pio1_tx2 = 0xa,
        pio1_tx3 = 0xb,
        pio1_rx0 = 0xc,
        pio1_rx1 = 0xd,
        pio1_rx2 = 0xe,
        pio1_rx3 = 0xf,
        spi0_tx = 0x10,
        spi0_rx = 0x11,
        spi1_tx = 0x12,
        spi1_rx = 0x13,
        uart0_tx = 0x14,
        uart0_rx = 0x15,
        uart1_tx = 0x16,
        uart1_rx = 0x17,
        pwm_wrap0 = 0x18,
        pwm_wrap1 = 0x19,
        pwm_wrap2 = 0x1a,
        pwm_wrap3 = 0x1b,
        pwm_wrap4 = 0x1c,
        pwm_wrap5 = 0x1d,
        pwm_wrap6 = 0x1e,
        pwm_wrap7 = 0x1f,
        i2c0_tx = 0x20,
        i2c0_rx = 0x21,
        i2c1_tx = 0x22,
        i2c1_rx = 0x23,
        adc = 0x24,
        xip_stream = 0x25,
        xip_ssitx = 0x26,
        xip_ssirx = 0x27,
        timer0 = 0x3b,
        timer1 = 0x3c,
        timer2 = 0x3d,
        timer3 = 0x3e,
        permanent = 0x3f,
        _,
    };

    /// DMA Channel 0 Read Address pointer
    /// offset: 0x00
    CH0_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH0_READ_ADDR: u32,
    }),
    /// DMA Channel 0 Write Address pointer
    /// offset: 0x04
    CH0_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH0_WRITE_ADDR: u32,
    }),
    /// DMA Channel 0 Transfer Count
    /// offset: 0x08
    CH0_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH0_TRANS_COUNT: u32,
    }),
    /// DMA Channel 0 Control and Status
    /// offset: 0x0c
    CH0_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 0 CTRL register
    /// offset: 0x10
    CH0_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH0_AL1_CTRL: u32,
    }),
    /// Alias for channel 0 READ_ADDR register
    /// offset: 0x14
    CH0_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH0_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 0 WRITE_ADDR register
    /// offset: 0x18
    CH0_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH0_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 0 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x1c
    CH0_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH0_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 0 CTRL register
    /// offset: 0x20
    CH0_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH0_AL2_CTRL: u32,
    }),
    /// Alias for channel 0 TRANS_COUNT register
    /// offset: 0x24
    CH0_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH0_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 0 READ_ADDR register
    /// offset: 0x28
    CH0_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH0_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 0 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x2c
    CH0_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH0_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 0 CTRL register
    /// offset: 0x30
    CH0_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH0_AL3_CTRL: u32,
    }),
    /// Alias for channel 0 WRITE_ADDR register
    /// offset: 0x34
    CH0_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH0_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 0 TRANS_COUNT register
    /// offset: 0x38
    CH0_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH0_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 0 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x3c
    CH0_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH0_AL3_READ_ADDR_TRIG: u32,
    }),
    /// DMA Channel 1 Read Address pointer
    /// offset: 0x40
    CH1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH1_READ_ADDR: u32,
    }),
    /// DMA Channel 1 Write Address pointer
    /// offset: 0x44
    CH1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH1_WRITE_ADDR: u32,
    }),
    /// DMA Channel 1 Transfer Count
    /// offset: 0x48
    CH1_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH1_TRANS_COUNT: u32,
    }),
    /// DMA Channel 1 Control and Status
    /// offset: 0x4c
    CH1_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 1 CTRL register
    /// offset: 0x50
    CH1_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH1_AL1_CTRL: u32,
    }),
    /// Alias for channel 1 READ_ADDR register
    /// offset: 0x54
    CH1_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH1_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 1 WRITE_ADDR register
    /// offset: 0x58
    CH1_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH1_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 1 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x5c
    CH1_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH1_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 1 CTRL register
    /// offset: 0x60
    CH1_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH1_AL2_CTRL: u32,
    }),
    /// Alias for channel 1 TRANS_COUNT register
    /// offset: 0x64
    CH1_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH1_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 1 READ_ADDR register
    /// offset: 0x68
    CH1_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH1_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 1 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x6c
    CH1_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH1_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 1 CTRL register
    /// offset: 0x70
    CH1_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH1_AL3_CTRL: u32,
    }),
    /// Alias for channel 1 WRITE_ADDR register
    /// offset: 0x74
    CH1_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH1_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 1 TRANS_COUNT register
    /// offset: 0x78
    CH1_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH1_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 1 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x7c
    CH1_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH1_AL3_READ_ADDR_TRIG: u32,
    }),
    /// DMA Channel 2 Read Address pointer
    /// offset: 0x80
    CH2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH2_READ_ADDR: u32,
    }),
    /// DMA Channel 2 Write Address pointer
    /// offset: 0x84
    CH2_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH2_WRITE_ADDR: u32,
    }),
    /// DMA Channel 2 Transfer Count
    /// offset: 0x88
    CH2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH2_TRANS_COUNT: u32,
    }),
    /// DMA Channel 2 Control and Status
    /// offset: 0x8c
    CH2_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 2 CTRL register
    /// offset: 0x90
    CH2_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH2_AL1_CTRL: u32,
    }),
    /// Alias for channel 2 READ_ADDR register
    /// offset: 0x94
    CH2_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH2_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 2 WRITE_ADDR register
    /// offset: 0x98
    CH2_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH2_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 2 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x9c
    CH2_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH2_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 2 CTRL register
    /// offset: 0xa0
    CH2_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH2_AL2_CTRL: u32,
    }),
    /// Alias for channel 2 TRANS_COUNT register
    /// offset: 0xa4
    CH2_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH2_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 2 READ_ADDR register
    /// offset: 0xa8
    CH2_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH2_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 2 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0xac
    CH2_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH2_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 2 CTRL register
    /// offset: 0xb0
    CH2_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH2_AL3_CTRL: u32,
    }),
    /// Alias for channel 2 WRITE_ADDR register
    /// offset: 0xb4
    CH2_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH2_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 2 TRANS_COUNT register
    /// offset: 0xb8
    CH2_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH2_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 2 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0xbc
    CH2_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH2_AL3_READ_ADDR_TRIG: u32,
    }),
    /// DMA Channel 3 Read Address pointer
    /// offset: 0xc0
    CH3_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH3_READ_ADDR: u32,
    }),
    /// DMA Channel 3 Write Address pointer
    /// offset: 0xc4
    CH3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH3_WRITE_ADDR: u32,
    }),
    /// DMA Channel 3 Transfer Count
    /// offset: 0xc8
    CH3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH3_TRANS_COUNT: u32,
    }),
    /// DMA Channel 3 Control and Status
    /// offset: 0xcc
    CH3_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 3 CTRL register
    /// offset: 0xd0
    CH3_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH3_AL1_CTRL: u32,
    }),
    /// Alias for channel 3 READ_ADDR register
    /// offset: 0xd4
    CH3_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH3_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 3 WRITE_ADDR register
    /// offset: 0xd8
    CH3_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH3_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 3 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0xdc
    CH3_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH3_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 3 CTRL register
    /// offset: 0xe0
    CH3_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH3_AL2_CTRL: u32,
    }),
    /// Alias for channel 3 TRANS_COUNT register
    /// offset: 0xe4
    CH3_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH3_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 3 READ_ADDR register
    /// offset: 0xe8
    CH3_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH3_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 3 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0xec
    CH3_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH3_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 3 CTRL register
    /// offset: 0xf0
    CH3_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH3_AL3_CTRL: u32,
    }),
    /// Alias for channel 3 WRITE_ADDR register
    /// offset: 0xf4
    CH3_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH3_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 3 TRANS_COUNT register
    /// offset: 0xf8
    CH3_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH3_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 3 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0xfc
    CH3_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH3_AL3_READ_ADDR_TRIG: u32,
    }),
    /// DMA Channel 4 Read Address pointer
    /// offset: 0x100
    CH4_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH4_READ_ADDR: u32,
    }),
    /// DMA Channel 4 Write Address pointer
    /// offset: 0x104
    CH4_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH4_WRITE_ADDR: u32,
    }),
    /// DMA Channel 4 Transfer Count
    /// offset: 0x108
    CH4_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH4_TRANS_COUNT: u32,
    }),
    /// DMA Channel 4 Control and Status
    /// offset: 0x10c
    CH4_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 4 CTRL register
    /// offset: 0x110
    CH4_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH4_AL1_CTRL: u32,
    }),
    /// Alias for channel 4 READ_ADDR register
    /// offset: 0x114
    CH4_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH4_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 4 WRITE_ADDR register
    /// offset: 0x118
    CH4_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH4_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 4 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x11c
    CH4_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH4_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 4 CTRL register
    /// offset: 0x120
    CH4_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH4_AL2_CTRL: u32,
    }),
    /// Alias for channel 4 TRANS_COUNT register
    /// offset: 0x124
    CH4_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH4_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 4 READ_ADDR register
    /// offset: 0x128
    CH4_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH4_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 4 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x12c
    CH4_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH4_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 4 CTRL register
    /// offset: 0x130
    CH4_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH4_AL3_CTRL: u32,
    }),
    /// Alias for channel 4 WRITE_ADDR register
    /// offset: 0x134
    CH4_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH4_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 4 TRANS_COUNT register
    /// offset: 0x138
    CH4_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH4_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 4 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x13c
    CH4_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH4_AL3_READ_ADDR_TRIG: u32,
    }),
    /// DMA Channel 5 Read Address pointer
    /// offset: 0x140
    CH5_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH5_READ_ADDR: u32,
    }),
    /// DMA Channel 5 Write Address pointer
    /// offset: 0x144
    CH5_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH5_WRITE_ADDR: u32,
    }),
    /// DMA Channel 5 Transfer Count
    /// offset: 0x148
    CH5_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH5_TRANS_COUNT: u32,
    }),
    /// DMA Channel 5 Control and Status
    /// offset: 0x14c
    CH5_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 5 CTRL register
    /// offset: 0x150
    CH5_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH5_AL1_CTRL: u32,
    }),
    /// Alias for channel 5 READ_ADDR register
    /// offset: 0x154
    CH5_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH5_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 5 WRITE_ADDR register
    /// offset: 0x158
    CH5_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH5_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 5 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x15c
    CH5_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH5_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 5 CTRL register
    /// offset: 0x160
    CH5_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH5_AL2_CTRL: u32,
    }),
    /// Alias for channel 5 TRANS_COUNT register
    /// offset: 0x164
    CH5_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH5_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 5 READ_ADDR register
    /// offset: 0x168
    CH5_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH5_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 5 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x16c
    CH5_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH5_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 5 CTRL register
    /// offset: 0x170
    CH5_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH5_AL3_CTRL: u32,
    }),
    /// Alias for channel 5 WRITE_ADDR register
    /// offset: 0x174
    CH5_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH5_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 5 TRANS_COUNT register
    /// offset: 0x178
    CH5_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH5_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 5 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x17c
    CH5_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH5_AL3_READ_ADDR_TRIG: u32,
    }),
    /// DMA Channel 6 Read Address pointer
    /// offset: 0x180
    CH6_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH6_READ_ADDR: u32,
    }),
    /// DMA Channel 6 Write Address pointer
    /// offset: 0x184
    CH6_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH6_WRITE_ADDR: u32,
    }),
    /// DMA Channel 6 Transfer Count
    /// offset: 0x188
    CH6_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH6_TRANS_COUNT: u32,
    }),
    /// DMA Channel 6 Control and Status
    /// offset: 0x18c
    CH6_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 6 CTRL register
    /// offset: 0x190
    CH6_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH6_AL1_CTRL: u32,
    }),
    /// Alias for channel 6 READ_ADDR register
    /// offset: 0x194
    CH6_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH6_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 6 WRITE_ADDR register
    /// offset: 0x198
    CH6_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH6_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 6 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x19c
    CH6_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH6_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 6 CTRL register
    /// offset: 0x1a0
    CH6_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH6_AL2_CTRL: u32,
    }),
    /// Alias for channel 6 TRANS_COUNT register
    /// offset: 0x1a4
    CH6_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH6_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 6 READ_ADDR register
    /// offset: 0x1a8
    CH6_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH6_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 6 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x1ac
    CH6_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH6_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 6 CTRL register
    /// offset: 0x1b0
    CH6_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH6_AL3_CTRL: u32,
    }),
    /// Alias for channel 6 WRITE_ADDR register
    /// offset: 0x1b4
    CH6_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH6_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 6 TRANS_COUNT register
    /// offset: 0x1b8
    CH6_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH6_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 6 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x1bc
    CH6_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH6_AL3_READ_ADDR_TRIG: u32,
    }),
    /// DMA Channel 7 Read Address pointer
    /// offset: 0x1c0
    CH7_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH7_READ_ADDR: u32,
    }),
    /// DMA Channel 7 Write Address pointer
    /// offset: 0x1c4
    CH7_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH7_WRITE_ADDR: u32,
    }),
    /// DMA Channel 7 Transfer Count
    /// offset: 0x1c8
    CH7_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH7_TRANS_COUNT: u32,
    }),
    /// DMA Channel 7 Control and Status
    /// offset: 0x1cc
    CH7_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 7 CTRL register
    /// offset: 0x1d0
    CH7_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH7_AL1_CTRL: u32,
    }),
    /// Alias for channel 7 READ_ADDR register
    /// offset: 0x1d4
    CH7_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH7_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 7 WRITE_ADDR register
    /// offset: 0x1d8
    CH7_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH7_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 7 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x1dc
    CH7_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH7_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 7 CTRL register
    /// offset: 0x1e0
    CH7_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH7_AL2_CTRL: u32,
    }),
    /// Alias for channel 7 TRANS_COUNT register
    /// offset: 0x1e4
    CH7_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH7_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 7 READ_ADDR register
    /// offset: 0x1e8
    CH7_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH7_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 7 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x1ec
    CH7_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH7_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 7 CTRL register
    /// offset: 0x1f0
    CH7_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH7_AL3_CTRL: u32,
    }),
    /// Alias for channel 7 WRITE_ADDR register
    /// offset: 0x1f4
    CH7_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH7_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 7 TRANS_COUNT register
    /// offset: 0x1f8
    CH7_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH7_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 7 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x1fc
    CH7_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH7_AL3_READ_ADDR_TRIG: u32,
    }),
    /// DMA Channel 8 Read Address pointer
    /// offset: 0x200
    CH8_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH8_READ_ADDR: u32,
    }),
    /// DMA Channel 8 Write Address pointer
    /// offset: 0x204
    CH8_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH8_WRITE_ADDR: u32,
    }),
    /// DMA Channel 8 Transfer Count
    /// offset: 0x208
    CH8_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH8_TRANS_COUNT: u32,
    }),
    /// DMA Channel 8 Control and Status
    /// offset: 0x20c
    CH8_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 8 CTRL register
    /// offset: 0x210
    CH8_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH8_AL1_CTRL: u32,
    }),
    /// Alias for channel 8 READ_ADDR register
    /// offset: 0x214
    CH8_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH8_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 8 WRITE_ADDR register
    /// offset: 0x218
    CH8_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH8_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 8 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x21c
    CH8_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH8_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 8 CTRL register
    /// offset: 0x220
    CH8_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH8_AL2_CTRL: u32,
    }),
    /// Alias for channel 8 TRANS_COUNT register
    /// offset: 0x224
    CH8_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH8_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 8 READ_ADDR register
    /// offset: 0x228
    CH8_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH8_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 8 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x22c
    CH8_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH8_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 8 CTRL register
    /// offset: 0x230
    CH8_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH8_AL3_CTRL: u32,
    }),
    /// Alias for channel 8 WRITE_ADDR register
    /// offset: 0x234
    CH8_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH8_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 8 TRANS_COUNT register
    /// offset: 0x238
    CH8_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH8_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 8 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x23c
    CH8_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH8_AL3_READ_ADDR_TRIG: u32,
    }),
    /// DMA Channel 9 Read Address pointer
    /// offset: 0x240
    CH9_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH9_READ_ADDR: u32,
    }),
    /// DMA Channel 9 Write Address pointer
    /// offset: 0x244
    CH9_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH9_WRITE_ADDR: u32,
    }),
    /// DMA Channel 9 Transfer Count
    /// offset: 0x248
    CH9_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH9_TRANS_COUNT: u32,
    }),
    /// DMA Channel 9 Control and Status
    /// offset: 0x24c
    CH9_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 9 CTRL register
    /// offset: 0x250
    CH9_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH9_AL1_CTRL: u32,
    }),
    /// Alias for channel 9 READ_ADDR register
    /// offset: 0x254
    CH9_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH9_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 9 WRITE_ADDR register
    /// offset: 0x258
    CH9_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH9_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 9 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x25c
    CH9_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH9_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 9 CTRL register
    /// offset: 0x260
    CH9_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH9_AL2_CTRL: u32,
    }),
    /// Alias for channel 9 TRANS_COUNT register
    /// offset: 0x264
    CH9_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH9_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 9 READ_ADDR register
    /// offset: 0x268
    CH9_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH9_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 9 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x26c
    CH9_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH9_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 9 CTRL register
    /// offset: 0x270
    CH9_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH9_AL3_CTRL: u32,
    }),
    /// Alias for channel 9 WRITE_ADDR register
    /// offset: 0x274
    CH9_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH9_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 9 TRANS_COUNT register
    /// offset: 0x278
    CH9_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH9_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 9 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x27c
    CH9_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH9_AL3_READ_ADDR_TRIG: u32,
    }),
    /// DMA Channel 10 Read Address pointer
    /// offset: 0x280
    CH10_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH10_READ_ADDR: u32,
    }),
    /// DMA Channel 10 Write Address pointer
    /// offset: 0x284
    CH10_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH10_WRITE_ADDR: u32,
    }),
    /// DMA Channel 10 Transfer Count
    /// offset: 0x288
    CH10_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH10_TRANS_COUNT: u32,
    }),
    /// DMA Channel 10 Control and Status
    /// offset: 0x28c
    CH10_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 10 CTRL register
    /// offset: 0x290
    CH10_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH10_AL1_CTRL: u32,
    }),
    /// Alias for channel 10 READ_ADDR register
    /// offset: 0x294
    CH10_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH10_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 10 WRITE_ADDR register
    /// offset: 0x298
    CH10_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH10_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 10 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x29c
    CH10_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH10_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 10 CTRL register
    /// offset: 0x2a0
    CH10_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH10_AL2_CTRL: u32,
    }),
    /// Alias for channel 10 TRANS_COUNT register
    /// offset: 0x2a4
    CH10_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH10_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 10 READ_ADDR register
    /// offset: 0x2a8
    CH10_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH10_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 10 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x2ac
    CH10_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH10_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 10 CTRL register
    /// offset: 0x2b0
    CH10_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH10_AL3_CTRL: u32,
    }),
    /// Alias for channel 10 WRITE_ADDR register
    /// offset: 0x2b4
    CH10_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH10_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 10 TRANS_COUNT register
    /// offset: 0x2b8
    CH10_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH10_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 10 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x2bc
    CH10_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH10_AL3_READ_ADDR_TRIG: u32,
    }),
    /// DMA Channel 11 Read Address pointer
    /// offset: 0x2c0
    CH11_READ_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
        CH11_READ_ADDR: u32,
    }),
    /// DMA Channel 11 Write Address pointer
    /// offset: 0x2c4
    CH11_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
        CH11_WRITE_ADDR: u32,
    }),
    /// DMA Channel 11 Transfer Count
    /// offset: 0x2c8
    CH11_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE). When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes. Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write. The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
        CH11_TRANS_COUNT: u32,
    }),
    /// DMA Channel 11 Control and Status
    /// offset: 0x2cc
    CH11_CTRL_TRIG: mmio.Mmio(packed struct(u32) {
        /// DMA Channel Enable. When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        EN: u1,
        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels. This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        HIGH_PRIORITY: u1,
        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        DATA_SIZE: DataSize,
        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address. Generally this should be disabled for peripheral-to-memory transfers.
        INCR_READ: u1,
        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address. Generally this should be disabled for memory-to-peripheral transfers.
        INCR_WRITE: u1,
        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers. Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        RING_SIZE: enum(u4) {
            RING_NONE = 0x0,
            _,
        },
        /// Select whether RING_SIZE applies to read or write addresses. If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        RING_SEL: u1,
        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        CHAIN_TO: u4,
        /// Select a Transfer Request signal. The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system). 0x0 to 0x3a -> select DREQ n as TREQ
        TREQ_SEL: Dreq,
        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain. This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        IRQ_QUIET: u1,
        /// Apply byte-swap transformation to DMA data. For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        BSWAP: u1,
        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected. This allows checksum to be enabled or disabled on a per-control- block basis.
        SNIFF_EN: u1,
        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused. To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        BUSY: u1,
        reserved29: u4 = 0,
        /// If 1, the channel received a write bus error. Write one to clear. WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        WRITE_ERROR: u1,
        /// If 1, the channel received a read bus error. Write one to clear. READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        READ_ERROR: u1,
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        AHB_ERROR: u1,
    }),
    /// Alias for channel 11 CTRL register
    /// offset: 0x2d0
    CH11_AL1_CTRL: mmio.Mmio(packed struct(u32) {
        CH11_AL1_CTRL: u32,
    }),
    /// Alias for channel 11 READ_ADDR register
    /// offset: 0x2d4
    CH11_AL1_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH11_AL1_READ_ADDR: u32,
    }),
    /// Alias for channel 11 WRITE_ADDR register
    /// offset: 0x2d8
    CH11_AL1_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH11_AL1_WRITE_ADDR: u32,
    }),
    /// Alias for channel 11 TRANS_COUNT register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x2dc
    CH11_AL1_TRANS_COUNT_TRIG: mmio.Mmio(packed struct(u32) {
        CH11_AL1_TRANS_COUNT_TRIG: u32,
    }),
    /// Alias for channel 11 CTRL register
    /// offset: 0x2e0
    CH11_AL2_CTRL: mmio.Mmio(packed struct(u32) {
        CH11_AL2_CTRL: u32,
    }),
    /// Alias for channel 11 TRANS_COUNT register
    /// offset: 0x2e4
    CH11_AL2_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH11_AL2_TRANS_COUNT: u32,
    }),
    /// Alias for channel 11 READ_ADDR register
    /// offset: 0x2e8
    CH11_AL2_READ_ADDR: mmio.Mmio(packed struct(u32) {
        CH11_AL2_READ_ADDR: u32,
    }),
    /// Alias for channel 11 WRITE_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x2ec
    CH11_AL2_WRITE_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH11_AL2_WRITE_ADDR_TRIG: u32,
    }),
    /// Alias for channel 11 CTRL register
    /// offset: 0x2f0
    CH11_AL3_CTRL: mmio.Mmio(packed struct(u32) {
        CH11_AL3_CTRL: u32,
    }),
    /// Alias for channel 11 WRITE_ADDR register
    /// offset: 0x2f4
    CH11_AL3_WRITE_ADDR: mmio.Mmio(packed struct(u32) {
        CH11_AL3_WRITE_ADDR: u32,
    }),
    /// Alias for channel 11 TRANS_COUNT register
    /// offset: 0x2f8
    CH11_AL3_TRANS_COUNT: mmio.Mmio(packed struct(u32) {
        CH11_AL3_TRANS_COUNT: u32,
    }),
    /// Alias for channel 11 READ_ADDR register This is a trigger register (0xc). Writing a nonzero value will reload the channel counter and start the channel.
    /// offset: 0x2fc
    CH11_AL3_READ_ADDR_TRIG: mmio.Mmio(packed struct(u32) {
        CH11_AL3_READ_ADDR_TRIG: u32,
    }),
    /// offset: 0x300
    reserved768: [256]u8,
    /// Interrupt Status (raw)
    /// offset: 0x400
    INTR: mmio.Mmio(packed struct(u32) {
        /// Raw interrupt status for DMA Channels 0..15. Bit n corresponds to channel n. Ignores any masking or forcing. Channel interrupts can be cleared by writing a bit mask to INTR, INTS0 or INTS1. Channel interrupts can be routed to either of two system-level IRQs based on INTE0 and INTE1. This can be used vector different channel interrupts to different ISRs: this might be done to allow NVIC IRQ preemption for more time-critical channels, or to spread IRQ load across different cores. It is also valid to ignore this behaviour and just use INTE0/INTS0/IRQ 0.
        INTR: u16,
        padding: u16 = 0,
    }),
    /// Interrupt Enables for IRQ 0
    /// offset: 0x404
    INTE0: mmio.Mmio(packed struct(u32) {
        /// Set bit n to pass interrupts from channel n to DMA IRQ 0.
        INTE0: u16,
        padding: u16 = 0,
    }),
    /// Force Interrupts
    /// offset: 0x408
    INTF0: mmio.Mmio(packed struct(u32) {
        /// Write 1s to force the corresponding bits in INTE0. The interrupt remains asserted until INTF0 is cleared.
        INTF0: u16,
        padding: u16 = 0,
    }),
    /// Interrupt Status for IRQ 0
    /// offset: 0x40c
    INTS0: mmio.Mmio(packed struct(u32) {
        /// Indicates active channel interrupt requests which are currently causing IRQ 0 to be asserted. Channel interrupts can be cleared by writing a bit mask here.
        INTS0: u16,
        padding: u16 = 0,
    }),
    /// Interrupt Status (raw)
    /// offset: 0x410
    INTR1: mmio.Mmio(packed struct(u32) {
        /// Raw interrupt status for DMA Channels 0..15. Bit n corresponds to channel n. Ignores any masking or forcing. Channel interrupts can be cleared by writing a bit mask to INTR, INTS0 or INTS1. Channel interrupts can be routed to either of two system-level IRQs based on INTE0 and INTE1. This can be used vector different channel interrupts to different ISRs: this might be done to allow NVIC IRQ preemption for more time-critical channels, or to spread IRQ load across different cores. It is also valid to ignore this behaviour and just use INTE0/INTS0/IRQ 0.
        INTR1: u16,
        padding: u16 = 0,
    }),
    /// Interrupt Enables for IRQ 1
    /// offset: 0x414
    INTE1: mmio.Mmio(packed struct(u32) {
        /// Set bit n to pass interrupts from channel n to DMA IRQ 1.
        INTE1: u16,
        padding: u16 = 0,
    }),
    /// Force Interrupts for IRQ 1
    /// offset: 0x418
    INTF1: mmio.Mmio(packed struct(u32) {
        /// Write 1s to force the corresponding bits in INTE0. The interrupt remains asserted until INTF0 is cleared.
        INTF1: u16,
        padding: u16 = 0,
    }),
    /// Interrupt Status (masked) for IRQ 1
    /// offset: 0x41c
    INTS1: mmio.Mmio(packed struct(u32) {
        /// Indicates active channel interrupt requests which are currently causing IRQ 1 to be asserted. Channel interrupts can be cleared by writing a bit mask here.
        INTS1: u16,
        padding: u16 = 0,
    }),
    /// Pacing (X/Y) Fractional Timer The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    /// offset: 0x420
    TIMER0: mmio.Mmio(packed struct(u32) {
        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        Y: u16,
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        X: u16,
    }),
    /// Pacing (X/Y) Fractional Timer The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    /// offset: 0x424
    TIMER1: mmio.Mmio(packed struct(u32) {
        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        Y: u16,
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        X: u16,
    }),
    /// Pacing (X/Y) Fractional Timer The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    /// offset: 0x428
    TIMER2: mmio.Mmio(packed struct(u32) {
        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        Y: u16,
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        X: u16,
    }),
    /// Pacing (X/Y) Fractional Timer The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    /// offset: 0x42c
    TIMER3: mmio.Mmio(packed struct(u32) {
        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        Y: u16,
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        X: u16,
    }),
    /// Trigger one or more channels simultaneously
    /// offset: 0x430
    MULTI_CHAN_TRIGGER: mmio.Mmio(packed struct(u32) {
        /// Each bit in this register corresponds to a DMA channel. Writing a 1 to the relevant bit is the same as writing to that channel's trigger register; the channel will start if it is currently enabled and not already busy.
        MULTI_CHAN_TRIGGER: u16,
        padding: u16 = 0,
    }),
    /// Sniffer Control
    /// offset: 0x434
    SNIFF_CTRL: mmio.Mmio(packed struct(u32) {
        /// Enable sniffer
        EN: u1,
        /// DMA channel for Sniffer to observe
        DMACH: u4,
        CALC: enum(u4) {
            /// Calculate a CRC-32 (IEEE802.3 polynomial)
            CRC32 = 0x0,
            /// Calculate a CRC-32 (IEEE802.3 polynomial) with bit reversed data
            CRC32R = 0x1,
            /// Calculate a CRC-16-CCITT
            CRC16 = 0x2,
            /// Calculate a CRC-16-CCITT with bit reversed data
            CRC16R = 0x3,
            /// XOR reduction over all data. == 1 if the total 1 population count is odd.
            EVEN = 0xe,
            /// Calculate a simple 32-bit checksum (addition with a 32 bit accumulator)
            SUM = 0xf,
            _,
        },
        /// Locally perform a byte reverse on the sniffed data, before feeding into checksum. Note that the sniff hardware is downstream of the DMA channel byteswap performed in the read master: if channel CTRL_BSWAP and SNIFF_CTRL_BSWAP are both enabled, their effects cancel from the sniffer's point of view.
        BSWAP: u1,
        /// If set, the result appears bit-reversed when read. This does not affect the way the checksum is calculated; the result is transformed on-the-fly between the result register and the bus.
        OUT_REV: u1,
        /// If set, the result appears inverted (bitwise complement) when read. This does not affect the way the checksum is calculated; the result is transformed on-the-fly between the result register and the bus.
        OUT_INV: u1,
        padding: u20 = 0,
    }),
    /// Data accumulator for sniff hardware
    /// offset: 0x438
    SNIFF_DATA: mmio.Mmio(packed struct(u32) {
        /// Write an initial seed value here before starting a DMA transfer on the channel indicated by SNIFF_CTRL_DMACH. The hardware will update this register each time it observes a read from the indicated channel. Once the channel completes, the final result can be read from this register.
        SNIFF_DATA: u32,
    }),
    /// offset: 0x43c
    reserved1084: [4]u8,
    /// Debug RAF, WAF, TDF levels
    /// offset: 0x440
    FIFO_LEVELS: mmio.Mmio(packed struct(u32) {
        /// Current Transfer-Data-FIFO fill level
        TDF_LVL: u8,
        /// Current Write-Address-FIFO fill level
        WAF_LVL: u8,
        /// Current Read-Address-FIFO fill level
        RAF_LVL: u8,
        padding: u8 = 0,
    }),
    /// Abort an in-progress transfer sequence on one or more channels
    /// offset: 0x444
    CHAN_ABORT: mmio.Mmio(packed struct(u32) {
        /// Each bit corresponds to a channel. Writing a 1 aborts whatever transfer sequence is in progress on that channel. The bit will remain high until any in-flight transfers have been flushed through the address and data FIFOs. After writing, this register must be polled until it returns all-zero. Until this point, it is unsafe to restart the channel.
        CHAN_ABORT: u16,
        padding: u16 = 0,
    }),
    /// The number of channels this DMA instance is equipped with. This DMA supports up to 16 hardware channels, but can be configured with as few as one, to minimise silicon area.
    /// offset: 0x448
    N_CHANNELS: mmio.Mmio(packed struct(u32) {
        N_CHANNELS: u5,
        padding: u27 = 0,
    }),
    /// offset: 0x44c
    reserved1100: [948]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0x800
    CH0_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH0_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0x804
    CH0_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH0_DBG_TCR: u32,
    }),
    /// offset: 0x808
    reserved2056: [56]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0x840
    CH1_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH1_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0x844
    CH1_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH1_DBG_TCR: u32,
    }),
    /// offset: 0x848
    reserved2120: [56]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0x880
    CH2_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH2_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0x884
    CH2_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH2_DBG_TCR: u32,
    }),
    /// offset: 0x888
    reserved2184: [56]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0x8c0
    CH3_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH3_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0x8c4
    CH3_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH3_DBG_TCR: u32,
    }),
    /// offset: 0x8c8
    reserved2248: [56]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0x900
    CH4_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH4_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0x904
    CH4_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH4_DBG_TCR: u32,
    }),
    /// offset: 0x908
    reserved2312: [56]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0x940
    CH5_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH5_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0x944
    CH5_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH5_DBG_TCR: u32,
    }),
    /// offset: 0x948
    reserved2376: [56]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0x980
    CH6_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH6_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0x984
    CH6_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH6_DBG_TCR: u32,
    }),
    /// offset: 0x988
    reserved2440: [56]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0x9c0
    CH7_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH7_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0x9c4
    CH7_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH7_DBG_TCR: u32,
    }),
    /// offset: 0x9c8
    reserved2504: [56]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0xa00
    CH8_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH8_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0xa04
    CH8_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH8_DBG_TCR: u32,
    }),
    /// offset: 0xa08
    reserved2568: [56]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0xa40
    CH9_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH9_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0xa44
    CH9_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH9_DBG_TCR: u32,
    }),
    /// offset: 0xa48
    reserved2632: [56]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0xa80
    CH10_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH10_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0xa84
    CH10_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH10_DBG_TCR: u32,
    }),
    /// offset: 0xa88
    reserved2696: [56]u8,
    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    /// offset: 0xac0
    CH11_DBG_CTDREQ: mmio.Mmio(packed struct(u32) {
        CH11_DBG_CTDREQ: u6,
        padding: u26 = 0,
    }),
    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    /// offset: 0xac4
    CH11_DBG_TCR: mmio.Mmio(packed struct(u32) {
        CH11_DBG_TCR: u32,
    }),
};
