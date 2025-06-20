const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Programmable IO block
pub const PIO0 = extern struct {
    /// PIO control register
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Enable/disable each of the four state machines by writing 1/0 to each of these four bits. When disabled, a state machine will cease executing instructions, except those written directly to SMx_INSTR by the system. Multiple bits can be set/cleared at once to run/halt multiple state machines simultaneously.
        SM_ENABLE: u4,
        /// Write 1 to instantly clear internal SM state which may be otherwise difficult to access and will affect future execution. Specifically, the following are cleared: input and output shift counters; the contents of the input shift register; the delay counter; the waiting-on-IRQ state; any stalled instruction written to SMx_INSTR or run by OUT/MOV EXEC; any pin write left asserted due to OUT_STICKY. The program counter, the contents of the output shift register and the X/Y scratch registers are not affected.
        SM_RESTART: u4,
        /// Restart a state machine's clock divider from an initial phase of 0. Clock dividers are free-running, so once started, their output (including fractional jitter) is completely determined by the integer/fractional divisor configured in SMx_CLKDIV. This means that, if multiple clock dividers with the same divisor are restarted simultaneously, by writing multiple 1 bits to this field, the execution clocks of those state machines will run in precise lockstep. Note that setting/clearing SM_ENABLE does not stop the clock divider from running, so once multiple state machines' clocks are synchronised, it is safe to disable/reenable a state machine, whilst keeping the clock dividers in sync. Note also that CLKDIV_RESTART can be written to whilst the state machine is running, and this is useful to resynchronise clock dividers after the divisors (SMx_CLKDIV) have been changed on-the-fly.
        CLKDIV_RESTART: u4,
        padding: u20 = 0,
    }),
    /// FIFO status register
    /// offset: 0x04
    FSTAT: mmio.Mmio(packed struct(u32) {
        /// State machine RX FIFO is full
        RXFULL: u4,
        reserved8: u4 = 0,
        /// State machine RX FIFO is empty
        RXEMPTY: u4,
        reserved16: u4 = 0,
        /// State machine TX FIFO is full
        TXFULL: u4,
        reserved24: u4 = 0,
        /// State machine TX FIFO is empty
        TXEMPTY: u4,
        padding: u4 = 0,
    }),
    /// FIFO debug register
    /// offset: 0x08
    FDEBUG: mmio.Mmio(packed struct(u32) {
        /// State machine has stalled on full RX FIFO during a blocking PUSH, or an IN with autopush enabled. This flag is also set when a nonblocking PUSH to a full FIFO took place, in which case the state machine has dropped data. Write 1 to clear.
        RXSTALL: u4,
        reserved8: u4 = 0,
        /// RX FIFO underflow (i.e. read-on-empty by the system) has occurred. Write 1 to clear. Note that read-on-empty does not perturb the state of the FIFO in any way, but the data returned by reading from an empty FIFO is undefined, so this flag generally only becomes set due to some kind of software error.
        RXUNDER: u4,
        reserved16: u4 = 0,
        /// TX FIFO overflow (i.e. write-on-full by the system) has occurred. Write 1 to clear. Note that write-on-full does not alter the state or contents of the FIFO in any way, but the data that the system attempted to write is dropped, so if this flag is set, your software has quite likely dropped some data on the floor.
        TXOVER: u4,
        reserved24: u4 = 0,
        /// State machine has stalled on empty TX FIFO during a blocking PULL, or an OUT with autopull enabled. Write 1 to clear.
        TXSTALL: u4,
        padding: u4 = 0,
    }),
    /// FIFO levels
    /// offset: 0x0c
    FLEVEL: mmio.Mmio(packed struct(u32) {
        TX0: u4,
        RX0: u4,
        TX1: u4,
        RX1: u4,
        TX2: u4,
        RX2: u4,
        TX3: u4,
        RX3: u4,
    }),
    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    /// offset: 0x10
    TXF0: mmio.Mmio(packed struct(u32) {
        TXF0: u32,
    }),
    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    /// offset: 0x14
    TXF1: mmio.Mmio(packed struct(u32) {
        TXF1: u32,
    }),
    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    /// offset: 0x18
    TXF2: mmio.Mmio(packed struct(u32) {
        TXF2: u32,
    }),
    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    /// offset: 0x1c
    TXF3: mmio.Mmio(packed struct(u32) {
        TXF3: u32,
    }),
    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    /// offset: 0x20
    RXF0: mmio.Mmio(packed struct(u32) {
        RXF0: u32,
    }),
    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    /// offset: 0x24
    RXF1: mmio.Mmio(packed struct(u32) {
        RXF1: u32,
    }),
    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    /// offset: 0x28
    RXF2: mmio.Mmio(packed struct(u32) {
        RXF2: u32,
    }),
    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    /// offset: 0x2c
    RXF3: mmio.Mmio(packed struct(u32) {
        RXF3: u32,
    }),
    /// State machine IRQ flags register. Write 1 to clear. There are 8 state machine IRQ flags, which can be set, cleared, and waited on by the state machines. There's no fixed association between flags and state machines -- any state machine can use any flag. Any of the 8 flags can be used for timing synchronisation between state machines, using IRQ and WAIT instructions. The lower four of these flags are also routed out to system-level interrupt requests, alongside FIFO status interrupts -- see e.g. IRQ0_INTE.
    /// offset: 0x30
    IRQ: mmio.Mmio(packed struct(u32) {
        IRQ: u8,
        padding: u24 = 0,
    }),
    /// Writing a 1 to each of these bits will forcibly assert the corresponding IRQ. Note this is different to the INTF register: writing here affects PIO internal state. INTF just asserts the processor-facing IRQ signal for testing ISRs, and is not visible to the state machines.
    /// offset: 0x34
    IRQ_FORCE: mmio.Mmio(packed struct(u32) {
        IRQ_FORCE: u8,
        padding: u24 = 0,
    }),
    /// There is a 2-flipflop synchronizer on each GPIO input, which protects PIO logic from metastabilities. This increases input delay, and for fast synchronous IO (e.g. SPI) these synchronizers may need to be bypassed. Each bit in this register corresponds to one GPIO. 0 -> input is synchronized (default) 1 -> synchronizer is bypassed If in doubt, leave this register as all zeroes.
    /// offset: 0x38
    INPUT_SYNC_BYPASS: mmio.Mmio(packed struct(u32) {
        INPUT_SYNC_BYPASS: u32,
    }),
    /// Read to sample the pad output values PIO is currently driving to the GPIOs. On RP2040 there are 30 GPIOs, so the two most significant bits are hardwired to 0.
    /// offset: 0x3c
    DBG_PADOUT: mmio.Mmio(packed struct(u32) {
        DBG_PADOUT: u32,
    }),
    /// Read to sample the pad output enables (direction) PIO is currently driving to the GPIOs. On RP2040 there are 30 GPIOs, so the two most significant bits are hardwired to 0.
    /// offset: 0x40
    DBG_PADOE: mmio.Mmio(packed struct(u32) {
        DBG_PADOE: u32,
    }),
    /// The PIO hardware has some free parameters that may vary between chip products. These should be provided in the chip datasheet, but are also exposed here.
    /// offset: 0x44
    DBG_CFGINFO: mmio.Mmio(packed struct(u32) {
        /// The depth of the state machine TX/RX FIFOs, measured in words. Joining fifos via SHIFTCTRL_FJOIN gives one FIFO with double this depth.
        FIFO_DEPTH: u6,
        reserved8: u2 = 0,
        /// The number of state machines this PIO instance is equipped with.
        SM_COUNT: u4,
        reserved16: u4 = 0,
        /// The size of the instruction memory, measured in units of one instruction
        IMEM_SIZE: u6,
        padding: u10 = 0,
    }),
    /// Write-only access to instruction memory location 0
    /// offset: 0x48
    INSTR_MEM0: mmio.Mmio(packed struct(u32) {
        INSTR_MEM0: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 1
    /// offset: 0x4c
    INSTR_MEM1: mmio.Mmio(packed struct(u32) {
        INSTR_MEM1: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 2
    /// offset: 0x50
    INSTR_MEM2: mmio.Mmio(packed struct(u32) {
        INSTR_MEM2: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 3
    /// offset: 0x54
    INSTR_MEM3: mmio.Mmio(packed struct(u32) {
        INSTR_MEM3: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 4
    /// offset: 0x58
    INSTR_MEM4: mmio.Mmio(packed struct(u32) {
        INSTR_MEM4: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 5
    /// offset: 0x5c
    INSTR_MEM5: mmio.Mmio(packed struct(u32) {
        INSTR_MEM5: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 6
    /// offset: 0x60
    INSTR_MEM6: mmio.Mmio(packed struct(u32) {
        INSTR_MEM6: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 7
    /// offset: 0x64
    INSTR_MEM7: mmio.Mmio(packed struct(u32) {
        INSTR_MEM7: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 8
    /// offset: 0x68
    INSTR_MEM8: mmio.Mmio(packed struct(u32) {
        INSTR_MEM8: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 9
    /// offset: 0x6c
    INSTR_MEM9: mmio.Mmio(packed struct(u32) {
        INSTR_MEM9: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 10
    /// offset: 0x70
    INSTR_MEM10: mmio.Mmio(packed struct(u32) {
        INSTR_MEM10: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 11
    /// offset: 0x74
    INSTR_MEM11: mmio.Mmio(packed struct(u32) {
        INSTR_MEM11: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 12
    /// offset: 0x78
    INSTR_MEM12: mmio.Mmio(packed struct(u32) {
        INSTR_MEM12: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 13
    /// offset: 0x7c
    INSTR_MEM13: mmio.Mmio(packed struct(u32) {
        INSTR_MEM13: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 14
    /// offset: 0x80
    INSTR_MEM14: mmio.Mmio(packed struct(u32) {
        INSTR_MEM14: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 15
    /// offset: 0x84
    INSTR_MEM15: mmio.Mmio(packed struct(u32) {
        INSTR_MEM15: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 16
    /// offset: 0x88
    INSTR_MEM16: mmio.Mmio(packed struct(u32) {
        INSTR_MEM16: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 17
    /// offset: 0x8c
    INSTR_MEM17: mmio.Mmio(packed struct(u32) {
        INSTR_MEM17: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 18
    /// offset: 0x90
    INSTR_MEM18: mmio.Mmio(packed struct(u32) {
        INSTR_MEM18: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 19
    /// offset: 0x94
    INSTR_MEM19: mmio.Mmio(packed struct(u32) {
        INSTR_MEM19: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 20
    /// offset: 0x98
    INSTR_MEM20: mmio.Mmio(packed struct(u32) {
        INSTR_MEM20: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 21
    /// offset: 0x9c
    INSTR_MEM21: mmio.Mmio(packed struct(u32) {
        INSTR_MEM21: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 22
    /// offset: 0xa0
    INSTR_MEM22: mmio.Mmio(packed struct(u32) {
        INSTR_MEM22: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 23
    /// offset: 0xa4
    INSTR_MEM23: mmio.Mmio(packed struct(u32) {
        INSTR_MEM23: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 24
    /// offset: 0xa8
    INSTR_MEM24: mmio.Mmio(packed struct(u32) {
        INSTR_MEM24: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 25
    /// offset: 0xac
    INSTR_MEM25: mmio.Mmio(packed struct(u32) {
        INSTR_MEM25: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 26
    /// offset: 0xb0
    INSTR_MEM26: mmio.Mmio(packed struct(u32) {
        INSTR_MEM26: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 27
    /// offset: 0xb4
    INSTR_MEM27: mmio.Mmio(packed struct(u32) {
        INSTR_MEM27: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 28
    /// offset: 0xb8
    INSTR_MEM28: mmio.Mmio(packed struct(u32) {
        INSTR_MEM28: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 29
    /// offset: 0xbc
    INSTR_MEM29: mmio.Mmio(packed struct(u32) {
        INSTR_MEM29: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 30
    /// offset: 0xc0
    INSTR_MEM30: mmio.Mmio(packed struct(u32) {
        INSTR_MEM30: u16,
        padding: u16 = 0,
    }),
    /// Write-only access to instruction memory location 31
    /// offset: 0xc4
    INSTR_MEM31: mmio.Mmio(packed struct(u32) {
        INSTR_MEM31: u16,
        padding: u16 = 0,
    }),
    /// Clock divisor register for state machine 0 Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    /// offset: 0xc8
    SM0_CLKDIV: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Fractional part of clock divisor
        FRAC: u8,
        /// Effective frequency is sysclk/(int + frac/256). Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        INT: u16,
    }),
    /// Execution/behavioural settings for state machine 0
    /// offset: 0xcc
    SM0_EXECCTRL: mmio.Mmio(packed struct(u32) {
        /// Comparison level for the MOV x, STATUS instruction
        STATUS_N: u4,
        /// Comparison used for the MOV x, STATUS instruction.
        STATUS_SEL: enum(u1) {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            TXLEVEL = 0x0,
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            RXLEVEL = 0x1,
        },
        reserved7: u2 = 0,
        /// After reaching wrap_top, execution is wrapped to this address.
        WRAP_BOTTOM: u5,
        /// After reaching this address, execution is wrapped to wrap_bottom. If the instruction is a jump, and the jump condition is true, the jump takes priority.
        WRAP_TOP: u5,
        /// Continuously assert the most recent OUT/SET to the pins
        OUT_STICKY: u1,
        /// If 1, use a bit of OUT data as an auxiliary write enable When used in conjunction with OUT_STICKY, writes with an enable of 0 will deassert the latest pin write. This can create useful masking/override behaviour due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        INLINE_OUT_EN: u1,
        /// Which data bit to use for inline OUT enable
        OUT_EN_SEL: u5,
        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        JMP_PIN: u5,
        /// If 1, side-set data is asserted to pin directions, instead of pin values
        SIDE_PINDIR: u1,
        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        SIDE_EN: u1,
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        EXEC_STALLED: u1,
    }),
    /// Control behaviour of the input/output shift registers for state machine 0
    /// offset: 0xd0
    SM0_SHIFTCTRL: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        AUTOPUSH: u1,
        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        AUTOPULL: u1,
        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        IN_SHIFTDIR: u1,
        /// 1 = shift out of output shift register to right. 0 = to left.
        OUT_SHIFTDIR: u1,
        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place. Write 0 for value of 32.
        PUSH_THRESH: u5,
        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place. Write 0 for value of 32.
        PULL_THRESH: u5,
        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep. RX FIFO is disabled as a result (always reads as both full and empty). FIFOs are flushed when this bit is changed.
        FJOIN_TX: u1,
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep. TX FIFO is disabled as a result (always reads as both full and empty). FIFOs are flushed when this bit is changed.
        FJOIN_RX: u1,
    }),
    /// Current instruction address of state machine 0
    /// offset: 0xd4
    SM0_ADDR: mmio.Mmio(packed struct(u32) {
        SM0_ADDR: u5,
        padding: u27 = 0,
    }),
    /// Read to see the instruction currently addressed by state machine 0's program counter Write to execute an instruction immediately (including jumps) and then resume execution.
    /// offset: 0xd8
    SM0_INSTR: mmio.Mmio(packed struct(u32) {
        SM0_INSTR: u16,
        padding: u16 = 0,
    }),
    /// State machine pin control
    /// offset: 0xdc
    SM0_PINCTRL: mmio.Mmio(packed struct(u32) {
        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        OUT_BASE: u5,
        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        SET_BASE: u5,
        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        SIDESET_BASE: u5,
        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        IN_BASE: u5,
        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        OUT_COUNT: u6,
        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        SET_COUNT: u3,
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        SIDESET_COUNT: u3,
    }),
    /// Clock divisor register for state machine 1 Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    /// offset: 0xe0
    SM1_CLKDIV: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Fractional part of clock divisor
        FRAC: u8,
        /// Effective frequency is sysclk/(int + frac/256). Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        INT: u16,
    }),
    /// Execution/behavioural settings for state machine 1
    /// offset: 0xe4
    SM1_EXECCTRL: mmio.Mmio(packed struct(u32) {
        /// Comparison level for the MOV x, STATUS instruction
        STATUS_N: u4,
        /// Comparison used for the MOV x, STATUS instruction.
        STATUS_SEL: enum(u1) {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            TXLEVEL = 0x0,
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            RXLEVEL = 0x1,
        },
        reserved7: u2 = 0,
        /// After reaching wrap_top, execution is wrapped to this address.
        WRAP_BOTTOM: u5,
        /// After reaching this address, execution is wrapped to wrap_bottom. If the instruction is a jump, and the jump condition is true, the jump takes priority.
        WRAP_TOP: u5,
        /// Continuously assert the most recent OUT/SET to the pins
        OUT_STICKY: u1,
        /// If 1, use a bit of OUT data as an auxiliary write enable When used in conjunction with OUT_STICKY, writes with an enable of 0 will deassert the latest pin write. This can create useful masking/override behaviour due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        INLINE_OUT_EN: u1,
        /// Which data bit to use for inline OUT enable
        OUT_EN_SEL: u5,
        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        JMP_PIN: u5,
        /// If 1, side-set data is asserted to pin directions, instead of pin values
        SIDE_PINDIR: u1,
        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        SIDE_EN: u1,
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        EXEC_STALLED: u1,
    }),
    /// Control behaviour of the input/output shift registers for state machine 1
    /// offset: 0xe8
    SM1_SHIFTCTRL: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        AUTOPUSH: u1,
        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        AUTOPULL: u1,
        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        IN_SHIFTDIR: u1,
        /// 1 = shift out of output shift register to right. 0 = to left.
        OUT_SHIFTDIR: u1,
        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place. Write 0 for value of 32.
        PUSH_THRESH: u5,
        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place. Write 0 for value of 32.
        PULL_THRESH: u5,
        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep. RX FIFO is disabled as a result (always reads as both full and empty). FIFOs are flushed when this bit is changed.
        FJOIN_TX: u1,
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep. TX FIFO is disabled as a result (always reads as both full and empty). FIFOs are flushed when this bit is changed.
        FJOIN_RX: u1,
    }),
    /// Current instruction address of state machine 1
    /// offset: 0xec
    SM1_ADDR: mmio.Mmio(packed struct(u32) {
        SM1_ADDR: u5,
        padding: u27 = 0,
    }),
    /// Read to see the instruction currently addressed by state machine 1's program counter Write to execute an instruction immediately (including jumps) and then resume execution.
    /// offset: 0xf0
    SM1_INSTR: mmio.Mmio(packed struct(u32) {
        SM1_INSTR: u16,
        padding: u16 = 0,
    }),
    /// State machine pin control
    /// offset: 0xf4
    SM1_PINCTRL: mmio.Mmio(packed struct(u32) {
        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        OUT_BASE: u5,
        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        SET_BASE: u5,
        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        SIDESET_BASE: u5,
        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        IN_BASE: u5,
        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        OUT_COUNT: u6,
        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        SET_COUNT: u3,
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        SIDESET_COUNT: u3,
    }),
    /// Clock divisor register for state machine 2 Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    /// offset: 0xf8
    SM2_CLKDIV: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Fractional part of clock divisor
        FRAC: u8,
        /// Effective frequency is sysclk/(int + frac/256). Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        INT: u16,
    }),
    /// Execution/behavioural settings for state machine 2
    /// offset: 0xfc
    SM2_EXECCTRL: mmio.Mmio(packed struct(u32) {
        /// Comparison level for the MOV x, STATUS instruction
        STATUS_N: u4,
        /// Comparison used for the MOV x, STATUS instruction.
        STATUS_SEL: enum(u1) {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            TXLEVEL = 0x0,
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            RXLEVEL = 0x1,
        },
        reserved7: u2 = 0,
        /// After reaching wrap_top, execution is wrapped to this address.
        WRAP_BOTTOM: u5,
        /// After reaching this address, execution is wrapped to wrap_bottom. If the instruction is a jump, and the jump condition is true, the jump takes priority.
        WRAP_TOP: u5,
        /// Continuously assert the most recent OUT/SET to the pins
        OUT_STICKY: u1,
        /// If 1, use a bit of OUT data as an auxiliary write enable When used in conjunction with OUT_STICKY, writes with an enable of 0 will deassert the latest pin write. This can create useful masking/override behaviour due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        INLINE_OUT_EN: u1,
        /// Which data bit to use for inline OUT enable
        OUT_EN_SEL: u5,
        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        JMP_PIN: u5,
        /// If 1, side-set data is asserted to pin directions, instead of pin values
        SIDE_PINDIR: u1,
        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        SIDE_EN: u1,
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        EXEC_STALLED: u1,
    }),
    /// Control behaviour of the input/output shift registers for state machine 2
    /// offset: 0x100
    SM2_SHIFTCTRL: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        AUTOPUSH: u1,
        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        AUTOPULL: u1,
        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        IN_SHIFTDIR: u1,
        /// 1 = shift out of output shift register to right. 0 = to left.
        OUT_SHIFTDIR: u1,
        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place. Write 0 for value of 32.
        PUSH_THRESH: u5,
        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place. Write 0 for value of 32.
        PULL_THRESH: u5,
        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep. RX FIFO is disabled as a result (always reads as both full and empty). FIFOs are flushed when this bit is changed.
        FJOIN_TX: u1,
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep. TX FIFO is disabled as a result (always reads as both full and empty). FIFOs are flushed when this bit is changed.
        FJOIN_RX: u1,
    }),
    /// Current instruction address of state machine 2
    /// offset: 0x104
    SM2_ADDR: mmio.Mmio(packed struct(u32) {
        SM2_ADDR: u5,
        padding: u27 = 0,
    }),
    /// Read to see the instruction currently addressed by state machine 2's program counter Write to execute an instruction immediately (including jumps) and then resume execution.
    /// offset: 0x108
    SM2_INSTR: mmio.Mmio(packed struct(u32) {
        SM2_INSTR: u16,
        padding: u16 = 0,
    }),
    /// State machine pin control
    /// offset: 0x10c
    SM2_PINCTRL: mmio.Mmio(packed struct(u32) {
        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        OUT_BASE: u5,
        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        SET_BASE: u5,
        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        SIDESET_BASE: u5,
        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        IN_BASE: u5,
        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        OUT_COUNT: u6,
        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        SET_COUNT: u3,
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        SIDESET_COUNT: u3,
    }),
    /// Clock divisor register for state machine 3 Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    /// offset: 0x110
    SM3_CLKDIV: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Fractional part of clock divisor
        FRAC: u8,
        /// Effective frequency is sysclk/(int + frac/256). Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        INT: u16,
    }),
    /// Execution/behavioural settings for state machine 3
    /// offset: 0x114
    SM3_EXECCTRL: mmio.Mmio(packed struct(u32) {
        /// Comparison level for the MOV x, STATUS instruction
        STATUS_N: u4,
        /// Comparison used for the MOV x, STATUS instruction.
        STATUS_SEL: enum(u1) {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            TXLEVEL = 0x0,
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            RXLEVEL = 0x1,
        },
        reserved7: u2 = 0,
        /// After reaching wrap_top, execution is wrapped to this address.
        WRAP_BOTTOM: u5,
        /// After reaching this address, execution is wrapped to wrap_bottom. If the instruction is a jump, and the jump condition is true, the jump takes priority.
        WRAP_TOP: u5,
        /// Continuously assert the most recent OUT/SET to the pins
        OUT_STICKY: u1,
        /// If 1, use a bit of OUT data as an auxiliary write enable When used in conjunction with OUT_STICKY, writes with an enable of 0 will deassert the latest pin write. This can create useful masking/override behaviour due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        INLINE_OUT_EN: u1,
        /// Which data bit to use for inline OUT enable
        OUT_EN_SEL: u5,
        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        JMP_PIN: u5,
        /// If 1, side-set data is asserted to pin directions, instead of pin values
        SIDE_PINDIR: u1,
        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        SIDE_EN: u1,
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        EXEC_STALLED: u1,
    }),
    /// Control behaviour of the input/output shift registers for state machine 3
    /// offset: 0x118
    SM3_SHIFTCTRL: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        AUTOPUSH: u1,
        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        AUTOPULL: u1,
        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        IN_SHIFTDIR: u1,
        /// 1 = shift out of output shift register to right. 0 = to left.
        OUT_SHIFTDIR: u1,
        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place. Write 0 for value of 32.
        PUSH_THRESH: u5,
        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place. Write 0 for value of 32.
        PULL_THRESH: u5,
        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep. RX FIFO is disabled as a result (always reads as both full and empty). FIFOs are flushed when this bit is changed.
        FJOIN_TX: u1,
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep. TX FIFO is disabled as a result (always reads as both full and empty). FIFOs are flushed when this bit is changed.
        FJOIN_RX: u1,
    }),
    /// Current instruction address of state machine 3
    /// offset: 0x11c
    SM3_ADDR: mmio.Mmio(packed struct(u32) {
        SM3_ADDR: u5,
        padding: u27 = 0,
    }),
    /// Read to see the instruction currently addressed by state machine 3's program counter Write to execute an instruction immediately (including jumps) and then resume execution.
    /// offset: 0x120
    SM3_INSTR: mmio.Mmio(packed struct(u32) {
        SM3_INSTR: u16,
        padding: u16 = 0,
    }),
    /// State machine pin control
    /// offset: 0x124
    SM3_PINCTRL: mmio.Mmio(packed struct(u32) {
        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        OUT_BASE: u5,
        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        SET_BASE: u5,
        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        SIDESET_BASE: u5,
        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        IN_BASE: u5,
        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        OUT_COUNT: u6,
        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        SET_COUNT: u3,
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        SIDESET_COUNT: u3,
    }),
    /// Raw Interrupts
    /// offset: 0x128
    INTR: mmio.Mmio(packed struct(u32) {
        SM0_RXNEMPTY: u1,
        SM1_RXNEMPTY: u1,
        SM2_RXNEMPTY: u1,
        SM3_RXNEMPTY: u1,
        SM0_TXNFULL: u1,
        SM1_TXNFULL: u1,
        SM2_TXNFULL: u1,
        SM3_TXNFULL: u1,
        SM0: u1,
        SM1: u1,
        SM2: u1,
        SM3: u1,
        padding: u20 = 0,
    }),
    /// Interrupt Enable for irq0
    /// offset: 0x12c
    IRQ0_INTE: mmio.Mmio(packed struct(u32) {
        SM0_RXNEMPTY: u1,
        SM1_RXNEMPTY: u1,
        SM2_RXNEMPTY: u1,
        SM3_RXNEMPTY: u1,
        SM0_TXNFULL: u1,
        SM1_TXNFULL: u1,
        SM2_TXNFULL: u1,
        SM3_TXNFULL: u1,
        SM0: u1,
        SM1: u1,
        SM2: u1,
        SM3: u1,
        padding: u20 = 0,
    }),
    /// Interrupt Force for irq0
    /// offset: 0x130
    IRQ0_INTF: mmio.Mmio(packed struct(u32) {
        SM0_RXNEMPTY: u1,
        SM1_RXNEMPTY: u1,
        SM2_RXNEMPTY: u1,
        SM3_RXNEMPTY: u1,
        SM0_TXNFULL: u1,
        SM1_TXNFULL: u1,
        SM2_TXNFULL: u1,
        SM3_TXNFULL: u1,
        SM0: u1,
        SM1: u1,
        SM2: u1,
        SM3: u1,
        padding: u20 = 0,
    }),
    /// Interrupt status after masking & forcing for irq0
    /// offset: 0x134
    IRQ0_INTS: mmio.Mmio(packed struct(u32) {
        SM0_RXNEMPTY: u1,
        SM1_RXNEMPTY: u1,
        SM2_RXNEMPTY: u1,
        SM3_RXNEMPTY: u1,
        SM0_TXNFULL: u1,
        SM1_TXNFULL: u1,
        SM2_TXNFULL: u1,
        SM3_TXNFULL: u1,
        SM0: u1,
        SM1: u1,
        SM2: u1,
        SM3: u1,
        padding: u20 = 0,
    }),
    /// Interrupt Enable for irq1
    /// offset: 0x138
    IRQ1_INTE: mmio.Mmio(packed struct(u32) {
        SM0_RXNEMPTY: u1,
        SM1_RXNEMPTY: u1,
        SM2_RXNEMPTY: u1,
        SM3_RXNEMPTY: u1,
        SM0_TXNFULL: u1,
        SM1_TXNFULL: u1,
        SM2_TXNFULL: u1,
        SM3_TXNFULL: u1,
        SM0: u1,
        SM1: u1,
        SM2: u1,
        SM3: u1,
        padding: u20 = 0,
    }),
    /// Interrupt Force for irq1
    /// offset: 0x13c
    IRQ1_INTF: mmio.Mmio(packed struct(u32) {
        SM0_RXNEMPTY: u1,
        SM1_RXNEMPTY: u1,
        SM2_RXNEMPTY: u1,
        SM3_RXNEMPTY: u1,
        SM0_TXNFULL: u1,
        SM1_TXNFULL: u1,
        SM2_TXNFULL: u1,
        SM3_TXNFULL: u1,
        SM0: u1,
        SM1: u1,
        SM2: u1,
        SM3: u1,
        padding: u20 = 0,
    }),
    /// Interrupt status after masking & forcing for irq1
    /// offset: 0x140
    IRQ1_INTS: mmio.Mmio(packed struct(u32) {
        SM0_RXNEMPTY: u1,
        SM1_RXNEMPTY: u1,
        SM2_RXNEMPTY: u1,
        SM3_RXNEMPTY: u1,
        SM0_TXNFULL: u1,
        SM1_TXNFULL: u1,
        SM2_TXNFULL: u1,
        SM3_TXNFULL: u1,
        SM0: u1,
        SM1: u1,
        SM2: u1,
        SM3: u1,
        padding: u20 = 0,
    }),
};
