const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Controls time and alarms time is a 64 bit value indicating the time in usec since power-on timeh is the top 32 bits of time & timel is the bottom 32 bits to change time write to timelw before timehw to read time read from timelr before timehr An alarm is set by setting alarm_enable and writing to the corresponding alarm register When an alarm is pending, the corresponding alarm_running signal will be high An alarm can be cancelled before it has finished by clearing the alarm_enable When an alarm fires, the corresponding alarm_irq is set and alarm_running is cleared To clear the interrupt write a 1 to the corresponding alarm_irq
pub const TIMER = extern struct {
    /// Write to bits 63:32 of time always write timelw before timehw
    /// offset: 0x00
    TIMEHW: mmio.Mmio(packed struct(u32) {
        TIMEHW: u32,
    }),
    /// Write to bits 31:0 of time writes do not get copied to time until timehw is written
    /// offset: 0x04
    TIMELW: mmio.Mmio(packed struct(u32) {
        TIMELW: u32,
    }),
    /// Read from bits 63:32 of time always read timelr before timehr
    /// offset: 0x08
    TIMEHR: mmio.Mmio(packed struct(u32) {
        TIMEHR: u32,
    }),
    /// Read from bits 31:0 of time
    /// offset: 0x0c
    TIMELR: mmio.Mmio(packed struct(u32) {
        TIMELR: u32,
    }),
    /// Arm alarm 0, and configure the time it will fire. Once armed, the alarm fires when TIMER_ALARM0 == TIMELR. The alarm will disarm itself once it fires, and can be disarmed early using the ARMED status register.
    /// offset: 0x10
    ALARM0: mmio.Mmio(packed struct(u32) {
        ALARM0: u32,
    }),
    /// Arm alarm 1, and configure the time it will fire. Once armed, the alarm fires when TIMER_ALARM1 == TIMELR. The alarm will disarm itself once it fires, and can be disarmed early using the ARMED status register.
    /// offset: 0x14
    ALARM1: mmio.Mmio(packed struct(u32) {
        ALARM1: u32,
    }),
    /// Arm alarm 2, and configure the time it will fire. Once armed, the alarm fires when TIMER_ALARM2 == TIMELR. The alarm will disarm itself once it fires, and can be disarmed early using the ARMED status register.
    /// offset: 0x18
    ALARM2: mmio.Mmio(packed struct(u32) {
        ALARM2: u32,
    }),
    /// Arm alarm 3, and configure the time it will fire. Once armed, the alarm fires when TIMER_ALARM3 == TIMELR. The alarm will disarm itself once it fires, and can be disarmed early using the ARMED status register.
    /// offset: 0x1c
    ALARM3: mmio.Mmio(packed struct(u32) {
        ALARM3: u32,
    }),
    /// Indicates the armed/disarmed status of each alarm. A write to the corresponding ALARMx register arms the alarm. Alarms automatically disarm upon firing, but writing ones here will disarm immediately without waiting to fire.
    /// offset: 0x20
    ARMED: mmio.Mmio(packed struct(u32) {
        ARMED: u4,
        padding: u28 = 0,
    }),
    /// Raw read from bits 63:32 of time (no side effects)
    /// offset: 0x24
    TIMERAWH: mmio.Mmio(packed struct(u32) {
        TIMERAWH: u32,
    }),
    /// Raw read from bits 31:0 of time (no side effects)
    /// offset: 0x28
    TIMERAWL: mmio.Mmio(packed struct(u32) {
        TIMERAWL: u32,
    }),
    /// Set bits high to enable pause when the corresponding debug ports are active
    /// offset: 0x2c
    DBGPAUSE: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Pause when processor 0 is in debug mode
        DBG0: u1,
        /// Pause when processor 1 is in debug mode
        DBG1: u1,
        padding: u29 = 0,
    }),
    /// Set high to pause the timer
    /// offset: 0x30
    PAUSE: mmio.Mmio(packed struct(u32) {
        PAUSE: u1,
        padding: u31 = 0,
    }),
    /// Raw Interrupts
    /// offset: 0x34
    INTR: mmio.Mmio(packed struct(u32) {
        ALARM_0: u1,
        ALARM_1: u1,
        ALARM_2: u1,
        ALARM_3: u1,
        padding: u28 = 0,
    }),
    /// Interrupt Enable
    /// offset: 0x38
    INTE: mmio.Mmio(packed struct(u32) {
        ALARM_0: u1,
        ALARM_1: u1,
        ALARM_2: u1,
        ALARM_3: u1,
        padding: u28 = 0,
    }),
    /// Interrupt Force
    /// offset: 0x3c
    INTF: mmio.Mmio(packed struct(u32) {
        ALARM_0: u1,
        ALARM_1: u1,
        ALARM_2: u1,
        ALARM_3: u1,
        padding: u28 = 0,
    }),
    /// Interrupt status after masking & forcing
    /// offset: 0x40
    INTS: mmio.Mmio(packed struct(u32) {
        ALARM_0: u1,
        ALARM_1: u1,
        ALARM_2: u1,
        ALARM_3: u1,
        padding: u28 = 0,
    }),
};
