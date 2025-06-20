const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const SPI0 = extern struct {
    /// Control register 0, SSPCR0 on page 3-4
    /// offset: 0x00
    SSPCR0: mmio.Mmio(packed struct(u32) {
        /// Data Size Select: 0000 Reserved, undefined operation. 0001 Reserved, undefined operation. 0010 Reserved, undefined operation. 0011 4-bit data. 0100 5-bit data. 0101 6-bit data. 0110 7-bit data. 0111 8-bit data. 1000 9-bit data. 1001 10-bit data. 1010 11-bit data. 1011 12-bit data. 1100 13-bit data. 1101 14-bit data. 1110 15-bit data. 1111 16-bit data.
        DSS: u4,
        /// Frame format: 00 Motorola SPI frame format. 01 TI synchronous serial frame format. 10 National Microwire frame format. 11 Reserved, undefined operation.
        FRF: u2,
        /// SSPCLKOUT polarity, applicable to Motorola SPI frame format only. See Motorola SPI frame format on page 2-10.
        SPO: u1,
        /// SSPCLKOUT phase, applicable to Motorola SPI frame format only. See Motorola SPI frame format on page 2-10.
        SPH: u1,
        /// Serial clock rate. The value SCR is used to generate the transmit and receive bit rate of the PrimeCell SSP. The bit rate is: F SSPCLK CPSDVSR x (1+SCR) where CPSDVSR is an even value from 2-254, programmed through the SSPCPSR register and SCR is a value from 0-255.
        SCR: u8,
        padding: u16 = 0,
    }),
    /// Control register 1, SSPCR1 on page 3-5
    /// offset: 0x04
    SSPCR1: mmio.Mmio(packed struct(u32) {
        /// Loop back mode: 0 Normal serial port operation enabled. 1 Output of transmit serial shifter is connected to input of receive serial shifter internally.
        LBM: u1,
        /// Synchronous serial port enable: 0 SSP operation disabled. 1 SSP operation enabled.
        SSE: u1,
        /// Master or slave mode select. This bit can be modified only when the PrimeCell SSP is disabled, SSE=0: 0 Device configured as master, default. 1 Device configured as slave.
        MS: u1,
        /// Slave-mode output disable. This bit is relevant only in the slave mode, MS=1. In multiple-slave systems, it is possible for an PrimeCell SSP master to broadcast a message to all slaves in the system while ensuring that only one slave drives data onto its serial output line. In such systems the RXD lines from multiple slaves could be tied together. To operate in such systems, the SOD bit can be set if the PrimeCell SSP slave is not supposed to drive the SSPTXD line: 0 SSP can drive the SSPTXD output in slave mode. 1 SSP must not drive the SSPTXD output in slave mode.
        SOD: u1,
        padding: u28 = 0,
    }),
    /// Data register, SSPDR on page 3-6
    /// offset: 0x08
    SSPDR: mmio.Mmio(packed struct(u32) {
        /// Transmit/Receive FIFO: Read Receive FIFO. Write Transmit FIFO. You must right-justify data when the PrimeCell SSP is programmed for a data size that is less than 16 bits. Unused bits at the top are ignored by transmit logic. The receive logic automatically right-justifies.
        DATA: u16,
        padding: u16 = 0,
    }),
    /// Status register, SSPSR on page 3-7
    /// offset: 0x0c
    SSPSR: mmio.Mmio(packed struct(u32) {
        /// Transmit FIFO empty, RO: 0 Transmit FIFO is not empty. 1 Transmit FIFO is empty.
        TFE: u1,
        /// Transmit FIFO not full, RO: 0 Transmit FIFO is full. 1 Transmit FIFO is not full.
        TNF: u1,
        /// Receive FIFO not empty, RO: 0 Receive FIFO is empty. 1 Receive FIFO is not empty.
        RNE: u1,
        /// Receive FIFO full, RO: 0 Receive FIFO is not full. 1 Receive FIFO is full.
        RFF: u1,
        /// PrimeCell SSP busy flag, RO: 0 SSP is idle. 1 SSP is currently transmitting and/or receiving a frame or the transmit FIFO is not empty.
        BSY: u1,
        padding: u27 = 0,
    }),
    /// Clock prescale register, SSPCPSR on page 3-8
    /// offset: 0x10
    SSPCPSR: mmio.Mmio(packed struct(u32) {
        /// Clock prescale divisor. Must be an even number from 2-254, depending on the frequency of SSPCLK. The least significant bit always returns zero on reads.
        CPSDVSR: u8,
        padding: u24 = 0,
    }),
    /// Interrupt mask set or clear register, SSPIMSC on page 3-9
    /// offset: 0x14
    SSPIMSC: mmio.Mmio(packed struct(u32) {
        /// Receive overrun interrupt mask: 0 Receive FIFO written to while full condition interrupt is masked. 1 Receive FIFO written to while full condition interrupt is not masked.
        RORIM: u1,
        /// Receive timeout interrupt mask: 0 Receive FIFO not empty and no read prior to timeout period interrupt is masked. 1 Receive FIFO not empty and no read prior to timeout period interrupt is not masked.
        RTIM: u1,
        /// Receive FIFO interrupt mask: 0 Receive FIFO half full or less condition interrupt is masked. 1 Receive FIFO half full or less condition interrupt is not masked.
        RXIM: u1,
        /// Transmit FIFO interrupt mask: 0 Transmit FIFO half empty or less condition interrupt is masked. 1 Transmit FIFO half empty or less condition interrupt is not masked.
        TXIM: u1,
        padding: u28 = 0,
    }),
    /// Raw interrupt status register, SSPRIS on page 3-10
    /// offset: 0x18
    SSPRIS: mmio.Mmio(packed struct(u32) {
        /// Gives the raw interrupt state, prior to masking, of the SSPRORINTR interrupt
        RORRIS: u1,
        /// Gives the raw interrupt state, prior to masking, of the SSPRTINTR interrupt
        RTRIS: u1,
        /// Gives the raw interrupt state, prior to masking, of the SSPRXINTR interrupt
        RXRIS: u1,
        /// Gives the raw interrupt state, prior to masking, of the SSPTXINTR interrupt
        TXRIS: u1,
        padding: u28 = 0,
    }),
    /// Masked interrupt status register, SSPMIS on page 3-11
    /// offset: 0x1c
    SSPMIS: mmio.Mmio(packed struct(u32) {
        /// Gives the receive over run masked interrupt status, after masking, of the SSPRORINTR interrupt
        RORMIS: u1,
        /// Gives the receive timeout masked interrupt state, after masking, of the SSPRTINTR interrupt
        RTMIS: u1,
        /// Gives the receive FIFO masked interrupt state, after masking, of the SSPRXINTR interrupt
        RXMIS: u1,
        /// Gives the transmit FIFO masked interrupt state, after masking, of the SSPTXINTR interrupt
        TXMIS: u1,
        padding: u28 = 0,
    }),
    /// Interrupt clear register, SSPICR on page 3-11
    /// offset: 0x20
    SSPICR: mmio.Mmio(packed struct(u32) {
        /// Clears the SSPRORINTR interrupt
        RORIC: u1,
        /// Clears the SSPRTINTR interrupt
        RTIC: u1,
        padding: u30 = 0,
    }),
    /// DMA control register, SSPDMACR on page 3-12
    /// offset: 0x24
    SSPDMACR: mmio.Mmio(packed struct(u32) {
        /// Receive DMA Enable. If this bit is set to 1, DMA for the receive FIFO is enabled.
        RXDMAE: u1,
        /// Transmit DMA Enable. If this bit is set to 1, DMA for the transmit FIFO is enabled.
        TXDMAE: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x28
    reserved40: [4024]u8,
    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    /// offset: 0xfe0
    SSPPERIPHID0: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x22
        PARTNUMBER0: u8,
        padding: u24 = 0,
    }),
    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    /// offset: 0xfe4
    SSPPERIPHID1: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x0
        PARTNUMBER1: u4,
        /// These bits read back as 0x1
        DESIGNER0: u4,
        padding: u24 = 0,
    }),
    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    /// offset: 0xfe8
    SSPPERIPHID2: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x4
        DESIGNER1: u4,
        /// These bits return the peripheral revision
        REVISION: u4,
        padding: u24 = 0,
    }),
    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    /// offset: 0xfec
    SSPPERIPHID3: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x00
        CONFIGURATION: u8,
        padding: u24 = 0,
    }),
    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    /// offset: 0xff0
    SSPPCELLID0: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x0D
        SSPPCELLID0: u8,
        padding: u24 = 0,
    }),
    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    /// offset: 0xff4
    SSPPCELLID1: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0xF0
        SSPPCELLID1: u8,
        padding: u24 = 0,
    }),
    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    /// offset: 0xff8
    SSPPCELLID2: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x05
        SSPPCELLID2: u8,
        padding: u24 = 0,
    }),
    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    /// offset: 0xffc
    SSPPCELLID3: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0xB1
        SSPPCELLID3: u8,
        padding: u24 = 0,
    }),
};
