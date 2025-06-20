const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const UART0 = extern struct {
    /// Data Register, UARTDR
    /// offset: 0x00
    UARTDR: mmio.Mmio(packed struct(u32) {
        /// Receive (read) data character. Transmit (write) data character.
        DATA: u8,
        /// Framing error. When set to 1, it indicates that the received character did not have a valid stop bit (a valid stop bit is 1). In FIFO mode, this error is associated with the character at the top of the FIFO.
        FE: u1,
        /// Parity error. When set to 1, it indicates that the parity of the received data character does not match the parity that the EPS and SPS bits in the Line Control Register, UARTLCR_H. In FIFO mode, this error is associated with the character at the top of the FIFO.
        PE: u1,
        /// Break error. This bit is set to 1 if a break condition was detected, indicating that the received data input was held LOW for longer than a full-word transmission time (defined as start, data, parity and stop bits). In FIFO mode, this error is associated with the character at the top of the FIFO. When a break occurs, only one 0 character is loaded into the FIFO. The next character is only enabled after the receive data input goes to a 1 (marking state), and the next valid start bit is received.
        BE: u1,
        /// Overrun error. This bit is set to 1 if data is received and the receive FIFO is already full. This is cleared to 0 once there is an empty space in the FIFO and a new character can be written to it.
        OE: u1,
        padding: u20 = 0,
    }),
    /// Receive Status Register/Error Clear Register, UARTRSR/UARTECR
    /// offset: 0x04
    UARTRSR: mmio.Mmio(packed struct(u32) {
        /// Framing error. When set to 1, it indicates that the received character did not have a valid stop bit (a valid stop bit is 1). This bit is cleared to 0 by a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO.
        FE: u1,
        /// Parity error. When set to 1, it indicates that the parity of the received data character does not match the parity that the EPS and SPS bits in the Line Control Register, UARTLCR_H. This bit is cleared to 0 by a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO.
        PE: u1,
        /// Break error. This bit is set to 1 if a break condition was detected, indicating that the received data input was held LOW for longer than a full-word transmission time (defined as start, data, parity, and stop bits). This bit is cleared to 0 after a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO. When a break occurs, only one 0 character is loaded into the FIFO. The next character is only enabled after the receive data input goes to a 1 (marking state) and the next valid start bit is received.
        BE: u1,
        /// Overrun error. This bit is set to 1 if data is received and the FIFO is already full. This bit is cleared to 0 by a write to UARTECR. The FIFO contents remain valid because no more data is written when the FIFO is full, only the contents of the shift register are overwritten. The CPU must now read the data, to empty the FIFO.
        OE: u1,
        padding: u28 = 0,
    }),
    /// offset: 0x08
    reserved8: [16]u8,
    /// Flag Register, UARTFR
    /// offset: 0x18
    UARTFR: mmio.Mmio(packed struct(u32) {
        /// Clear to send. This bit is the complement of the UART clear to send, nUARTCTS, modem status input. That is, the bit is 1 when nUARTCTS is LOW.
        CTS: u1,
        /// Data set ready. This bit is the complement of the UART data set ready, nUARTDSR, modem status input. That is, the bit is 1 when nUARTDSR is LOW.
        DSR: u1,
        /// Data carrier detect. This bit is the complement of the UART data carrier detect, nUARTDCD, modem status input. That is, the bit is 1 when nUARTDCD is LOW.
        DCD: u1,
        /// UART busy. If this bit is set to 1, the UART is busy transmitting data. This bit remains set until the complete byte, including all the stop bits, has been sent from the shift register. This bit is set as soon as the transmit FIFO becomes non-empty, regardless of whether the UART is enabled or not.
        BUSY: u1,
        /// Receive FIFO empty. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the receive holding register is empty. If the FIFO is enabled, the RXFE bit is set when the receive FIFO is empty.
        RXFE: u1,
        /// Transmit FIFO full. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the transmit holding register is full. If the FIFO is enabled, the TXFF bit is set when the transmit FIFO is full.
        TXFF: u1,
        /// Receive FIFO full. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the receive holding register is full. If the FIFO is enabled, the RXFF bit is set when the receive FIFO is full.
        RXFF: u1,
        /// Transmit FIFO empty. The meaning of this bit depends on the state of the FEN bit in the Line Control Register, UARTLCR_H. If the FIFO is disabled, this bit is set when the transmit holding register is empty. If the FIFO is enabled, the TXFE bit is set when the transmit FIFO is empty. This bit does not indicate if there is data in the transmit shift register.
        TXFE: u1,
        /// Ring indicator. This bit is the complement of the UART ring indicator, nUARTRI, modem status input. That is, the bit is 1 when nUARTRI is LOW.
        RI: u1,
        padding: u23 = 0,
    }),
    /// offset: 0x1c
    reserved28: [4]u8,
    /// IrDA Low-Power Counter Register, UARTILPR
    /// offset: 0x20
    UARTILPR: mmio.Mmio(packed struct(u32) {
        /// 8-bit low-power divisor value. These bits are cleared to 0 at reset.
        ILPDVSR: u8,
        padding: u24 = 0,
    }),
    /// Integer Baud Rate Register, UARTIBRD
    /// offset: 0x24
    UARTIBRD: mmio.Mmio(packed struct(u32) {
        /// The integer baud rate divisor. These bits are cleared to 0 on reset.
        BAUD_DIVINT: u16,
        padding: u16 = 0,
    }),
    /// Fractional Baud Rate Register, UARTFBRD
    /// offset: 0x28
    UARTFBRD: mmio.Mmio(packed struct(u32) {
        /// The fractional baud rate divisor. These bits are cleared to 0 on reset.
        BAUD_DIVFRAC: u6,
        padding: u26 = 0,
    }),
    /// Line Control Register, UARTLCR_H
    /// offset: 0x2c
    UARTLCR_H: mmio.Mmio(packed struct(u32) {
        /// Send break. If this bit is set to 1, a low-level is continually output on the UARTTXD output, after completing transmission of the current character. For the proper execution of the break command, the software must set this bit for at least two complete frames. For normal use, this bit must be cleared to 0.
        BRK: u1,
        /// Parity enable: 0 = parity is disabled and no parity bit added to the data frame 1 = parity checking and generation is enabled.
        PEN: u1,
        /// Even parity select. Controls the type of parity the UART uses during transmission and reception: 0 = odd parity. The UART generates or checks for an odd number of 1s in the data and parity bits. 1 = even parity. The UART generates or checks for an even number of 1s in the data and parity bits. This bit has no effect when the PEN bit disables parity checking and generation.
        EPS: u1,
        /// Two stop bits select. If this bit is set to 1, two stop bits are transmitted at the end of the frame. The receive logic does not check for two stop bits being received.
        STP2: u1,
        /// Enable FIFOs: 0 = FIFOs are disabled (character mode) that is, the FIFOs become 1-byte-deep holding registers 1 = transmit and receive FIFO buffers are enabled (FIFO mode).
        FEN: u1,
        /// Word length. These bits indicate the number of data bits transmitted or received in a frame as follows: b11 = 8 bits b10 = 7 bits b01 = 6 bits b00 = 5 bits.
        WLEN: u2,
        /// Stick parity select. 0 = stick parity is disabled 1 = either: * if the EPS bit is 0 then the parity bit is transmitted and checked as a 1 * if the EPS bit is 1 then the parity bit is transmitted and checked as a 0. This bit has no effect when the PEN bit disables parity checking and generation.
        SPS: u1,
        padding: u24 = 0,
    }),
    /// Control Register, UARTCR
    /// offset: 0x30
    UARTCR: mmio.Mmio(packed struct(u32) {
        /// UART enable: 0 = UART is disabled. If the UART is disabled in the middle of transmission or reception, it completes the current character before stopping. 1 = the UART is enabled. Data transmission and reception occurs for either UART signals or SIR signals depending on the setting of the SIREN bit.
        UARTEN: u1,
        /// SIR enable: 0 = IrDA SIR ENDEC is disabled. nSIROUT remains LOW (no light pulse generated), and signal transitions on SIRIN have no effect. 1 = IrDA SIR ENDEC is enabled. Data is transmitted and received on nSIROUT and SIRIN. UARTTXD remains HIGH, in the marking state. Signal transitions on UARTRXD or modem status inputs have no effect. This bit has no effect if the UARTEN bit disables the UART.
        SIREN: u1,
        /// SIR low-power IrDA mode. This bit selects the IrDA encoding mode. If this bit is cleared to 0, low-level bits are transmitted as an active high pulse with a width of 3 / 16th of the bit period. If this bit is set to 1, low-level bits are transmitted with a pulse width that is 3 times the period of the IrLPBaud16 input signal, regardless of the selected bit rate. Setting this bit uses less power, but might reduce transmission distances.
        SIRLP: u1,
        reserved7: u4 = 0,
        /// Loopback enable. If this bit is set to 1 and the SIREN bit is set to 1 and the SIRTEST bit in the Test Control Register, UARTTCR is set to 1, then the nSIROUT path is inverted, and fed through to the SIRIN path. The SIRTEST bit in the test register must be set to 1 to override the normal half-duplex SIR operation. This must be the requirement for accessing the test registers during normal operation, and SIRTEST must be cleared to 0 when loopback testing is finished. This feature reduces the amount of external coupling required during system test. If this bit is set to 1, and the SIRTEST bit is set to 0, the UARTTXD path is fed through to the UARTRXD path. In either SIR mode or UART mode, when this bit is set, the modem outputs are also fed through to the modem inputs. This bit is cleared to 0 on reset, to disable loopback.
        LBE: u1,
        /// Transmit enable. If this bit is set to 1, the transmit section of the UART is enabled. Data transmission occurs for either UART signals, or SIR signals depending on the setting of the SIREN bit. When the UART is disabled in the middle of transmission, it completes the current character before stopping.
        TXE: u1,
        /// Receive enable. If this bit is set to 1, the receive section of the UART is enabled. Data reception occurs for either UART signals or SIR signals depending on the setting of the SIREN bit. When the UART is disabled in the middle of reception, it completes the current character before stopping.
        RXE: u1,
        /// Data transmit ready. This bit is the complement of the UART data transmit ready, nUARTDTR, modem status output. That is, when the bit is programmed to a 1 then nUARTDTR is LOW.
        DTR: u1,
        /// Request to send. This bit is the complement of the UART request to send, nUARTRTS, modem status output. That is, when the bit is programmed to a 1 then nUARTRTS is LOW.
        RTS: u1,
        /// This bit is the complement of the UART Out1 (nUARTOut1) modem status output. That is, when the bit is programmed to a 1 the output is 0. For DTE this can be used as Data Carrier Detect (DCD).
        OUT1: u1,
        /// This bit is the complement of the UART Out2 (nUARTOut2) modem status output. That is, when the bit is programmed to a 1, the output is 0. For DTE this can be used as Ring Indicator (RI).
        OUT2: u1,
        /// RTS hardware flow control enable. If this bit is set to 1, RTS hardware flow control is enabled. Data is only requested when there is space in the receive FIFO for it to be received.
        RTSEN: u1,
        /// CTS hardware flow control enable. If this bit is set to 1, CTS hardware flow control is enabled. Data is only transmitted when the nUARTCTS signal is asserted.
        CTSEN: u1,
        padding: u16 = 0,
    }),
    /// Interrupt FIFO Level Select Register, UARTIFLS
    /// offset: 0x34
    UARTIFLS: mmio.Mmio(packed struct(u32) {
        /// Transmit interrupt FIFO level select. The trigger points for the transmit interrupt are as follows: b000 = Transmit FIFO becomes <= 1 / 8 full b001 = Transmit FIFO becomes <= 1 / 4 full b010 = Transmit FIFO becomes <= 1 / 2 full b011 = Transmit FIFO becomes <= 3 / 4 full b100 = Transmit FIFO becomes <= 7 / 8 full b101-b111 = reserved.
        TXIFLSEL: u3,
        /// Receive interrupt FIFO level select. The trigger points for the receive interrupt are as follows: b000 = Receive FIFO becomes >= 1 / 8 full b001 = Receive FIFO becomes >= 1 / 4 full b010 = Receive FIFO becomes >= 1 / 2 full b011 = Receive FIFO becomes >= 3 / 4 full b100 = Receive FIFO becomes >= 7 / 8 full b101-b111 = reserved.
        RXIFLSEL: u3,
        padding: u26 = 0,
    }),
    /// Interrupt Mask Set/Clear Register, UARTIMSC
    /// offset: 0x38
    UARTIMSC: mmio.Mmio(packed struct(u32) {
        /// nUARTRI modem interrupt mask. A read returns the current mask for the UARTRIINTR interrupt. On a write of 1, the mask of the UARTRIINTR interrupt is set. A write of 0 clears the mask.
        RIMIM: u1,
        /// nUARTCTS modem interrupt mask. A read returns the current mask for the UARTCTSINTR interrupt. On a write of 1, the mask of the UARTCTSINTR interrupt is set. A write of 0 clears the mask.
        CTSMIM: u1,
        /// nUARTDCD modem interrupt mask. A read returns the current mask for the UARTDCDINTR interrupt. On a write of 1, the mask of the UARTDCDINTR interrupt is set. A write of 0 clears the mask.
        DCDMIM: u1,
        /// nUARTDSR modem interrupt mask. A read returns the current mask for the UARTDSRINTR interrupt. On a write of 1, the mask of the UARTDSRINTR interrupt is set. A write of 0 clears the mask.
        DSRMIM: u1,
        /// Receive interrupt mask. A read returns the current mask for the UARTRXINTR interrupt. On a write of 1, the mask of the UARTRXINTR interrupt is set. A write of 0 clears the mask.
        RXIM: u1,
        /// Transmit interrupt mask. A read returns the current mask for the UARTTXINTR interrupt. On a write of 1, the mask of the UARTTXINTR interrupt is set. A write of 0 clears the mask.
        TXIM: u1,
        /// Receive timeout interrupt mask. A read returns the current mask for the UARTRTINTR interrupt. On a write of 1, the mask of the UARTRTINTR interrupt is set. A write of 0 clears the mask.
        RTIM: u1,
        /// Framing error interrupt mask. A read returns the current mask for the UARTFEINTR interrupt. On a write of 1, the mask of the UARTFEINTR interrupt is set. A write of 0 clears the mask.
        FEIM: u1,
        /// Parity error interrupt mask. A read returns the current mask for the UARTPEINTR interrupt. On a write of 1, the mask of the UARTPEINTR interrupt is set. A write of 0 clears the mask.
        PEIM: u1,
        /// Break error interrupt mask. A read returns the current mask for the UARTBEINTR interrupt. On a write of 1, the mask of the UARTBEINTR interrupt is set. A write of 0 clears the mask.
        BEIM: u1,
        /// Overrun error interrupt mask. A read returns the current mask for the UARTOEINTR interrupt. On a write of 1, the mask of the UARTOEINTR interrupt is set. A write of 0 clears the mask.
        OEIM: u1,
        padding: u21 = 0,
    }),
    /// Raw Interrupt Status Register, UARTRIS
    /// offset: 0x3c
    UARTRIS: mmio.Mmio(packed struct(u32) {
        /// nUARTRI modem interrupt status. Returns the raw interrupt state of the UARTRIINTR interrupt.
        RIRMIS: u1,
        /// nUARTCTS modem interrupt status. Returns the raw interrupt state of the UARTCTSINTR interrupt.
        CTSRMIS: u1,
        /// nUARTDCD modem interrupt status. Returns the raw interrupt state of the UARTDCDINTR interrupt.
        DCDRMIS: u1,
        /// nUARTDSR modem interrupt status. Returns the raw interrupt state of the UARTDSRINTR interrupt.
        DSRRMIS: u1,
        /// Receive interrupt status. Returns the raw interrupt state of the UARTRXINTR interrupt.
        RXRIS: u1,
        /// Transmit interrupt status. Returns the raw interrupt state of the UARTTXINTR interrupt.
        TXRIS: u1,
        /// Receive timeout interrupt status. Returns the raw interrupt state of the UARTRTINTR interrupt. a
        RTRIS: u1,
        /// Framing error interrupt status. Returns the raw interrupt state of the UARTFEINTR interrupt.
        FERIS: u1,
        /// Parity error interrupt status. Returns the raw interrupt state of the UARTPEINTR interrupt.
        PERIS: u1,
        /// Break error interrupt status. Returns the raw interrupt state of the UARTBEINTR interrupt.
        BERIS: u1,
        /// Overrun error interrupt status. Returns the raw interrupt state of the UARTOEINTR interrupt.
        OERIS: u1,
        padding: u21 = 0,
    }),
    /// Masked Interrupt Status Register, UARTMIS
    /// offset: 0x40
    UARTMIS: mmio.Mmio(packed struct(u32) {
        /// nUARTRI modem masked interrupt status. Returns the masked interrupt state of the UARTRIINTR interrupt.
        RIMMIS: u1,
        /// nUARTCTS modem masked interrupt status. Returns the masked interrupt state of the UARTCTSINTR interrupt.
        CTSMMIS: u1,
        /// nUARTDCD modem masked interrupt status. Returns the masked interrupt state of the UARTDCDINTR interrupt.
        DCDMMIS: u1,
        /// nUARTDSR modem masked interrupt status. Returns the masked interrupt state of the UARTDSRINTR interrupt.
        DSRMMIS: u1,
        /// Receive masked interrupt status. Returns the masked interrupt state of the UARTRXINTR interrupt.
        RXMIS: u1,
        /// Transmit masked interrupt status. Returns the masked interrupt state of the UARTTXINTR interrupt.
        TXMIS: u1,
        /// Receive timeout masked interrupt status. Returns the masked interrupt state of the UARTRTINTR interrupt.
        RTMIS: u1,
        /// Framing error masked interrupt status. Returns the masked interrupt state of the UARTFEINTR interrupt.
        FEMIS: u1,
        /// Parity error masked interrupt status. Returns the masked interrupt state of the UARTPEINTR interrupt.
        PEMIS: u1,
        /// Break error masked interrupt status. Returns the masked interrupt state of the UARTBEINTR interrupt.
        BEMIS: u1,
        /// Overrun error masked interrupt status. Returns the masked interrupt state of the UARTOEINTR interrupt.
        OEMIS: u1,
        padding: u21 = 0,
    }),
    /// Interrupt Clear Register, UARTICR
    /// offset: 0x44
    UARTICR: mmio.Mmio(packed struct(u32) {
        /// nUARTRI modem interrupt clear. Clears the UARTRIINTR interrupt.
        RIMIC: u1,
        /// nUARTCTS modem interrupt clear. Clears the UARTCTSINTR interrupt.
        CTSMIC: u1,
        /// nUARTDCD modem interrupt clear. Clears the UARTDCDINTR interrupt.
        DCDMIC: u1,
        /// nUARTDSR modem interrupt clear. Clears the UARTDSRINTR interrupt.
        DSRMIC: u1,
        /// Receive interrupt clear. Clears the UARTRXINTR interrupt.
        RXIC: u1,
        /// Transmit interrupt clear. Clears the UARTTXINTR interrupt.
        TXIC: u1,
        /// Receive timeout interrupt clear. Clears the UARTRTINTR interrupt.
        RTIC: u1,
        /// Framing error interrupt clear. Clears the UARTFEINTR interrupt.
        FEIC: u1,
        /// Parity error interrupt clear. Clears the UARTPEINTR interrupt.
        PEIC: u1,
        /// Break error interrupt clear. Clears the UARTBEINTR interrupt.
        BEIC: u1,
        /// Overrun error interrupt clear. Clears the UARTOEINTR interrupt.
        OEIC: u1,
        padding: u21 = 0,
    }),
    /// DMA Control Register, UARTDMACR
    /// offset: 0x48
    UARTDMACR: mmio.Mmio(packed struct(u32) {
        /// Receive DMA enable. If this bit is set to 1, DMA for the receive FIFO is enabled.
        RXDMAE: u1,
        /// Transmit DMA enable. If this bit is set to 1, DMA for the transmit FIFO is enabled.
        TXDMAE: u1,
        /// DMA on error. If this bit is set to 1, the DMA receive request outputs, UARTRXDMASREQ or UARTRXDMABREQ, are disabled when the UART error interrupt is asserted.
        DMAONERR: u1,
        padding: u29 = 0,
    }),
    /// offset: 0x4c
    reserved76: [3988]u8,
    /// UARTPeriphID0 Register
    /// offset: 0xfe0
    UARTPERIPHID0: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x11
        PARTNUMBER0: u8,
        padding: u24 = 0,
    }),
    /// UARTPeriphID1 Register
    /// offset: 0xfe4
    UARTPERIPHID1: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x0
        PARTNUMBER1: u4,
        /// These bits read back as 0x1
        DESIGNER0: u4,
        padding: u24 = 0,
    }),
    /// UARTPeriphID2 Register
    /// offset: 0xfe8
    UARTPERIPHID2: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x4
        DESIGNER1: u4,
        /// This field depends on the revision of the UART: r1p0 0x0 r1p1 0x1 r1p3 0x2 r1p4 0x2 r1p5 0x3
        REVISION: u4,
        padding: u24 = 0,
    }),
    /// UARTPeriphID3 Register
    /// offset: 0xfec
    UARTPERIPHID3: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x00
        CONFIGURATION: u8,
        padding: u24 = 0,
    }),
    /// UARTPCellID0 Register
    /// offset: 0xff0
    UARTPCELLID0: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x0D
        UARTPCELLID0: u8,
        padding: u24 = 0,
    }),
    /// UARTPCellID1 Register
    /// offset: 0xff4
    UARTPCELLID1: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0xF0
        UARTPCELLID1: u8,
        padding: u24 = 0,
    }),
    /// UARTPCellID2 Register
    /// offset: 0xff8
    UARTPCELLID2: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0x05
        UARTPCELLID2: u8,
        padding: u24 = 0,
    }),
    /// UARTPCellID3 Register
    /// offset: 0xffc
    UARTPCELLID3: mmio.Mmio(packed struct(u32) {
        /// These bits read back as 0xB1
        UARTPCELLID3: u8,
        padding: u24 = 0,
    }),
};
