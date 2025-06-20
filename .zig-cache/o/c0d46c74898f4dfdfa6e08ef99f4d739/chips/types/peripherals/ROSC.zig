const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

pub const ROSC = extern struct {
    /// Ring Oscillator control
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Controls the number of delay stages in the ROSC ring LOW uses stages 0 to 7 MEDIUM uses stages 2 to 7 HIGH uses stages 4 to 7 TOOHIGH uses stages 6 to 7 and should not be used because its frequency exceeds design specifications The clock output will not glitch when changing the range up one step at a time The clock output will glitch when changing the range down Note: the values here are gray coded which is why HIGH comes before TOOHIGH
        FREQ_RANGE: enum(u12) {
            LOW = 0xfa4,
            MEDIUM = 0xfa5,
            TOOHIGH = 0xfa6,
            HIGH = 0xfa7,
            _,
        },
        /// On power-up this field is initialised to ENABLE The system clock must be switched to another source before setting this field to DISABLE otherwise the chip will lock up The 12-bit code is intended to give some protection against accidental writes. An invalid setting will enable the oscillator.
        ENABLE: enum(u12) {
            DISABLE = 0xd1e,
            ENABLE = 0xfab,
            _,
        },
        padding: u8 = 0,
    }),
    /// The FREQA & FREQB registers control the frequency by controlling the drive strength of each stage The drive strength has 4 levels determined by the number of bits set Increasing the number of bits set increases the drive strength and increases the oscillation frequency 0 bits set is the default drive strength 1 bit set doubles the drive strength 2 bits set triples drive strength 3 bits set quadruples drive strength
    /// offset: 0x04
    FREQA: mmio.Mmio(packed struct(u32) {
        /// Stage 0 drive strength
        DS0: u3,
        reserved4: u1 = 0,
        /// Stage 1 drive strength
        DS1: u3,
        reserved8: u1 = 0,
        /// Stage 2 drive strength
        DS2: u3,
        reserved12: u1 = 0,
        /// Stage 3 drive strength
        DS3: u3,
        reserved16: u1 = 0,
        /// Set to 0x9696 to apply the settings Any other value in this field will set all drive strengths to 0
        PASSWD: enum(u16) {
            PASS = 0x9696,
            _,
        },
    }),
    /// For a detailed description see freqa register
    /// offset: 0x08
    FREQB: mmio.Mmio(packed struct(u32) {
        /// Stage 4 drive strength
        DS4: u3,
        reserved4: u1 = 0,
        /// Stage 5 drive strength
        DS5: u3,
        reserved8: u1 = 0,
        /// Stage 6 drive strength
        DS6: u3,
        reserved12: u1 = 0,
        /// Stage 7 drive strength
        DS7: u3,
        reserved16: u1 = 0,
        /// Set to 0x9696 to apply the settings Any other value in this field will set all drive strengths to 0
        PASSWD: enum(u16) {
            PASS = 0x9696,
            _,
        },
    }),
    /// Ring Oscillator pause control
    /// offset: 0x0c
    DORMANT: mmio.Mmio(packed struct(u32) {
        /// This is used to save power by pausing the ROSC On power-up this field is initialised to WAKE An invalid write will also select WAKE Warning: setup the irq before selecting dormant mode
        DORMANT: enum(u32) {
            dormant = 0x636f6d61,
            WAKE = 0x77616b65,
            _,
        },
    }),
    /// Controls the output divider
    /// offset: 0x10
    DIV: mmio.Mmio(packed struct(u32) {
        /// set to 0xaa0 + div where div = 0 divides by 32 div = 1-31 divides by div any other value sets div=31 this register resets to div=16
        DIV: enum(u12) {
            PASS = 0xaa0,
            _,
        },
        padding: u20 = 0,
    }),
    /// Controls the phase shifted output
    /// offset: 0x14
    PHASE: mmio.Mmio(packed struct(u32) {
        /// phase shift the phase-shifted output by SHIFT input clocks this can be changed on-the-fly must be set to 0 before setting div=1
        SHIFT: u2,
        /// invert the phase-shifted output this is ignored when div=1
        FLIP: u1,
        /// enable the phase-shifted output this can be changed on-the-fly
        ENABLE: u1,
        /// set to 0xaa any other value enables the output with shift=0
        PASSWD: u8,
        padding: u20 = 0,
    }),
    /// Ring Oscillator Status
    /// offset: 0x18
    STATUS: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Oscillator is enabled but not necessarily running and stable this resets to 0 but transitions to 1 during chip startup
        ENABLED: u1,
        reserved16: u3 = 0,
        /// post-divider is running this resets to 0 but transitions to 1 during chip startup
        DIV_RUNNING: u1,
        reserved24: u7 = 0,
        /// An invalid value has been written to CTRL_ENABLE or CTRL_FREQ_RANGE or FREQA or FREQB or DIV or PHASE or DORMANT
        BADWRITE: u1,
        reserved31: u6 = 0,
        /// Oscillator is running and stable
        STABLE: u1,
    }),
    /// This just reads the state of the oscillator output so randomness is compromised if the ring oscillator is stopped or run at a harmonic of the bus frequency
    /// offset: 0x1c
    RANDOMBIT: mmio.Mmio(packed struct(u32) {
        RANDOMBIT: u1,
        padding: u31 = 0,
    }),
    /// A down counter running at the ROSC frequency which counts to zero and stops. To start the counter write a non-zero value. Can be used for short software pauses when setting up time sensitive hardware.
    /// offset: 0x20
    COUNT: mmio.Mmio(packed struct(u32) {
        COUNT: u8,
        padding: u24 = 0,
    }),
};
