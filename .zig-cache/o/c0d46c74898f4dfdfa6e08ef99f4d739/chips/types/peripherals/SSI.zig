const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// DW_apb_ssi has the following features: * APB interface – Allows for easy integration into a DesignWare Synthesizable Components for AMBA 2 implementation. * APB3 and APB4 protocol support. * Scalable APB data bus width – Supports APB data bus widths of 8, 16, and 32 bits. * Serial-master or serial-slave operation – Enables serial communication with serial-master or serial-slave peripheral devices. * Programmable Dual/Quad/Octal SPI support in Master Mode. * Dual Data Rate (DDR) and Read Data Strobe (RDS) Support - Enables the DW_apb_ssi master to perform operations with the device in DDR and RDS modes when working in Dual/Quad/Octal mode of operation. * Data Mask Support - Enables the DW_apb_ssi to selectively update the bytes in the device. This feature is applicable only in enhanced SPI modes. * eXecute-In-Place (XIP) support - Enables the DW_apb_ssi master to behave as a memory mapped I/O and fetches the data from the device based on the APB read request. This feature is applicable only in enhanced SPI modes. * DMA Controller Interface – Enables the DW_apb_ssi to interface to a DMA controller over the bus using a handshaking interface for transfer requests. * Independent masking of interrupts – Master collision, transmit FIFO overflow, transmit FIFO empty, receive FIFO full, receive FIFO underflow, and receive FIFO overflow interrupts can all be masked independently. * Multi-master contention detection – Informs the processor of multiple serial-master accesses on the serial bus. * Bypass of meta-stability flip-flops for synchronous clocks – When the APB clock (pclk) and the DW_apb_ssi serial clock (ssi_clk) are synchronous, meta-stable flip-flops are not used when transferring control signals across these clock domains. * Programmable delay on the sample time of the received serial data bit (rxd); enables programmable control of routing delays resulting in higher serial data-bit rates. * Programmable features: - Serial interface operation – Choice of Motorola SPI, Texas Instruments Synchronous Serial Protocol or National Semiconductor Microwire. - Clock bit-rate – Dynamic control of the serial bit rate of the data transfer; used in only serial-master mode of operation. - Data Item size (4 to 32 bits) – Item size of each data transfer under the control of the programmer. * Configured features: - FIFO depth – 16 words deep. The FIFO width is fixed at 32 bits. - 1 slave select output. - Hardware slave-select – Dedicated hardware slave-select line. - Combined interrupt line - one combined interrupt line from the DW_apb_ssi to the interrupt controller. - Interrupt polarity – active high interrupt lines. - Serial clock polarity – low serial-clock polarity directly after reset. - Serial clock phase – capture on first edge of serial-clock directly after reset.
pub const SSI = extern struct {
    /// Control register 0
    /// offset: 0x00
    CTRLR0: mmio.Mmio(packed struct(u32) {
        /// Data frame size
        DFS: u4,
        /// Frame format
        FRF: u2,
        /// Serial clock phase
        SCPH: u1,
        /// Serial clock polarity
        SCPOL: u1,
        /// Transfer mode
        TMOD: enum(u2) {
            /// Both transmit and receive
            TX_AND_RX = 0x0,
            /// Transmit only (not for FRF == 0, standard SPI mode)
            TX_ONLY = 0x1,
            /// Receive only (not for FRF == 0, standard SPI mode)
            RX_ONLY = 0x2,
            /// EEPROM read mode (TX then RX; RX starts after control data TX'd)
            EEPROM_READ = 0x3,
        },
        /// Slave output enable
        SLV_OE: u1,
        /// Shift register loop (test mode)
        SRL: u1,
        /// Control frame size Value of n -> n+1 clocks per frame.
        CFS: u4,
        /// Data frame size in 32b transfer mode Value of n -> n+1 clocks per frame.
        DFS_32: u5,
        /// SPI frame format
        SPI_FRF: enum(u2) {
            /// Standard 1-bit SPI frame format; 1 bit per SCK, full-duplex
            STD = 0x0,
            /// Dual-SPI frame format; two bits per SCK, half-duplex
            DUAL = 0x1,
            /// Quad-SPI frame format; four bits per SCK, half-duplex
            QUAD = 0x2,
            _,
        },
        reserved24: u1 = 0,
        /// Slave select toggle enable
        SSTE: u1,
        padding: u7 = 0,
    }),
    /// Master Control register 1
    /// offset: 0x04
    CTRLR1: mmio.Mmio(packed struct(u32) {
        /// Number of data frames
        NDF: u16,
        padding: u16 = 0,
    }),
    /// SSI Enable
    /// offset: 0x08
    SSIENR: mmio.Mmio(packed struct(u32) {
        /// SSI enable
        SSI_EN: u1,
        padding: u31 = 0,
    }),
    /// Microwire Control
    /// offset: 0x0c
    MWCR: mmio.Mmio(packed struct(u32) {
        /// Microwire transfer mode
        MWMOD: u1,
        /// Microwire control
        MDD: u1,
        /// Microwire handshaking
        MHS: u1,
        padding: u29 = 0,
    }),
    /// Slave enable
    /// offset: 0x10
    SER: mmio.Mmio(packed struct(u32) {
        /// For each bit: 0 -> slave not selected 1 -> slave selected
        SER: u1,
        padding: u31 = 0,
    }),
    /// Baud rate
    /// offset: 0x14
    BAUDR: mmio.Mmio(packed struct(u32) {
        /// SSI clock divider
        SCKDV: u16,
        padding: u16 = 0,
    }),
    /// TX FIFO threshold level
    /// offset: 0x18
    TXFTLR: mmio.Mmio(packed struct(u32) {
        /// Transmit FIFO threshold
        TFT: u8,
        padding: u24 = 0,
    }),
    /// RX FIFO threshold level
    /// offset: 0x1c
    RXFTLR: mmio.Mmio(packed struct(u32) {
        /// Receive FIFO threshold
        RFT: u8,
        padding: u24 = 0,
    }),
    /// TX FIFO level
    /// offset: 0x20
    TXFLR: mmio.Mmio(packed struct(u32) {
        /// Transmit FIFO level
        TFTFL: u8,
        padding: u24 = 0,
    }),
    /// RX FIFO level
    /// offset: 0x24
    RXFLR: mmio.Mmio(packed struct(u32) {
        /// Receive FIFO level
        RXTFL: u8,
        padding: u24 = 0,
    }),
    /// Status register
    /// offset: 0x28
    SR: mmio.Mmio(packed struct(u32) {
        /// SSI busy flag
        BUSY: u1,
        /// Transmit FIFO not full
        TFNF: u1,
        /// Transmit FIFO empty
        TFE: u1,
        /// Receive FIFO not empty
        RFNE: u1,
        /// Receive FIFO full
        RFF: u1,
        /// Transmission error
        TXE: u1,
        /// Data collision error
        DCOL: u1,
        padding: u25 = 0,
    }),
    /// Interrupt mask
    /// offset: 0x2c
    IMR: mmio.Mmio(packed struct(u32) {
        /// Transmit FIFO empty interrupt mask
        TXEIM: u1,
        /// Transmit FIFO overflow interrupt mask
        TXOIM: u1,
        /// Receive FIFO underflow interrupt mask
        RXUIM: u1,
        /// Receive FIFO overflow interrupt mask
        RXOIM: u1,
        /// Receive FIFO full interrupt mask
        RXFIM: u1,
        /// Multi-master contention interrupt mask
        MSTIM: u1,
        padding: u26 = 0,
    }),
    /// Interrupt status
    /// offset: 0x30
    ISR: mmio.Mmio(packed struct(u32) {
        /// Transmit FIFO empty interrupt status
        TXEIS: u1,
        /// Transmit FIFO overflow interrupt status
        TXOIS: u1,
        /// Receive FIFO underflow interrupt status
        RXUIS: u1,
        /// Receive FIFO overflow interrupt status
        RXOIS: u1,
        /// Receive FIFO full interrupt status
        RXFIS: u1,
        /// Multi-master contention interrupt status
        MSTIS: u1,
        padding: u26 = 0,
    }),
    /// Raw interrupt status
    /// offset: 0x34
    RISR: mmio.Mmio(packed struct(u32) {
        /// Transmit FIFO empty raw interrupt status
        TXEIR: u1,
        /// Transmit FIFO overflow raw interrupt status
        TXOIR: u1,
        /// Receive FIFO underflow raw interrupt status
        RXUIR: u1,
        /// Receive FIFO overflow raw interrupt status
        RXOIR: u1,
        /// Receive FIFO full raw interrupt status
        RXFIR: u1,
        /// Multi-master contention raw interrupt status
        MSTIR: u1,
        padding: u26 = 0,
    }),
    /// TX FIFO overflow interrupt clear
    /// offset: 0x38
    TXOICR: mmio.Mmio(packed struct(u32) {
        /// Clear-on-read transmit FIFO overflow interrupt
        TXOICR: u1,
        padding: u31 = 0,
    }),
    /// RX FIFO overflow interrupt clear
    /// offset: 0x3c
    RXOICR: mmio.Mmio(packed struct(u32) {
        /// Clear-on-read receive FIFO overflow interrupt
        RXOICR: u1,
        padding: u31 = 0,
    }),
    /// RX FIFO underflow interrupt clear
    /// offset: 0x40
    RXUICR: mmio.Mmio(packed struct(u32) {
        /// Clear-on-read receive FIFO underflow interrupt
        RXUICR: u1,
        padding: u31 = 0,
    }),
    /// Multi-master interrupt clear
    /// offset: 0x44
    MSTICR: mmio.Mmio(packed struct(u32) {
        /// Clear-on-read multi-master contention interrupt
        MSTICR: u1,
        padding: u31 = 0,
    }),
    /// Interrupt clear
    /// offset: 0x48
    ICR: mmio.Mmio(packed struct(u32) {
        /// Clear-on-read all active interrupts
        ICR: u1,
        padding: u31 = 0,
    }),
    /// DMA control
    /// offset: 0x4c
    DMACR: mmio.Mmio(packed struct(u32) {
        /// Receive DMA enable
        RDMAE: u1,
        /// Transmit DMA enable
        TDMAE: u1,
        padding: u30 = 0,
    }),
    /// DMA TX data level
    /// offset: 0x50
    DMATDLR: mmio.Mmio(packed struct(u32) {
        /// Transmit data watermark level
        DMATDL: u8,
        padding: u24 = 0,
    }),
    /// DMA RX data level
    /// offset: 0x54
    DMARDLR: mmio.Mmio(packed struct(u32) {
        /// Receive data watermark level (DMARDLR+1)
        DMARDL: u8,
        padding: u24 = 0,
    }),
    /// Identification register
    /// offset: 0x58
    IDR: mmio.Mmio(packed struct(u32) {
        /// Peripheral dentification code
        IDCODE: u32,
    }),
    /// Version ID
    /// offset: 0x5c
    SSI_VERSION_ID: mmio.Mmio(packed struct(u32) {
        /// SNPS component version (format X.YY)
        SSI_COMP_VERSION: u32,
    }),
    /// Data Register 0 (of 36)
    /// offset: 0x60
    DR0: mmio.Mmio(packed struct(u32) {
        /// First data register of 36
        DR: u32,
    }),
    /// offset: 0x64
    reserved100: [140]u8,
    /// RX sample delay
    /// offset: 0xf0
    RX_SAMPLE_DLY: mmio.Mmio(packed struct(u32) {
        /// RXD sample delay (in SCLK cycles)
        RSD: u8,
        padding: u24 = 0,
    }),
    /// SPI control
    /// offset: 0xf4
    SPI_CTRLR0: mmio.Mmio(packed struct(u32) {
        /// Address and instruction transfer format
        TRANS_TYPE: enum(u2) {
            /// Command and address both in standard SPI frame format
            @"1C1A" = 0x0,
            /// Command in standard SPI format, address in format specified by FRF
            @"1C2A" = 0x1,
            /// Command and address both in format specified by FRF (e.g. Dual-SPI)
            @"2C2A" = 0x2,
            _,
        },
        /// Address length (0b-60b in 4b increments)
        ADDR_L: u4,
        reserved8: u2 = 0,
        /// Instruction length (0/4/8/16b)
        INST_L: enum(u2) {
            /// No instruction
            NONE = 0x0,
            /// 4-bit instruction
            @"4B" = 0x1,
            /// 8-bit instruction
            @"8B" = 0x2,
            /// 16-bit instruction
            @"16B" = 0x3,
        },
        reserved11: u1 = 0,
        /// Wait cycles between control frame transmit and data reception (in SCLK cycles)
        WAIT_CYCLES: u5,
        /// SPI DDR transfer enable
        SPI_DDR_EN: u1,
        /// Instruction DDR transfer enable
        INST_DDR_EN: u1,
        /// Read data strobe enable
        SPI_RXDS_EN: u1,
        reserved24: u5 = 0,
        /// SPI Command to send in XIP mode (INST_L = 8-bit) or to append to Address (INST_L = 0-bit)
        XIP_CMD: u8,
    }),
    /// TX drive edge
    /// offset: 0xf8
    TXD_DRIVE_EDGE: mmio.Mmio(packed struct(u32) {
        /// TXD drive edge
        TDE: u8,
        padding: u24 = 0,
    }),
};
