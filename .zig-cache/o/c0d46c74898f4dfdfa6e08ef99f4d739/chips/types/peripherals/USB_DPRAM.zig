const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// DPRAM layout for USB device.
pub const USB_DPRAM = extern struct {
    pub const EndpointType = enum(u2) {
        control = 0x0,
        isochronous = 0x1,
        bulk = 0x2,
        interrupt = 0x3,
    };

    /// Bytes 0-3 of the SETUP packet from the host.
    /// offset: 0x00
    SETUP_PACKET_LOW: mmio.Mmio(packed struct(u32) {
        BMREQUESTTYPE: u8,
        BREQUEST: u8,
        WVALUE: u16,
    }),
    /// Bytes 4-7 of the setup packet from the host.
    /// offset: 0x04
    SETUP_PACKET_HIGH: mmio.Mmio(packed struct(u32) {
        WINDEX: u16,
        WLENGTH: u16,
    }),
    /// offset: 0x08
    EP1_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x0c
    EP1_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x10
    EP2_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x14
    EP2_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x18
    EP3_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x1c
    EP3_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x20
    EP4_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x24
    EP4_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x28
    EP5_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x2c
    EP5_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x30
    EP6_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x34
    EP6_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x38
    EP7_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x3c
    EP7_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x40
    EP8_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x44
    EP8_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x48
    EP9_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x4c
    EP9_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x50
    EP10_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x54
    EP10_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x58
    EP11_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x5c
    EP11_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x60
    EP12_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x64
    EP12_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x68
    EP13_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x6c
    EP13_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x70
    EP14_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x74
    EP14_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x78
    EP15_IN_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// offset: 0x7c
    EP15_OUT_CONTROL: mmio.Mmio(packed struct(u32) {
        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        BUFFER_ADDRESS: u16,
        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        INTERRUPT_ON_NAK: u1,
        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        INTERRUPT_ON_STALL: u1,
        reserved26: u8 = 0,
        ENDPOINT_TYPE: EndpointType,
        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        INTERRUPT_PER_DOUBLE_BUFF: u1,
        /// Trigger an interrupt each time a buffer is done.
        INTERRUPT_PER_BUFF: u1,
        /// This endpoint is double buffered.
        DOUBLE_BUFFERED: u1,
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        ENABLE: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0x80
    EP0_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0x84
    EP0_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0x88
    EP1_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0x8c
    EP1_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0x90
    EP2_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0x94
    EP2_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0x98
    EP3_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0x9c
    EP3_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xa0
    EP4_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xa4
    EP4_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xa8
    EP5_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xac
    EP5_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xb0
    EP6_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xb4
    EP6_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xb8
    EP7_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xbc
    EP7_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xc0
    EP8_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xc4
    EP8_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xc8
    EP9_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xcc
    EP9_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xd0
    EP10_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xd4
    EP10_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xd8
    EP11_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xdc
    EP11_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xe0
    EP12_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xe4
    EP12_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xe8
    EP13_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xec
    EP13_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xf0
    EP14_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xf4
    EP14_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xf8
    EP15_IN_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    /// offset: 0xfc
    EP15_OUT_BUFFER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// The length of the data in buffer 0.
        LENGTH_0: u10,
        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_0: u1,
        /// Reply with a stall (valid for both buffers).
        STALL: u1,
        /// Reset the buffer selector to buffer 0.
        RESET: u1,
        /// The data pid of buffer 0.
        PID_0: u1,
        /// Buffer 0 is the last buffer of the transfer.
        LAST_0: u1,
        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_0: u1,
        /// The length of the data in buffer 1.
        LENGTH_1: u10,
        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        AVAILABLE_1: u1,
        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint. For a non Isochronous endpoint the offset is always 64 bytes.
        DOUBLE_BUFFER_ISO_OFFSET: enum(u2) {
            @"128" = 0x0,
            @"256" = 0x1,
            @"512" = 0x2,
            @"1024" = 0x3,
        },
        /// The data pid of buffer 1.
        PID_1: u1,
        /// Buffer 1 is the last buffer of the transfer.
        LAST_1: u1,
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        FULL_1: u1,
    }),
};
