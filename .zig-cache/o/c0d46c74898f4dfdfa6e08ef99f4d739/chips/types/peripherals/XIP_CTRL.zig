const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// QSPI flash execute-in-place block
pub const XIP_CTRL = extern struct {
    /// Cache control
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u32) {
        /// When 1, enable the cache. When the cache is disabled, all XIP accesses will go straight to the flash, without querying the cache. When enabled, cacheable XIP accesses will query the cache, and the flash will not be accessed if the tag matches and the valid bit is set. If the cache is enabled, cache-as-SRAM accesses have no effect on the cache data RAM, and will produce a bus error response.
        EN: u1,
        /// When 1, writes to any alias other than 0x0 (caching, allocating) will produce a bus fault. When 0, these writes are silently ignored. In either case, writes to the 0x0 alias will deallocate on tag match, as usual.
        ERR_BADWRITE: u1,
        reserved3: u1 = 0,
        /// When 1, the cache memories are powered down. They retain state, but can not be accessed. This reduces static power dissipation. Writing 1 to this bit forces CTRL_EN to 0, i.e. the cache cannot be enabled when powered down. Cache-as-SRAM accesses will produce a bus error response when the cache is powered down.
        POWER_DOWN: u1,
        padding: u28 = 0,
    }),
    /// Cache Flush control
    /// offset: 0x04
    FLUSH: mmio.Mmio(packed struct(u32) {
        /// Write 1 to flush the cache. This clears the tag memory, but the data memory retains its contents. (This means cache-as-SRAM contents is not affected by flush or reset.) Reading will hold the bus (stall the processor) until the flush completes. Alternatively STAT can be polled until completion.
        FLUSH: u1,
        padding: u31 = 0,
    }),
    /// Cache Status
    /// offset: 0x08
    STAT: mmio.Mmio(packed struct(u32) {
        /// Reads as 0 while a cache flush is in progress, and 1 otherwise. The cache is flushed whenever the XIP block is reset, and also when requested via the FLUSH register.
        FLUSH_READY: u1,
        /// When 1, indicates the XIP streaming FIFO is completely empty.
        FIFO_EMPTY: u1,
        /// When 1, indicates the XIP streaming FIFO is completely full. The streaming FIFO is 2 entries deep, so the full and empty flag allow its level to be ascertained.
        FIFO_FULL: u1,
        padding: u29 = 0,
    }),
    /// Cache Hit counter
    /// offset: 0x0c
    CTR_HIT: mmio.Mmio(packed struct(u32) {
        /// A 32 bit saturating counter that increments upon each cache hit, i.e. when an XIP access is serviced directly from cached data. Write any value to clear.
        CTR_HIT: u32,
    }),
    /// Cache Access counter
    /// offset: 0x10
    CTR_ACC: mmio.Mmio(packed struct(u32) {
        /// A 32 bit saturating counter that increments upon each XIP access, whether the cache is hit or not. This includes noncacheable accesses. Write any value to clear.
        CTR_ACC: u32,
    }),
    /// FIFO stream address
    /// offset: 0x14
    STREAM_ADDR: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// The address of the next word to be streamed from flash to the streaming FIFO. Increments automatically after each flash access. Write the initial access address here before starting a streaming read.
        STREAM_ADDR: u30,
    }),
    /// FIFO stream control
    /// offset: 0x18
    STREAM_CTR: mmio.Mmio(packed struct(u32) {
        /// Write a nonzero value to start a streaming read. This will then progress in the background, using flash idle cycles to transfer a linear data block from flash to the streaming FIFO. Decrements automatically (1 at a time) as the stream progresses, and halts on reaching 0. Write 0 to halt an in-progress stream, and discard any in-flight read, so that a new stream can immediately be started (after draining the FIFO and reinitialising STREAM_ADDR)
        STREAM_CTR: u22,
        padding: u10 = 0,
    }),
    /// FIFO stream data
    /// offset: 0x1c
    STREAM_FIFO: mmio.Mmio(packed struct(u32) {
        /// Streamed data is buffered here, for retrieval by the system DMA. This FIFO can also be accessed via the XIP_AUX slave, to avoid exposing the DMA to bus stalls caused by other XIP traffic.
        STREAM_FIFO: u32,
    }),
};
