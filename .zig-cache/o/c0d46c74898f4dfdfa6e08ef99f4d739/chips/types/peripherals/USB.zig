const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// USB FS/LS controller device registers
pub const USB = extern struct {
    /// Device address and endpoint control
    /// offset: 0x00
    ADDR_ENDP: mmio.Mmio(packed struct(u32) {
        /// In device mode, the address that the device should respond to. Set in response to a SET_ADDR setup packet from the host. In host mode set to the address of the device to communicate with.
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Device endpoint to send data to. Only valid for HOST mode.
        ENDPOINT: u4,
        padding: u12 = 0,
    }),
    /// Interrupt endpoint 1. Only valid for HOST mode.
    /// offset: 0x04
    ADDR_ENDP1: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 2. Only valid for HOST mode.
    /// offset: 0x08
    ADDR_ENDP2: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 3. Only valid for HOST mode.
    /// offset: 0x0c
    ADDR_ENDP3: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 4. Only valid for HOST mode.
    /// offset: 0x10
    ADDR_ENDP4: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 5. Only valid for HOST mode.
    /// offset: 0x14
    ADDR_ENDP5: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 6. Only valid for HOST mode.
    /// offset: 0x18
    ADDR_ENDP6: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 7. Only valid for HOST mode.
    /// offset: 0x1c
    ADDR_ENDP7: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 8. Only valid for HOST mode.
    /// offset: 0x20
    ADDR_ENDP8: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 9. Only valid for HOST mode.
    /// offset: 0x24
    ADDR_ENDP9: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 10. Only valid for HOST mode.
    /// offset: 0x28
    ADDR_ENDP10: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 11. Only valid for HOST mode.
    /// offset: 0x2c
    ADDR_ENDP11: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 12. Only valid for HOST mode.
    /// offset: 0x30
    ADDR_ENDP12: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 13. Only valid for HOST mode.
    /// offset: 0x34
    ADDR_ENDP13: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 14. Only valid for HOST mode.
    /// offset: 0x38
    ADDR_ENDP14: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Interrupt endpoint 15. Only valid for HOST mode.
    /// offset: 0x3c
    ADDR_ENDP15: mmio.Mmio(packed struct(u32) {
        /// Device address
        ADDRESS: u7,
        reserved16: u9 = 0,
        /// Endpoint number of the interrupt endpoint
        ENDPOINT: u4,
        reserved25: u5 = 0,
        /// Direction of the interrupt endpoint. In=0, Out=1
        INTEP_DIR: u1,
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        INTEP_PREAMBLE: u1,
        padding: u5 = 0,
    }),
    /// Main control register
    /// offset: 0x40
    MAIN_CTRL: mmio.Mmio(packed struct(u32) {
        /// Enable controller
        CONTROLLER_EN: u1,
        /// Device mode = 0, Host mode = 1
        HOST_NDEVICE: u1,
        reserved31: u29 = 0,
        /// Reduced timings for simulation
        SIM_TIMING: u1,
    }),
    /// Set the SOF (Start of Frame) frame number in the host controller. The SOF packet is sent every 1ms and the host will increment the frame number by 1 each time.
    /// offset: 0x44
    SOF_WR: mmio.Mmio(packed struct(u32) {
        COUNT: u11,
        padding: u21 = 0,
    }),
    /// Read the last SOF (Start of Frame) frame number seen. In device mode the last SOF received from the host. In host mode the last SOF sent by the host.
    /// offset: 0x48
    SOF_RD: mmio.Mmio(packed struct(u32) {
        COUNT: u11,
        padding: u21 = 0,
    }),
    /// SIE control register
    /// offset: 0x4c
    SIE_CTRL: mmio.Mmio(packed struct(u32) {
        /// Host: Start transaction
        START_TRANS: u1,
        /// Host: Send Setup packet
        SEND_SETUP: u1,
        /// Host: Send transaction (OUT from host)
        SEND_DATA: u1,
        /// Host: Receive transaction (IN to host)
        RECEIVE_DATA: u1,
        /// Host: Stop transaction
        STOP_TRANS: u1,
        reserved6: u1 = 0,
        /// Host: Preable enable for LS device on FS hub
        PREAMBLE_EN: u1,
        reserved8: u1 = 0,
        /// Host: Delay packet(s) until after SOF
        SOF_SYNC: u1,
        /// Host: Enable SOF generation (for full speed bus)
        SOF_EN: u1,
        /// Host: Enable keep alive packet (for low speed bus)
        KEEP_ALIVE_EN: u1,
        /// Host: Enable VBUS
        VBUS_EN: u1,
        /// Device: Remote wakeup. Device can initiate its own resume after suspend.
        RESUME: u1,
        /// Host: Reset bus
        RESET_BUS: u1,
        reserved15: u1 = 0,
        /// Host: Enable pull down resistors
        PULLDOWN_EN: u1,
        /// Device: Enable pull up resistor
        PULLUP_EN: u1,
        /// Device: Pull-up strength (0=1K2, 1=2k3)
        RPU_OPT: u1,
        /// Power down bus transceiver
        TRANSCEIVER_PD: u1,
        reserved24: u5 = 0,
        /// Direct control of DM
        DIRECT_DM: u1,
        /// Direct control of DP
        DIRECT_DP: u1,
        /// Direct bus drive enable
        DIRECT_EN: u1,
        /// Device: Set bit in EP_STATUS_STALL_NAK when EP0 sends a NAK
        EP0_INT_NAK: u1,
        /// Device: Set bit in BUFF_STATUS for every 2 buffers completed on EP0
        EP0_INT_2BUF: u1,
        /// Device: Set bit in BUFF_STATUS for every buffer completed on EP0
        EP0_INT_1BUF: u1,
        /// Device: EP0 single buffered = 0, double buffered = 1
        EP0_DOUBLE_BUF: u1,
        /// Device: Set bit in EP_STATUS_STALL_NAK when EP0 sends a STALL
        EP0_INT_STALL: u1,
    }),
    /// SIE status register
    /// offset: 0x50
    SIE_STATUS: mmio.Mmio(packed struct(u32) {
        /// Device: VBUS Detected
        VBUS_DETECTED: u1,
        reserved2: u1 = 0,
        /// USB bus line state
        LINE_STATE: u2,
        /// Bus in suspended state. Valid for device and host. Host and device will go into suspend if neither Keep Alive / SOF frames are enabled.
        SUSPENDED: u1,
        reserved8: u3 = 0,
        /// Host: device speed. Disconnected = 00, LS = 01, FS = 10
        SPEED: u2,
        /// VBUS over current detected
        VBUS_OVER_CURR: u1,
        /// Host: Device has initiated a remote resume. Device: host has initiated a resume.
        RESUME: u1,
        reserved16: u4 = 0,
        /// Device: connected
        CONNECTED: u1,
        /// Device: Setup packet received
        SETUP_REC: u1,
        /// Transaction complete. Raised by device if: * An IN or OUT packet is sent with the `LAST_BUFF` bit set in the buffer control register Raised by host if: * A setup packet is sent when no data in or data out transaction follows * An IN packet is received and the `LAST_BUFF` bit is set in the buffer control register * An IN packet is received with zero length * An OUT packet is sent and the `LAST_BUFF` bit is set
        TRANS_COMPLETE: u1,
        /// Device: bus reset received
        BUS_RESET: u1,
        reserved24: u4 = 0,
        /// CRC Error. Raised by the Serial RX engine.
        CRC_ERROR: u1,
        /// Bit Stuff Error. Raised by the Serial RX engine.
        BIT_STUFF_ERROR: u1,
        /// RX overflow is raised by the Serial RX engine if the incoming data is too fast.
        RX_OVERFLOW: u1,
        /// RX timeout is raised by both the host and device if an ACK is not received in the maximum time specified by the USB spec.
        RX_TIMEOUT: u1,
        /// Host: NAK received
        NAK_REC: u1,
        /// Host: STALL received
        STALL_REC: u1,
        /// ACK received. Raised by both host and device.
        ACK_REC: u1,
        /// Data Sequence Error. The device can raise a sequence error in the following conditions: * A SETUP packet is received followed by a DATA1 packet (data phase should always be DATA0) * An OUT packet is received from the host but doesn't match the data pid in the buffer control register read from DPSRAM The host can raise a data sequence error in the following conditions: * An IN packet from the device has the wrong data PID
        DATA_SEQ_ERROR: u1,
    }),
    /// interrupt endpoint control register
    /// offset: 0x54
    INT_EP_CTRL: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Host: Enable interrupt endpoint 1 => 15
        INT_EP_ACTIVE: u15,
        padding: u16 = 0,
    }),
    /// Buffer status register. A bit set here indicates that a buffer has completed on the endpoint (if the buffer interrupt is enabled). It is possible for 2 buffers to be completed, so clearing the buffer status bit may instantly re set it on the next clock cycle.
    /// offset: 0x58
    BUFF_STATUS: mmio.Mmio(packed struct(u32) {
        EP0_IN: u1,
        EP0_OUT: u1,
        EP1_IN: u1,
        EP1_OUT: u1,
        EP2_IN: u1,
        EP2_OUT: u1,
        EP3_IN: u1,
        EP3_OUT: u1,
        EP4_IN: u1,
        EP4_OUT: u1,
        EP5_IN: u1,
        EP5_OUT: u1,
        EP6_IN: u1,
        EP6_OUT: u1,
        EP7_IN: u1,
        EP7_OUT: u1,
        EP8_IN: u1,
        EP8_OUT: u1,
        EP9_IN: u1,
        EP9_OUT: u1,
        EP10_IN: u1,
        EP10_OUT: u1,
        EP11_IN: u1,
        EP11_OUT: u1,
        EP12_IN: u1,
        EP12_OUT: u1,
        EP13_IN: u1,
        EP13_OUT: u1,
        EP14_IN: u1,
        EP14_OUT: u1,
        EP15_IN: u1,
        EP15_OUT: u1,
    }),
    /// Which of the double buffers should be handled. Only valid if using an interrupt per buffer (i.e. not per 2 buffers). Not valid for host interrupt endpoint polling because they are only single buffered.
    /// offset: 0x5c
    BUFF_CPU_SHOULD_HANDLE: mmio.Mmio(packed struct(u32) {
        EP0_IN: u1,
        EP0_OUT: u1,
        EP1_IN: u1,
        EP1_OUT: u1,
        EP2_IN: u1,
        EP2_OUT: u1,
        EP3_IN: u1,
        EP3_OUT: u1,
        EP4_IN: u1,
        EP4_OUT: u1,
        EP5_IN: u1,
        EP5_OUT: u1,
        EP6_IN: u1,
        EP6_OUT: u1,
        EP7_IN: u1,
        EP7_OUT: u1,
        EP8_IN: u1,
        EP8_OUT: u1,
        EP9_IN: u1,
        EP9_OUT: u1,
        EP10_IN: u1,
        EP10_OUT: u1,
        EP11_IN: u1,
        EP11_OUT: u1,
        EP12_IN: u1,
        EP12_OUT: u1,
        EP13_IN: u1,
        EP13_OUT: u1,
        EP14_IN: u1,
        EP14_OUT: u1,
        EP15_IN: u1,
        EP15_OUT: u1,
    }),
    /// Device only: Can be set to ignore the buffer control register for this endpoint in case you would like to revoke a buffer. A NAK will be sent for every access to the endpoint until this bit is cleared. A corresponding bit in `EP_ABORT_DONE` is set when it is safe to modify the buffer control register.
    /// offset: 0x60
    EP_ABORT: mmio.Mmio(packed struct(u32) {
        EP0_IN: u1,
        EP0_OUT: u1,
        EP1_IN: u1,
        EP1_OUT: u1,
        EP2_IN: u1,
        EP2_OUT: u1,
        EP3_IN: u1,
        EP3_OUT: u1,
        EP4_IN: u1,
        EP4_OUT: u1,
        EP5_IN: u1,
        EP5_OUT: u1,
        EP6_IN: u1,
        EP6_OUT: u1,
        EP7_IN: u1,
        EP7_OUT: u1,
        EP8_IN: u1,
        EP8_OUT: u1,
        EP9_IN: u1,
        EP9_OUT: u1,
        EP10_IN: u1,
        EP10_OUT: u1,
        EP11_IN: u1,
        EP11_OUT: u1,
        EP12_IN: u1,
        EP12_OUT: u1,
        EP13_IN: u1,
        EP13_OUT: u1,
        EP14_IN: u1,
        EP14_OUT: u1,
        EP15_IN: u1,
        EP15_OUT: u1,
    }),
    /// Device only: Used in conjunction with `EP_ABORT`. Set once an endpoint is idle so the programmer knows it is safe to modify the buffer control register.
    /// offset: 0x64
    EP_ABORT_DONE: mmio.Mmio(packed struct(u32) {
        EP0_IN: u1,
        EP0_OUT: u1,
        EP1_IN: u1,
        EP1_OUT: u1,
        EP2_IN: u1,
        EP2_OUT: u1,
        EP3_IN: u1,
        EP3_OUT: u1,
        EP4_IN: u1,
        EP4_OUT: u1,
        EP5_IN: u1,
        EP5_OUT: u1,
        EP6_IN: u1,
        EP6_OUT: u1,
        EP7_IN: u1,
        EP7_OUT: u1,
        EP8_IN: u1,
        EP8_OUT: u1,
        EP9_IN: u1,
        EP9_OUT: u1,
        EP10_IN: u1,
        EP10_OUT: u1,
        EP11_IN: u1,
        EP11_OUT: u1,
        EP12_IN: u1,
        EP12_OUT: u1,
        EP13_IN: u1,
        EP13_OUT: u1,
        EP14_IN: u1,
        EP14_OUT: u1,
        EP15_IN: u1,
        EP15_OUT: u1,
    }),
    /// Device: this bit must be set in conjunction with the `STALL` bit in the buffer control register to send a STALL on EP0. The device controller clears these bits when a SETUP packet is received because the USB spec requires that a STALL condition is cleared when a SETUP packet is received.
    /// offset: 0x68
    EP_STALL_ARM: mmio.Mmio(packed struct(u32) {
        EP0_IN: u1,
        EP0_OUT: u1,
        padding: u30 = 0,
    }),
    /// Used by the host controller. Sets the wait time in microseconds before trying again if the device replies with a NAK.
    /// offset: 0x6c
    NAK_POLL: mmio.Mmio(packed struct(u32) {
        /// NAK polling interval for a low speed device
        DELAY_LS: u10,
        reserved16: u6 = 0,
        /// NAK polling interval for a full speed device
        DELAY_FS: u10,
        padding: u6 = 0,
    }),
    /// Device: bits are set when the `IRQ_ON_NAK` or `IRQ_ON_STALL` bits are set. For EP0 this comes from `SIE_CTRL`. For all other endpoints it comes from the endpoint control register.
    /// offset: 0x70
    EP_STATUS_STALL_NAK: mmio.Mmio(packed struct(u32) {
        EP0_IN: u1,
        EP0_OUT: u1,
        EP1_IN: u1,
        EP1_OUT: u1,
        EP2_IN: u1,
        EP2_OUT: u1,
        EP3_IN: u1,
        EP3_OUT: u1,
        EP4_IN: u1,
        EP4_OUT: u1,
        EP5_IN: u1,
        EP5_OUT: u1,
        EP6_IN: u1,
        EP6_OUT: u1,
        EP7_IN: u1,
        EP7_OUT: u1,
        EP8_IN: u1,
        EP8_OUT: u1,
        EP9_IN: u1,
        EP9_OUT: u1,
        EP10_IN: u1,
        EP10_OUT: u1,
        EP11_IN: u1,
        EP11_OUT: u1,
        EP12_IN: u1,
        EP12_OUT: u1,
        EP13_IN: u1,
        EP13_OUT: u1,
        EP14_IN: u1,
        EP14_OUT: u1,
        EP15_IN: u1,
        EP15_OUT: u1,
    }),
    /// Where to connect the USB controller. Should be to_phy by default.
    /// offset: 0x74
    USB_MUXING: mmio.Mmio(packed struct(u32) {
        TO_PHY: u1,
        TO_EXTPHY: u1,
        TO_DIGITAL_PAD: u1,
        SOFTCON: u1,
        padding: u28 = 0,
    }),
    /// Overrides for the power signals in the event that the VBUS signals are not hooked up to GPIO. Set the value of the override and then the override enable so switch over to the override value.
    /// offset: 0x78
    USB_PWR: mmio.Mmio(packed struct(u32) {
        VBUS_EN: u1,
        VBUS_EN_OVERRIDE_EN: u1,
        VBUS_DETECT: u1,
        VBUS_DETECT_OVERRIDE_EN: u1,
        OVERCURR_DETECT: u1,
        OVERCURR_DETECT_EN: u1,
        padding: u26 = 0,
    }),
    /// Note that most functions are driven directly from usb_fsls controller. This register allows more detailed control/status from the USB PHY. Useful for debug but not expected to be used in normal operation Use in conjunction with usbphy_direct_override register
    /// offset: 0x7c
    USBPHY_DIRECT: mmio.Mmio(packed struct(u32) {
        /// when dp_pullup_en is set high, this enables second resistor. 0 - Pull = Rpu2; 1 - Pull = Rpu1 + Rpu2
        DP_PULLUP_HISEL: u1,
        /// Value to drive to USB PHY when override enable is set (which will override the default value or value driven from USB controller
        DP_PULLUP_EN: u1,
        /// Value to drive to USB PHY when override enable is set (which will override the default value or value driven from USB controller 1 - Enable Rpd on DPP
        DP_PULLDN_EN: u1,
        reserved4: u1 = 0,
        /// when dm_pullup_en is set high, this enables second resistor. 0 - Pull = Rpu2; 1 - Pull = Rpu1 + Rpu2
        DM_PULLUP_HISEL: u1,
        /// Value to drive to USB PHY when override enable is set (which will override the default value or value driven from USB controller 1 - Enable Rpu on DPM
        DM_PULLUP_EN: u1,
        /// Value to drive to USB PHY when override enable is set (which will override the default value or value driven from USB controller 1 - Enable Rpd on DPM
        DM_PULLDN_EN: u1,
        reserved8: u1 = 0,
        /// Value to drive to USB PHY when override enable is set (which will override the default value or value driven from USB controller TX_SEMODE=0, OE for DPP/DPM diff pair. 0 - DPP/DPM in Hi-Z state; 1 - DPP/DPM driving TX_SEMODE=1, OE for DPP only. 0 - DPP in Hi-Z state; 1 - DPP driving
        TX_DP_OE: u1,
        /// Value to drive to USB PHY when override enable is set (which will override the default value or value driven from USB controller TX_SEMODE=0, Ignored. TX_SEMODE=1, OE for DPM only. 0 - DPM in Hi-Z state; 1 - DPM driving
        TX_DM_OE: u1,
        /// Value to drive to USB PHY when override enable is set (which will override the default value or value driven from USB controller TX_SEMODE=0, Drives DPP/DPM diff pair. TX_DP_OE=1 to enable drive. DPP=TX_DP, DPM=~TX_DP TX_SEMODE=1, Drives DPP only. TX_DP_OE=1 to enable drive. DPP=TX_DP
        TX_DP: u1,
        /// Value to drive to USB PHY when override enable is set (which will override the default value or value driven from USB controller TX_SEMODE=0, Ignored TX_SEMODE=1, Drives DPM only. TX_DM_OE=1 to enable drive. DPM=TX_DM
        TX_DM: u1,
        RX_PD: u1,
        TX_PD: u1,
        TX_FSSLEW: u1,
        TX_DIFFMODE: u1,
        /// Status bit from USB PHY RX Diff data
        RX_DD: u1,
        /// Status bit from USB PHY DPP pin state
        RX_DP: u1,
        /// Status bit from USB PHY DPM pin state
        RX_DM: u1,
        /// Status bit from USB PHY
        DP_OVCN: u1,
        /// Status bit from USB PHY
        DM_OVCN: u1,
        /// Status bit from USB PHY
        DP_OVV: u1,
        /// Status bit from USB PHY
        DM_OVV: u1,
        padding: u9 = 0,
    }),
    /// offset: 0x80
    USBPHY_DIRECT_OVERRIDE: mmio.Mmio(packed struct(u32) {
        DP_PULLUP_HISEL_OVERRIDE_EN: u1,
        DM_PULLUP_HISEL_OVERRIDE_EN: u1,
        /// Override default value or value driven from USB Controller to PHY
        DP_PULLUP_EN_OVERRIDE_EN: u1,
        /// Override default value or value driven from USB Controller to PHY
        DP_PULLDN_EN_OVERRIDE_EN: u1,
        /// Override default value or value driven from USB Controller to PHY
        DM_PULLDN_EN_OVERRIDE_EN: u1,
        /// Override default value or value driven from USB Controller to PHY
        TX_DP_OE_OVERRIDE_EN: u1,
        /// Override default value or value driven from USB Controller to PHY
        TX_DM_OE_OVERRIDE_EN: u1,
        /// Override default value or value driven from USB Controller to PHY
        TX_DP_OVERRIDE_EN: u1,
        /// Override default value or value driven from USB Controller to PHY
        TX_DM_OVERRIDE_EN: u1,
        RX_PD_OVERRIDE_EN: u1,
        TX_PD_OVERRIDE_EN: u1,
        TX_FSSLEW_OVERRIDE_EN: u1,
        DM_PULLUP_OVERRIDE_EN: u1,
        reserved15: u2 = 0,
        TX_DIFFMODE_OVERRIDE_EN: u1,
        padding: u16 = 0,
    }),
    /// Note that most functions are driven directly from usb_fsls controller. This register allows more detailed control/status from the USB PHY. Useful for debug but not expected to be used in normal operation
    /// offset: 0x84
    USBPHY_TRIM: mmio.Mmio(packed struct(u32) {
        /// Value to drive to USB PHY DP pulldown resistor trim control Experimental data suggests that the reset value will work, but this register allows adjustment if required
        DP_PULLDN_TRIM: u5,
        reserved8: u3 = 0,
        /// Value to drive to USB PHY DM pulldown resistor trim control Experimental data suggests that the reset value will work, but this register allows adjustment if required
        DM_PULLDN_TRIM: u5,
        padding: u19 = 0,
    }),
    /// offset: 0x88
    reserved136: [4]u8,
    /// Raw Interrupts
    /// offset: 0x8c
    INTR: mmio.Mmio(packed struct(u32) {
        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        HOST_CONN_DIS: u1,
        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME_REMOTE
        HOST_RESUME: u1,
        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        HOST_SOF: u1,
        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        TRANS_COMPLETE: u1,
        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        BUFF_STATUS: u1,
        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        ERROR_DATA_SEQ: u1,
        /// Source: SIE_STATUS.RX_TIMEOUT
        ERROR_RX_TIMEOUT: u1,
        /// Source: SIE_STATUS.RX_OVERFLOW
        ERROR_RX_OVERFLOW: u1,
        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        ERROR_BIT_STUFF: u1,
        /// Source: SIE_STATUS.CRC_ERROR
        ERROR_CRC: u1,
        /// Source: SIE_STATUS.STALL_REC
        STALL: u1,
        /// Source: SIE_STATUS.VBUS_DETECT
        VBUS_DETECT: u1,
        /// Source: SIE_STATUS.BUS_RESET
        BUS_RESET: u1,
        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        DEV_CONN_DIS: u1,
        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        DEV_SUSPEND: u1,
        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME_REMOTE
        DEV_RESUME_FROM_HOST: u1,
        /// Device. Source: SIE_STATUS.SETUP_REC
        SETUP_REQ: u1,
        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        DEV_SOF: u1,
        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        ABORT_DONE: u1,
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        EP_STALL_NAK: u1,
        padding: u12 = 0,
    }),
    /// Interrupt Enable
    /// offset: 0x90
    INTE: mmio.Mmio(packed struct(u32) {
        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        HOST_CONN_DIS: u1,
        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME_REMOTE
        HOST_RESUME: u1,
        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        HOST_SOF: u1,
        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        TRANS_COMPLETE: u1,
        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        BUFF_STATUS: u1,
        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        ERROR_DATA_SEQ: u1,
        /// Source: SIE_STATUS.RX_TIMEOUT
        ERROR_RX_TIMEOUT: u1,
        /// Source: SIE_STATUS.RX_OVERFLOW
        ERROR_RX_OVERFLOW: u1,
        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        ERROR_BIT_STUFF: u1,
        /// Source: SIE_STATUS.CRC_ERROR
        ERROR_CRC: u1,
        /// Source: SIE_STATUS.STALL_REC
        STALL: u1,
        /// Source: SIE_STATUS.VBUS_DETECT
        VBUS_DETECT: u1,
        /// Source: SIE_STATUS.BUS_RESET
        BUS_RESET: u1,
        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        DEV_CONN_DIS: u1,
        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        DEV_SUSPEND: u1,
        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME_REMOTE
        DEV_RESUME_FROM_HOST: u1,
        /// Device. Source: SIE_STATUS.SETUP_REC
        SETUP_REQ: u1,
        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        DEV_SOF: u1,
        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        ABORT_DONE: u1,
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        EP_STALL_NAK: u1,
        padding: u12 = 0,
    }),
    /// Interrupt Force
    /// offset: 0x94
    INTF: mmio.Mmio(packed struct(u32) {
        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        HOST_CONN_DIS: u1,
        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME_REMOTE
        HOST_RESUME: u1,
        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        HOST_SOF: u1,
        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        TRANS_COMPLETE: u1,
        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        BUFF_STATUS: u1,
        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        ERROR_DATA_SEQ: u1,
        /// Source: SIE_STATUS.RX_TIMEOUT
        ERROR_RX_TIMEOUT: u1,
        /// Source: SIE_STATUS.RX_OVERFLOW
        ERROR_RX_OVERFLOW: u1,
        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        ERROR_BIT_STUFF: u1,
        /// Source: SIE_STATUS.CRC_ERROR
        ERROR_CRC: u1,
        /// Source: SIE_STATUS.STALL_REC
        STALL: u1,
        /// Source: SIE_STATUS.VBUS_DETECT
        VBUS_DETECT: u1,
        /// Source: SIE_STATUS.BUS_RESET
        BUS_RESET: u1,
        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        DEV_CONN_DIS: u1,
        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        DEV_SUSPEND: u1,
        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME_REMOTE
        DEV_RESUME_FROM_HOST: u1,
        /// Device. Source: SIE_STATUS.SETUP_REC
        SETUP_REQ: u1,
        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        DEV_SOF: u1,
        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        ABORT_DONE: u1,
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        EP_STALL_NAK: u1,
        padding: u12 = 0,
    }),
    /// Interrupt status after masking & forcing
    /// offset: 0x98
    INTS: mmio.Mmio(packed struct(u32) {
        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        HOST_CONN_DIS: u1,
        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME_REMOTE
        HOST_RESUME: u1,
        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        HOST_SOF: u1,
        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        TRANS_COMPLETE: u1,
        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        BUFF_STATUS: u1,
        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        ERROR_DATA_SEQ: u1,
        /// Source: SIE_STATUS.RX_TIMEOUT
        ERROR_RX_TIMEOUT: u1,
        /// Source: SIE_STATUS.RX_OVERFLOW
        ERROR_RX_OVERFLOW: u1,
        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        ERROR_BIT_STUFF: u1,
        /// Source: SIE_STATUS.CRC_ERROR
        ERROR_CRC: u1,
        /// Source: SIE_STATUS.STALL_REC
        STALL: u1,
        /// Source: SIE_STATUS.VBUS_DETECT
        VBUS_DETECT: u1,
        /// Source: SIE_STATUS.BUS_RESET
        BUS_RESET: u1,
        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        DEV_CONN_DIS: u1,
        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        DEV_SUSPEND: u1,
        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME_REMOTE
        DEV_RESUME_FROM_HOST: u1,
        /// Device. Source: SIE_STATUS.SETUP_REC
        SETUP_REQ: u1,
        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        DEV_SOF: u1,
        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        ABORT_DONE: u1,
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        EP_STALL_NAK: u1,
        padding: u12 = 0,
    }),
};
