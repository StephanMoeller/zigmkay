//! Dual-core Arm Cortex-M0+ processor, flexible clock running up to 133 MHz 264KB on-chip SRAM 2 x UART, 2 x SPI controllers, 2 x I2C controllers, 16 x PWM channels 1 x USB 1.1 controller and PHY, with host and device support 8 x Programmable I/O (PIO) state machines for custom peripheral support Supported input power 1.8-5.5V DC Operating temperature -20C to +85C Drag-and-drop programming using mass storage over USB Low-power sleep and dormant modes Accurate on-chip clock Temperature sensor Accelerated integer and floating-point libraries on-chip
const microzig = @import("microzig");
const mmio = microzig.mmio;

pub const types = @import("types.zig");

pub const Interrupt = struct {
    name: [:0]const u8,
    index: i16,
    description: ?[:0]const u8,
};

pub const properties = struct {
    pub const @"cpu.deviceNumInterrupts" = "26";
    pub const @"cpu.endian" = "little";
    pub const @"cpu.fpuPresent" = "false";
    pub const @"cpu.mpuPresent" = "true";
    pub const @"cpu.name" = "CM0PLUS";
    pub const @"cpu.nvicPrioBits" = "2";
    pub const @"cpu.revision" = "r0p1";
    pub const @"cpu.vendorSystickConfig" = "false";
    pub const @"cpu.vtorPresent" = "1";
    pub const license =
        \\
        \\        Copyright (c) 2024 Raspberry Pi Ltd.
        \\
        \\        SPDX-License-Identifier: BSD-3-Clause
        \\    
    ;
};

pub const interrupts: []const Interrupt = &.{
    .{ .name = "NMI", .index = -14, .description = null },
    .{ .name = "HardFault", .index = -13, .description = null },
    .{ .name = "SVCall", .index = -5, .description = null },
    .{ .name = "PendSV", .index = -2, .description = null },
    .{ .name = "SysTick", .index = -1, .description = null },
    .{ .name = "TIMER_IRQ_0", .index = 0, .description = null },
    .{ .name = "TIMER_IRQ_1", .index = 1, .description = null },
    .{ .name = "TIMER_IRQ_2", .index = 2, .description = null },
    .{ .name = "TIMER_IRQ_3", .index = 3, .description = null },
    .{ .name = "PWM_IRQ_WRAP", .index = 4, .description = null },
    .{ .name = "USBCTRL_IRQ", .index = 5, .description = null },
    .{ .name = "XIP_IRQ", .index = 6, .description = null },
    .{ .name = "PIO0_IRQ_0", .index = 7, .description = null },
    .{ .name = "PIO0_IRQ_1", .index = 8, .description = null },
    .{ .name = "PIO1_IRQ_0", .index = 9, .description = null },
    .{ .name = "PIO1_IRQ_1", .index = 10, .description = null },
    .{ .name = "DMA_IRQ_0", .index = 11, .description = null },
    .{ .name = "DMA_IRQ_1", .index = 12, .description = null },
    .{ .name = "IO_IRQ_BANK0", .index = 13, .description = null },
    .{ .name = "IO_IRQ_QSPI", .index = 14, .description = null },
    .{ .name = "SIO_IRQ_PROC0", .index = 15, .description = null },
    .{ .name = "SIO_IRQ_PROC1", .index = 16, .description = null },
    .{ .name = "CLOCKS_IRQ", .index = 17, .description = null },
    .{ .name = "SPI0_IRQ", .index = 18, .description = null },
    .{ .name = "SPI1_IRQ", .index = 19, .description = null },
    .{ .name = "UART0_IRQ", .index = 20, .description = null },
    .{ .name = "UART1_IRQ", .index = 21, .description = null },
    .{ .name = "ADC_IRQ_FIFO", .index = 22, .description = null },
    .{ .name = "I2C0_IRQ", .index = 23, .description = null },
    .{ .name = "I2C1_IRQ", .index = 24, .description = null },
    .{ .name = "RTC_IRQ", .index = 25, .description = null },
};

pub const VectorTable = extern struct {
    const Handler = microzig.interrupt.Handler;
    const unhandled = microzig.interrupt.unhandled;

    initial_stack_pointer: u32,
    Reset: Handler,
    NMI: Handler = unhandled,
    HardFault: Handler = unhandled,
    reserved2: [7]u32 = undefined,
    SVCall: Handler = unhandled,
    reserved10: [2]u32 = undefined,
    PendSV: Handler = unhandled,
    SysTick: Handler = unhandled,
    TIMER_IRQ_0: Handler = unhandled,
    TIMER_IRQ_1: Handler = unhandled,
    TIMER_IRQ_2: Handler = unhandled,
    TIMER_IRQ_3: Handler = unhandled,
    PWM_IRQ_WRAP: Handler = unhandled,
    USBCTRL_IRQ: Handler = unhandled,
    XIP_IRQ: Handler = unhandled,
    PIO0_IRQ_0: Handler = unhandled,
    PIO0_IRQ_1: Handler = unhandled,
    PIO1_IRQ_0: Handler = unhandled,
    PIO1_IRQ_1: Handler = unhandled,
    DMA_IRQ_0: Handler = unhandled,
    DMA_IRQ_1: Handler = unhandled,
    IO_IRQ_BANK0: Handler = unhandled,
    IO_IRQ_QSPI: Handler = unhandled,
    SIO_IRQ_PROC0: Handler = unhandled,
    SIO_IRQ_PROC1: Handler = unhandled,
    CLOCKS_IRQ: Handler = unhandled,
    SPI0_IRQ: Handler = unhandled,
    SPI1_IRQ: Handler = unhandled,
    UART0_IRQ: Handler = unhandled,
    UART1_IRQ: Handler = unhandled,
    ADC_IRQ_FIFO: Handler = unhandled,
    I2C0_IRQ: Handler = unhandled,
    I2C1_IRQ: Handler = unhandled,
    RTC_IRQ: Handler = unhandled,
};

pub const peripherals = struct {
    /// QSPI flash execute-in-place block
    pub const XIP_CTRL: *volatile types.peripherals.XIP_CTRL = @ptrFromInt(0x14000000);
    /// DW_apb_ssi has the following features: * APB interface – Allows for easy integration into a DesignWare Synthesizable Components for AMBA 2 implementation. * APB3 and APB4 protocol support. * Scalable APB data bus width – Supports APB data bus widths of 8, 16, and 32 bits. * Serial-master or serial-slave operation – Enables serial communication with serial-master or serial-slave peripheral devices. * Programmable Dual/Quad/Octal SPI support in Master Mode. * Dual Data Rate (DDR) and Read Data Strobe (RDS) Support - Enables the DW_apb_ssi master to perform operations with the device in DDR and RDS modes when working in Dual/Quad/Octal mode of operation. * Data Mask Support - Enables the DW_apb_ssi to selectively update the bytes in the device. This feature is applicable only in enhanced SPI modes. * eXecute-In-Place (XIP) support - Enables the DW_apb_ssi master to behave as a memory mapped I/O and fetches the data from the device based on the APB read request. This feature is applicable only in enhanced SPI modes. * DMA Controller Interface – Enables the DW_apb_ssi to interface to a DMA controller over the bus using a handshaking interface for transfer requests. * Independent masking of interrupts – Master collision, transmit FIFO overflow, transmit FIFO empty, receive FIFO full, receive FIFO underflow, and receive FIFO overflow interrupts can all be masked independently. * Multi-master contention detection – Informs the processor of multiple serial-master accesses on the serial bus. * Bypass of meta-stability flip-flops for synchronous clocks – When the APB clock (pclk) and the DW_apb_ssi serial clock (ssi_clk) are synchronous, meta-stable flip-flops are not used when transferring control signals across these clock domains. * Programmable delay on the sample time of the received serial data bit (rxd); enables programmable control of routing delays resulting in higher serial data-bit rates. * Programmable features: - Serial interface operation – Choice of Motorola SPI, Texas Instruments Synchronous Serial Protocol or National Semiconductor Microwire. - Clock bit-rate – Dynamic control of the serial bit rate of the data transfer; used in only serial-master mode of operation. - Data Item size (4 to 32 bits) – Item size of each data transfer under the control of the programmer. * Configured features: - FIFO depth – 16 words deep. The FIFO width is fixed at 32 bits. - 1 slave select output. - Hardware slave-select – Dedicated hardware slave-select line. - Combined interrupt line - one combined interrupt line from the DW_apb_ssi to the interrupt controller. - Interrupt polarity – active high interrupt lines. - Serial clock polarity – low serial-clock polarity directly after reset. - Serial clock phase – capture on first edge of serial-clock directly after reset.
    pub const SSI: *volatile types.peripherals.SSI = @ptrFromInt(0x18000000);
    pub const SYSINFO: *volatile types.peripherals.SYSINFO = @ptrFromInt(0x40000000);
    /// Register block for various chip control signals
    pub const SYSCFG: *volatile types.peripherals.SYSCFG = @ptrFromInt(0x40004000);
    pub const CLOCKS: *volatile types.peripherals.CLOCKS = @ptrFromInt(0x40008000);
    pub const RESETS: *volatile types.peripherals.RESETS = @ptrFromInt(0x4000c000);
    pub const PSM: *volatile types.peripherals.PSM = @ptrFromInt(0x40010000);
    pub const IO_BANK0: *volatile types.peripherals.IO_BANK0 = @ptrFromInt(0x40014000);
    pub const IO_QSPI: *volatile types.peripherals.IO_QSPI = @ptrFromInt(0x40018000);
    pub const PADS_BANK0: *volatile types.peripherals.PADS_BANK0 = @ptrFromInt(0x4001c000);
    pub const PADS_QSPI: *volatile types.peripherals.PADS_QSPI = @ptrFromInt(0x40020000);
    /// Controls the crystal oscillator
    pub const XOSC: *volatile types.peripherals.XOSC = @ptrFromInt(0x40024000);
    pub const PLL_SYS: *volatile types.peripherals.PLL_SYS = @ptrFromInt(0x40028000);
    pub const PLL_USB: *volatile types.peripherals.PLL_SYS = @ptrFromInt(0x4002c000);
    /// Register block for busfabric control signals and performance counters
    pub const BUSCTRL: *volatile types.peripherals.BUSCTRL = @ptrFromInt(0x40030000);
    pub const UART0: *volatile types.peripherals.UART0 = @ptrFromInt(0x40034000);
    pub const UART1: *volatile types.peripherals.UART0 = @ptrFromInt(0x40038000);
    pub const SPI0: *volatile types.peripherals.SPI0 = @ptrFromInt(0x4003c000);
    pub const SPI1: *volatile types.peripherals.SPI0 = @ptrFromInt(0x40040000);
    /// DW_apb_i2c address block List of configuration constants for the Synopsys I2C hardware (you may see references to these in I2C register header; these are *fixed* values, set at hardware design time): IC_ULTRA_FAST_MODE ................ 0x0 IC_UFM_TBUF_CNT_DEFAULT ........... 0x8 IC_UFM_SCL_LOW_COUNT .............. 0x0008 IC_UFM_SCL_HIGH_COUNT ............. 0x0006 IC_TX_TL .......................... 0x0 IC_TX_CMD_BLOCK ................... 0x1 IC_HAS_DMA ........................ 0x1 IC_HAS_ASYNC_FIFO ................. 0x0 IC_SMBUS_ARP ...................... 0x0 IC_FIRST_DATA_BYTE_STATUS ......... 0x1 IC_INTR_IO ........................ 0x1 IC_MASTER_MODE .................... 0x1 IC_DEFAULT_ACK_GENERAL_CALL ....... 0x1 IC_INTR_POL ....................... 0x1 IC_OPTIONAL_SAR ................... 0x0 IC_DEFAULT_TAR_SLAVE_ADDR ......... 0x055 IC_DEFAULT_SLAVE_ADDR ............. 0x055 IC_DEFAULT_HS_SPKLEN .............. 0x1 IC_FS_SCL_HIGH_COUNT .............. 0x0006 IC_HS_SCL_LOW_COUNT ............... 0x0008 IC_DEVICE_ID_VALUE ................ 0x0 IC_10BITADDR_MASTER ............... 0x0 IC_CLK_FREQ_OPTIMIZATION .......... 0x0 IC_DEFAULT_FS_SPKLEN .............. 0x7 IC_ADD_ENCODED_PARAMS ............. 0x0 IC_DEFAULT_SDA_HOLD ............... 0x000001 IC_DEFAULT_SDA_SETUP .............. 0x64 IC_AVOID_RX_FIFO_FLUSH_ON_TX_ABRT . 0x0 IC_CLOCK_PERIOD ................... 100 IC_EMPTYFIFO_HOLD_MASTER_EN ....... 1 IC_RESTART_EN ..................... 0x1 IC_TX_CMD_BLOCK_DEFAULT ........... 0x0 IC_BUS_CLEAR_FEATURE .............. 0x0 IC_CAP_LOADING .................... 100 IC_FS_SCL_LOW_COUNT ............... 0x000d APB_DATA_WIDTH .................... 32 IC_SDA_STUCK_TIMEOUT_DEFAULT ...... 0xffffffff IC_SLV_DATA_NACK_ONLY ............. 0x1 IC_10BITADDR_SLAVE ................ 0x0 IC_CLK_TYPE ....................... 0x0 IC_SMBUS_UDID_MSB ................. 0x0 IC_SMBUS_SUSPEND_ALERT ............ 0x0 IC_HS_SCL_HIGH_COUNT .............. 0x0006 IC_SLV_RESTART_DET_EN ............. 0x1 IC_SMBUS .......................... 0x0 IC_OPTIONAL_SAR_DEFAULT ........... 0x0 IC_PERSISTANT_SLV_ADDR_DEFAULT .... 0x0 IC_USE_COUNTS ..................... 0x0 IC_RX_BUFFER_DEPTH ................ 16 IC_SCL_STUCK_TIMEOUT_DEFAULT ...... 0xffffffff IC_RX_FULL_HLD_BUS_EN ............. 0x1 IC_SLAVE_DISABLE .................. 0x1 IC_RX_TL .......................... 0x0 IC_DEVICE_ID ...................... 0x0 IC_HC_COUNT_VALUES ................ 0x0 I2C_DYNAMIC_TAR_UPDATE ............ 0 IC_SMBUS_CLK_LOW_MEXT_DEFAULT ..... 0xffffffff IC_SMBUS_CLK_LOW_SEXT_DEFAULT ..... 0xffffffff IC_HS_MASTER_CODE ................. 0x1 IC_SMBUS_RST_IDLE_CNT_DEFAULT ..... 0xffff IC_SMBUS_UDID_LSB_DEFAULT ......... 0xffffffff IC_SS_SCL_HIGH_COUNT .............. 0x0028 IC_SS_SCL_LOW_COUNT ............... 0x002f IC_MAX_SPEED_MODE ................. 0x2 IC_STAT_FOR_CLK_STRETCH ........... 0x0 IC_STOP_DET_IF_MASTER_ACTIVE ...... 0x0 IC_DEFAULT_UFM_SPKLEN ............. 0x1 IC_TX_BUFFER_DEPTH ................ 16
    pub const I2C0: *volatile types.peripherals.I2C0 = @ptrFromInt(0x40044000);
    /// DW_apb_i2c address block List of configuration constants for the Synopsys I2C hardware (you may see references to these in I2C register header; these are *fixed* values, set at hardware design time): IC_ULTRA_FAST_MODE ................ 0x0 IC_UFM_TBUF_CNT_DEFAULT ........... 0x8 IC_UFM_SCL_LOW_COUNT .............. 0x0008 IC_UFM_SCL_HIGH_COUNT ............. 0x0006 IC_TX_TL .......................... 0x0 IC_TX_CMD_BLOCK ................... 0x1 IC_HAS_DMA ........................ 0x1 IC_HAS_ASYNC_FIFO ................. 0x0 IC_SMBUS_ARP ...................... 0x0 IC_FIRST_DATA_BYTE_STATUS ......... 0x1 IC_INTR_IO ........................ 0x1 IC_MASTER_MODE .................... 0x1 IC_DEFAULT_ACK_GENERAL_CALL ....... 0x1 IC_INTR_POL ....................... 0x1 IC_OPTIONAL_SAR ................... 0x0 IC_DEFAULT_TAR_SLAVE_ADDR ......... 0x055 IC_DEFAULT_SLAVE_ADDR ............. 0x055 IC_DEFAULT_HS_SPKLEN .............. 0x1 IC_FS_SCL_HIGH_COUNT .............. 0x0006 IC_HS_SCL_LOW_COUNT ............... 0x0008 IC_DEVICE_ID_VALUE ................ 0x0 IC_10BITADDR_MASTER ............... 0x0 IC_CLK_FREQ_OPTIMIZATION .......... 0x0 IC_DEFAULT_FS_SPKLEN .............. 0x7 IC_ADD_ENCODED_PARAMS ............. 0x0 IC_DEFAULT_SDA_HOLD ............... 0x000001 IC_DEFAULT_SDA_SETUP .............. 0x64 IC_AVOID_RX_FIFO_FLUSH_ON_TX_ABRT . 0x0 IC_CLOCK_PERIOD ................... 100 IC_EMPTYFIFO_HOLD_MASTER_EN ....... 1 IC_RESTART_EN ..................... 0x1 IC_TX_CMD_BLOCK_DEFAULT ........... 0x0 IC_BUS_CLEAR_FEATURE .............. 0x0 IC_CAP_LOADING .................... 100 IC_FS_SCL_LOW_COUNT ............... 0x000d APB_DATA_WIDTH .................... 32 IC_SDA_STUCK_TIMEOUT_DEFAULT ...... 0xffffffff IC_SLV_DATA_NACK_ONLY ............. 0x1 IC_10BITADDR_SLAVE ................ 0x0 IC_CLK_TYPE ....................... 0x0 IC_SMBUS_UDID_MSB ................. 0x0 IC_SMBUS_SUSPEND_ALERT ............ 0x0 IC_HS_SCL_HIGH_COUNT .............. 0x0006 IC_SLV_RESTART_DET_EN ............. 0x1 IC_SMBUS .......................... 0x0 IC_OPTIONAL_SAR_DEFAULT ........... 0x0 IC_PERSISTANT_SLV_ADDR_DEFAULT .... 0x0 IC_USE_COUNTS ..................... 0x0 IC_RX_BUFFER_DEPTH ................ 16 IC_SCL_STUCK_TIMEOUT_DEFAULT ...... 0xffffffff IC_RX_FULL_HLD_BUS_EN ............. 0x1 IC_SLAVE_DISABLE .................. 0x1 IC_RX_TL .......................... 0x0 IC_DEVICE_ID ...................... 0x0 IC_HC_COUNT_VALUES ................ 0x0 I2C_DYNAMIC_TAR_UPDATE ............ 0 IC_SMBUS_CLK_LOW_MEXT_DEFAULT ..... 0xffffffff IC_SMBUS_CLK_LOW_SEXT_DEFAULT ..... 0xffffffff IC_HS_MASTER_CODE ................. 0x1 IC_SMBUS_RST_IDLE_CNT_DEFAULT ..... 0xffff IC_SMBUS_UDID_LSB_DEFAULT ......... 0xffffffff IC_SS_SCL_HIGH_COUNT .............. 0x0028 IC_SS_SCL_LOW_COUNT ............... 0x002f IC_MAX_SPEED_MODE ................. 0x2 IC_STAT_FOR_CLK_STRETCH ........... 0x0 IC_STOP_DET_IF_MASTER_ACTIVE ...... 0x0 IC_DEFAULT_UFM_SPKLEN ............. 0x1 IC_TX_BUFFER_DEPTH ................ 16
    pub const I2C1: *volatile types.peripherals.I2C0 = @ptrFromInt(0x40048000);
    /// Control and data interface to SAR ADC
    pub const ADC: *volatile types.peripherals.ADC = @ptrFromInt(0x4004c000);
    /// Simple PWM
    pub const PWM: *volatile types.peripherals.PWM = @ptrFromInt(0x40050000);
    /// Controls time and alarms time is a 64 bit value indicating the time in usec since power-on timeh is the top 32 bits of time & timel is the bottom 32 bits to change time write to timelw before timehw to read time read from timelr before timehr An alarm is set by setting alarm_enable and writing to the corresponding alarm register When an alarm is pending, the corresponding alarm_running signal will be high An alarm can be cancelled before it has finished by clearing the alarm_enable When an alarm fires, the corresponding alarm_irq is set and alarm_running is cleared To clear the interrupt write a 1 to the corresponding alarm_irq
    pub const TIMER: *volatile types.peripherals.TIMER = @ptrFromInt(0x40054000);
    pub const WATCHDOG: *volatile types.peripherals.WATCHDOG = @ptrFromInt(0x40058000);
    /// Register block to control RTC
    pub const RTC: *volatile types.peripherals.RTC = @ptrFromInt(0x4005c000);
    pub const ROSC: *volatile types.peripherals.ROSC = @ptrFromInt(0x40060000);
    /// control and status for on-chip voltage regulator and chip level reset subsystem
    pub const VREG_AND_CHIP_RESET: *volatile types.peripherals.VREG_AND_CHIP_RESET = @ptrFromInt(0x40064000);
    /// Testbench manager. Allows the programmer to know what platform their software is running on.
    pub const TBMAN: *volatile types.peripherals.TBMAN = @ptrFromInt(0x4006c000);
    /// DMA with separate read and write masters
    pub const DMA: *volatile types.peripherals.DMA = @ptrFromInt(0x50000000);
    /// DPRAM layout for USB device.
    pub const USB_DPRAM: *volatile types.peripherals.USB_DPRAM = @ptrFromInt(0x50100000);
    /// USB FS/LS controller device registers
    pub const USB: *volatile types.peripherals.USB = @ptrFromInt(0x50110000);
    /// Programmable IO block
    pub const PIO0: *volatile types.peripherals.PIO0 = @ptrFromInt(0x50200000);
    /// Programmable IO block
    pub const PIO1: *volatile types.peripherals.PIO0 = @ptrFromInt(0x50300000);
    /// Single-cycle IO block Provides core-local and inter-core hardware for the two processors, with single-cycle access.
    pub const SIO: *volatile types.peripherals.SIO = @ptrFromInt(0xd0000000);
    pub const PPB: *volatile types.peripherals.PPB = @ptrFromInt(0xe0000000);
};
