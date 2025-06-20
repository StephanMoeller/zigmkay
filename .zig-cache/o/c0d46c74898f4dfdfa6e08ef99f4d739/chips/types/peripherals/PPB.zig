const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const PPB = extern struct {
    /// offset: 0x00
    reserved0: [57360]u8,
    /// Use the SysTick Control and Status Register to enable the SysTick features.
    /// offset: 0xe010
    SYST_CSR: mmio.Mmio(packed struct(u32) {
        /// Enable SysTick counter: 0 = Counter disabled. 1 = Counter enabled.
        ENABLE: u1,
        /// Enables SysTick exception request: 0 = Counting down to zero does not assert the SysTick exception request. 1 = Counting down to zero to asserts the SysTick exception request.
        TICKINT: u1,
        /// SysTick clock source. Always reads as one if SYST_CALIB reports NOREF. Selects the SysTick timer clock source: 0 = External reference clock. 1 = Processor clock.
        CLKSOURCE: u1,
        reserved16: u13 = 0,
        /// Returns 1 if timer counted to 0 since last time this was read. Clears on read by application or debugger.
        COUNTFLAG: u1,
        padding: u15 = 0,
    }),
    /// Use the SysTick Reload Value Register to specify the start value to load into the current value register when the counter reaches 0. It can be any value between 0 and 0x00FFFFFF. A start value of 0 is possible, but has no effect because the SysTick interrupt and COUNTFLAG are activated when counting from 1 to 0. The reset value of this register is UNKNOWN. To generate a multi-shot timer with a period of N processor clock cycles, use a RELOAD value of N-1. For example, if the SysTick interrupt is required every 100 clock pulses, set RELOAD to 99.
    /// offset: 0xe014
    SYST_RVR: mmio.Mmio(packed struct(u32) {
        /// Value to load into the SysTick Current Value Register when the counter reaches 0.
        RELOAD: u24,
        padding: u8 = 0,
    }),
    /// Use the SysTick Current Value Register to find the current value in the register. The reset value of this register is UNKNOWN.
    /// offset: 0xe018
    SYST_CVR: mmio.Mmio(packed struct(u32) {
        /// Reads return the current value of the SysTick counter. This register is write-clear. Writing to it with any value clears the register to 0. Clearing this register also clears the COUNTFLAG bit of the SysTick Control and Status Register.
        CURRENT: u24,
        padding: u8 = 0,
    }),
    /// Use the SysTick Calibration Value Register to enable software to scale to any required speed using divide and multiply.
    /// offset: 0xe01c
    SYST_CALIB: mmio.Mmio(packed struct(u32) {
        /// An optional Reload value to be used for 10ms (100Hz) timing, subject to system clock skew errors. If the value reads as 0, the calibration value is not known.
        TENMS: u24,
        reserved30: u6 = 0,
        /// If reads as 1, the calibration value for 10ms is inexact (due to clock frequency).
        SKEW: u1,
        /// If reads as 1, the Reference clock is not provided - the CLKSOURCE bit of the SysTick Control and Status register will be forced to 1 and cannot be cleared to 0.
        NOREF: u1,
    }),
    /// offset: 0xe020
    reserved57376: [224]u8,
    /// Use the Interrupt Set-Enable Register to enable interrupts and determine which interrupts are currently enabled. If a pending interrupt is enabled, the NVIC activates the interrupt based on its priority. If an interrupt is not enabled, asserting its interrupt signal changes the interrupt state to pending, but the NVIC never activates the interrupt, regardless of its priority.
    /// offset: 0xe100
    NVIC_ISER: mmio.Mmio(packed struct(u32) {
        /// Interrupt set-enable bits. Write: 0 = No effect. 1 = Enable interrupt. Read: 0 = Interrupt disabled. 1 = Interrupt enabled.
        SETENA: u32,
    }),
    /// offset: 0xe104
    reserved57604: [124]u8,
    /// Use the Interrupt Clear-Enable Registers to disable interrupts and determine which interrupts are currently enabled.
    /// offset: 0xe180
    NVIC_ICER: mmio.Mmio(packed struct(u32) {
        /// Interrupt clear-enable bits. Write: 0 = No effect. 1 = Disable interrupt. Read: 0 = Interrupt disabled. 1 = Interrupt enabled.
        CLRENA: u32,
    }),
    /// offset: 0xe184
    reserved57732: [124]u8,
    /// The NVIC_ISPR forces interrupts into the pending state, and shows which interrupts are pending.
    /// offset: 0xe200
    NVIC_ISPR: mmio.Mmio(packed struct(u32) {
        /// Interrupt set-pending bits. Write: 0 = No effect. 1 = Changes interrupt state to pending. Read: 0 = Interrupt is not pending. 1 = Interrupt is pending. Note: Writing 1 to the NVIC_ISPR bit corresponding to: An interrupt that is pending has no effect. A disabled interrupt sets the state of that interrupt to pending.
        SETPEND: u32,
    }),
    /// offset: 0xe204
    reserved57860: [124]u8,
    /// Use the Interrupt Clear-Pending Register to clear pending interrupts and determine which interrupts are currently pending.
    /// offset: 0xe280
    NVIC_ICPR: mmio.Mmio(packed struct(u32) {
        /// Interrupt clear-pending bits. Write: 0 = No effect. 1 = Removes pending state and interrupt. Read: 0 = Interrupt is not pending. 1 = Interrupt is pending.
        CLRPEND: u32,
    }),
    /// offset: 0xe284
    reserved57988: [380]u8,
    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest. Note: Writing 1 to an NVIC_ICPR bit does not affect the active state of the corresponding interrupt. These registers are only word-accessible
    /// offset: 0xe400
    NVIC_IPR0: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// Priority of interrupt 0
        IP_0: u2,
        reserved14: u6 = 0,
        /// Priority of interrupt 1
        IP_1: u2,
        reserved22: u6 = 0,
        /// Priority of interrupt 2
        IP_2: u2,
        reserved30: u6 = 0,
        /// Priority of interrupt 3
        IP_3: u2,
    }),
    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    /// offset: 0xe404
    NVIC_IPR1: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// Priority of interrupt 4
        IP_4: u2,
        reserved14: u6 = 0,
        /// Priority of interrupt 5
        IP_5: u2,
        reserved22: u6 = 0,
        /// Priority of interrupt 6
        IP_6: u2,
        reserved30: u6 = 0,
        /// Priority of interrupt 7
        IP_7: u2,
    }),
    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    /// offset: 0xe408
    NVIC_IPR2: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// Priority of interrupt 8
        IP_8: u2,
        reserved14: u6 = 0,
        /// Priority of interrupt 9
        IP_9: u2,
        reserved22: u6 = 0,
        /// Priority of interrupt 10
        IP_10: u2,
        reserved30: u6 = 0,
        /// Priority of interrupt 11
        IP_11: u2,
    }),
    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    /// offset: 0xe40c
    NVIC_IPR3: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// Priority of interrupt 12
        IP_12: u2,
        reserved14: u6 = 0,
        /// Priority of interrupt 13
        IP_13: u2,
        reserved22: u6 = 0,
        /// Priority of interrupt 14
        IP_14: u2,
        reserved30: u6 = 0,
        /// Priority of interrupt 15
        IP_15: u2,
    }),
    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    /// offset: 0xe410
    NVIC_IPR4: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// Priority of interrupt 16
        IP_16: u2,
        reserved14: u6 = 0,
        /// Priority of interrupt 17
        IP_17: u2,
        reserved22: u6 = 0,
        /// Priority of interrupt 18
        IP_18: u2,
        reserved30: u6 = 0,
        /// Priority of interrupt 19
        IP_19: u2,
    }),
    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    /// offset: 0xe414
    NVIC_IPR5: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// Priority of interrupt 20
        IP_20: u2,
        reserved14: u6 = 0,
        /// Priority of interrupt 21
        IP_21: u2,
        reserved22: u6 = 0,
        /// Priority of interrupt 22
        IP_22: u2,
        reserved30: u6 = 0,
        /// Priority of interrupt 23
        IP_23: u2,
    }),
    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    /// offset: 0xe418
    NVIC_IPR6: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// Priority of interrupt 24
        IP_24: u2,
        reserved14: u6 = 0,
        /// Priority of interrupt 25
        IP_25: u2,
        reserved22: u6 = 0,
        /// Priority of interrupt 26
        IP_26: u2,
        reserved30: u6 = 0,
        /// Priority of interrupt 27
        IP_27: u2,
    }),
    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    /// offset: 0xe41c
    NVIC_IPR7: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// Priority of interrupt 28
        IP_28: u2,
        reserved14: u6 = 0,
        /// Priority of interrupt 29
        IP_29: u2,
        reserved22: u6 = 0,
        /// Priority of interrupt 30
        IP_30: u2,
        reserved30: u6 = 0,
        /// Priority of interrupt 31
        IP_31: u2,
    }),
    /// offset: 0xe420
    reserved58400: [2272]u8,
    /// Read the CPU ID Base Register to determine: the ID number of the processor core, the version number of the processor core, the implementation details of the processor core.
    /// offset: 0xed00
    CPUID: mmio.Mmio(packed struct(u32) {
        /// Minor revision number m in the rnpm revision status: 0x1 = Patch 1.
        REVISION: u4,
        /// Number of processor within family: 0xC60 = Cortex-M0+
        PARTNO: u12,
        /// Constant that defines the architecture of the processor: 0xC = ARMv6-M architecture.
        ARCHITECTURE: u4,
        /// Major revision number n in the rnpm revision status: 0x0 = Revision 0.
        VARIANT: u4,
        /// Implementor code: 0x41 = ARM
        IMPLEMENTER: u8,
    }),
    /// Use the Interrupt Control State Register to set a pending Non-Maskable Interrupt (NMI), set or clear a pending PendSV, set or clear a pending SysTick, check for pending exceptions, check the vector number of the highest priority pended exception, check the vector number of the active exception.
    /// offset: 0xed04
    ICSR: mmio.Mmio(packed struct(u32) {
        /// Active exception number field. Reset clears the VECTACTIVE field.
        VECTACTIVE: u9,
        reserved12: u3 = 0,
        /// Indicates the exception number for the highest priority pending exception: 0 = no pending exceptions. Non zero = The pending state includes the effect of memory-mapped enable and mask registers. It does not include the PRIMASK special-purpose register qualifier.
        VECTPENDING: u9,
        reserved22: u1 = 0,
        /// External interrupt pending flag
        ISRPENDING: u1,
        /// The system can only access this bit when the core is halted. It indicates that a pending interrupt is to be taken in the next running cycle. If C_MASKINTS is clear in the Debug Halting Control and Status Register, the interrupt is serviced.
        ISRPREEMPT: u1,
        reserved25: u1 = 0,
        /// SysTick exception clear-pending bit. Write: 0 = No effect. 1 = Removes the pending state from the SysTick exception. This bit is WO. On a register read its value is Unknown.
        PENDSTCLR: u1,
        /// SysTick exception set-pending bit. Write: 0 = No effect. 1 = Changes SysTick exception state to pending. Read: 0 = SysTick exception is not pending. 1 = SysTick exception is pending.
        PENDSTSET: u1,
        /// PendSV clear-pending bit. Write: 0 = No effect. 1 = Removes the pending state from the PendSV exception.
        PENDSVCLR: u1,
        /// PendSV set-pending bit. Write: 0 = No effect. 1 = Changes PendSV exception state to pending. Read: 0 = PendSV exception is not pending. 1 = PendSV exception is pending. Writing 1 to this bit is the only way to set the PendSV exception state to pending.
        PENDSVSET: u1,
        reserved31: u2 = 0,
        /// Setting this bit will activate an NMI. Since NMI is the highest priority exception, it will activate as soon as it is registered. NMI set-pending bit. Write: 0 = No effect. 1 = Changes NMI exception state to pending. Read: 0 = NMI exception is not pending. 1 = NMI exception is pending. Because NMI is the highest-priority exception, normally the processor enters the NMI exception handler as soon as it detects a write of 1 to this bit. Entering the handler then clears this bit to 0. This means a read of this bit by the NMI exception handler returns 1 only if the NMI signal is reasserted while the processor is executing that handler.
        NMIPENDSET: u1,
    }),
    /// The VTOR holds the vector table offset address.
    /// offset: 0xed08
    VTOR: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Bits [31:8] of the indicate the vector table offset address.
        TBLOFF: u24,
    }),
    /// Use the Application Interrupt and Reset Control Register to: determine data endianness, clear all active state information from debug halt mode, request a system reset.
    /// offset: 0xed0c
    AIRCR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Clears all active state information for fixed and configurable exceptions. This bit: is self-clearing, can only be set by the DAP when the core is halted. When set: clears all active exception status of the processor, forces a return to Thread mode, forces an IPSR of 0. A debugger must re-initialize the stack.
        VECTCLRACTIVE: u1,
        /// Writing 1 to this bit causes the SYSRESETREQ signal to the outer system to be asserted to request a reset. The intention is to force a large system reset of all major components except for debug. The C_HALT bit in the DHCSR is cleared as a result of the system reset requested. The debugger does not lose contact with the device.
        SYSRESETREQ: u1,
        reserved15: u12 = 0,
        /// Data endianness implemented: 0 = Little-endian.
        ENDIANESS: u1,
        /// Register key: Reads as Unknown On writes, write 0x05FA to VECTKEY, otherwise the write is ignored.
        VECTKEY: u16,
    }),
    /// System Control Register. Use the System Control Register for power-management functions: signal to the system when the processor can enter a low power state, control how the processor enters and exits low power states.
    /// offset: 0xed10
    SCR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Indicates sleep-on-exit when returning from Handler mode to Thread mode: 0 = Do not sleep when returning to Thread mode. 1 = Enter sleep, or deep sleep, on return from an ISR to Thread mode. Setting this bit to 1 enables an interrupt driven application to avoid returning to an empty main application.
        SLEEPONEXIT: u1,
        /// Controls whether the processor uses sleep or deep sleep as its low power mode: 0 = Sleep. 1 = Deep sleep.
        SLEEPDEEP: u1,
        reserved4: u1 = 0,
        /// Send Event on Pending bit: 0 = Only enabled interrupts or events can wakeup the processor, disabled interrupts are excluded. 1 = Enabled events and all interrupts, including disabled interrupts, can wakeup the processor. When an event or interrupt becomes pending, the event signal wakes up the processor from WFE. If the processor is not waiting for an event, the event is registered and affects the next WFE. The processor also wakes up on execution of an SEV instruction or an external event.
        SEVONPEND: u1,
        padding: u27 = 0,
    }),
    /// The Configuration and Control Register permanently enables stack alignment and causes unaligned accesses to result in a Hard Fault.
    /// offset: 0xed14
    CCR: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// Always reads as one, indicates that all unaligned accesses generate a HardFault.
        UNALIGN_TRP: u1,
        reserved9: u5 = 0,
        /// Always reads as one, indicates 8-byte stack alignment on exception entry. On exception entry, the processor uses bit[9] of the stacked PSR to indicate the stack alignment. On return from the exception it uses this stacked bit to restore the correct stack alignment.
        STKALIGN: u1,
        padding: u22 = 0,
    }),
    /// offset: 0xed18
    reserved60696: [4]u8,
    /// System handlers are a special class of exception handler that can have their priority set to any of the priority levels. Use the System Handler Priority Register 2 to set the priority of SVCall.
    /// offset: 0xed1c
    SHPR2: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// Priority of system handler 11, SVCall
        PRI_11: u2,
    }),
    /// System handlers are a special class of exception handler that can have their priority set to any of the priority levels. Use the System Handler Priority Register 3 to set the priority of PendSV and SysTick.
    /// offset: 0xed20
    SHPR3: mmio.Mmio(packed struct(u32) {
        reserved22: u22 = 0,
        /// Priority of system handler 14, PendSV
        PRI_14: u2,
        reserved30: u6 = 0,
        /// Priority of system handler 15, SysTick
        PRI_15: u2,
    }),
    /// Use the System Handler Control and State Register to determine or clear the pending status of SVCall.
    /// offset: 0xed24
    SHCSR: mmio.Mmio(packed struct(u32) {
        reserved15: u15 = 0,
        /// Reads as 1 if SVCall is Pending. Write 1 to set pending SVCall, write 0 to clear pending SVCall.
        SVCALLPENDED: u1,
        padding: u16 = 0,
    }),
    /// offset: 0xed28
    reserved60712: [104]u8,
    /// Read the MPU Type Register to determine if the processor implements an MPU, and how many regions the MPU supports.
    /// offset: 0xed90
    MPU_TYPE: mmio.Mmio(packed struct(u32) {
        /// Indicates support for separate instruction and data address maps. Reads as 0 as ARMv6-M only supports a unified MPU.
        SEPARATE: u1,
        reserved8: u7 = 0,
        /// Number of regions supported by the MPU.
        DREGION: u8,
        /// Instruction region. Reads as zero as ARMv6-M only supports a unified MPU.
        IREGION: u8,
        padding: u8 = 0,
    }),
    /// Use the MPU Control Register to enable and disable the MPU, and to control whether the default memory map is enabled as a background region for privileged accesses, and whether the MPU is enabled for HardFaults and NMIs.
    /// offset: 0xed94
    MPU_CTRL: mmio.Mmio(packed struct(u32) {
        /// Enables the MPU. If the MPU is disabled, privileged and unprivileged accesses use the default memory map. 0 = MPU disabled. 1 = MPU enabled.
        ENABLE: u1,
        /// Controls the use of the MPU for HardFaults and NMIs. Setting this bit when ENABLE is clear results in UNPREDICTABLE behaviour. When the MPU is enabled: 0 = MPU is disabled during HardFault and NMI handlers, regardless of the value of the ENABLE bit. 1 = the MPU is enabled during HardFault and NMI handlers.
        HFNMIENA: u1,
        /// Controls whether the default memory map is enabled as a background region for privileged accesses. This bit is ignored when ENABLE is clear. 0 = If the MPU is enabled, disables use of the default memory map. Any memory access to a location not covered by any enabled region causes a fault. 1 = If the MPU is enabled, enables use of the default memory map as a background region for privileged software accesses. When enabled, the background region acts as if it is region number -1. Any region that is defined and enabled has priority over this default map.
        PRIVDEFENA: u1,
        padding: u29 = 0,
    }),
    /// Use the MPU Region Number Register to select the region currently accessed by MPU_RBAR and MPU_RASR.
    /// offset: 0xed98
    MPU_RNR: mmio.Mmio(packed struct(u32) {
        /// Indicates the MPU region referenced by the MPU_RBAR and MPU_RASR registers. The MPU supports 8 memory regions, so the permitted values of this field are 0-7.
        REGION: u4,
        padding: u28 = 0,
    }),
    /// Read the MPU Region Base Address Register to determine the base address of the region identified by MPU_RNR. Write to update the base address of said region or that of a specified region, with whose number MPU_RNR will also be updated.
    /// offset: 0xed9c
    MPU_RBAR: mmio.Mmio(packed struct(u32) {
        /// On writes, specifies the number of the region whose base address to update provided VALID is set written as 1. On reads, returns bits [3:0] of MPU_RNR.
        REGION: u4,
        /// On writes, indicates whether the write must update the base address of the region identified by the REGION field, updating the MPU_RNR to indicate this new region. Write: 0 = MPU_RNR not changed, and the processor: Updates the base address for the region specified in the MPU_RNR. Ignores the value of the REGION field. 1 = The processor: Updates the value of the MPU_RNR to the value of the REGION field. Updates the base address for the region specified in the REGION field. Always reads as zero.
        VALID: u1,
        reserved8: u3 = 0,
        /// Base address of the region.
        ADDR: u24,
    }),
    /// Use the MPU Region Attribute and Size Register to define the size, access behaviour and memory type of the region identified by MPU_RNR, and enable that region.
    /// offset: 0xeda0
    MPU_RASR: mmio.Mmio(packed struct(u32) {
        /// Enables the region.
        ENABLE: u1,
        /// Indicates the region size. Region size in bytes = 2^(SIZE+1). The minimum permitted value is 7 (b00111) = 256Bytes
        SIZE: u5,
        reserved8: u2 = 0,
        /// Subregion Disable. For regions of 256 bytes or larger, each bit of this field controls whether one of the eight equal subregions is enabled.
        SRD: u8,
        /// The MPU Region Attribute field. Use to define the region attribute control. 28 = XN: Instruction access disable bit: 0 = Instruction fetches enabled. 1 = Instruction fetches disabled. 26:24 = AP: Access permission field 18 = S: Shareable bit 17 = C: Cacheable bit 16 = B: Bufferable bit
        ATTRS: u16,
    }),
};
