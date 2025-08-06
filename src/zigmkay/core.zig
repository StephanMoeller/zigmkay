const generic_queue = @import("generic_queue.zig");
const std = @import("std");
const string_printing = @import("string_printing.zig");
pub const special_keycode_BOOT: u8 = 0x000;
pub const special_keycode_PRINT_STATS: u8 = 0x001;

pub const KeymapDimensions = struct {
    key_count: KeyIndex,
    layer_count: LayerIndex,
};
pub const TapDef = struct {
    tap_keycode: u8 = 0,
    tap_modifiers: ?Modifiers = null,
};
pub const HoldDef = struct {
    hold_modifiers: ?Modifiers = null,
    hold_layer: ?LayerIndex = null,
};

pub const TapHoldDef = struct {
    tap: TapDef,
    hold: HoldDef,
    tapping_term: TimeSpan,
    retro_tapping: bool = false,
};
pub const KeyDef = union(enum) {
    none,
    transparent,
    tap_only: TapDef,
    hold_only: HoldDef,
    tap_hold: TapHoldDef,
    tap_with_autofire: AutoFireDef,
};

pub const Combo2Def = struct {
    key_indexes: [2]KeyIndex,
    timeout: TimeSpan,
    layer: LayerIndex,
    key_def: KeyDef,
};
pub const AutoFireDef = struct {
    tap: TapDef,
    initial_delay: TimeSpan,
    repeat_interval: TimeSpan,
};

pub const TimeSpan = struct {
    ms: u16 = 0,
};
const TransparentLayerValue = 15;

pub const KeyIndex = u8;
pub const LayerIndex = u4;

const queue_capacities = 250;

// Matrix events: switch press/release,
pub const MatrixStateChange = struct { pressed: bool, key_index: KeyIndex, time: TimeSinceBoot };
pub const MatrixStateChangeQueue = generic_queue.GenericQueue(MatrixStateChange, queue_capacities);

// USB output
pub const OutputCommand = union(enum) { KeyCodePress: u8, KeyCodeRelease: u8, ModifiersChanged: Modifiers, ActivateBootMode };
pub const OutputCommandQueue = struct {
    const QueueType = generic_queue.GenericQueue(OutputCommand, queue_capacities);
    currently_pressed_keycodes: [256]bool = [1]bool{false} ** 256,
    queue: QueueType = QueueType.Create(),
    current_mods: Modifiers = .{}, // holds the latest submitted
    pub fn Create() OutputCommandQueue {
        return OutputCommandQueue{};
    }
    pub fn dequeue(self: *OutputCommandQueue) !OutputCommand {
        return try self.queue.dequeue();
    }
    pub fn Count(self: *OutputCommandQueue) usize {
        return self.queue.Count();
    }
    pub fn has_events(self: *OutputCommandQueue) bool {
        return self.queue.Count() > 0;
    }
    pub fn go_to_boot_mode(self: *OutputCommandQueue) !void {
        try self.queue.enqueue(OutputCommand.ActivateBootMode);
    }

    pub fn tap_key(self: *OutputCommandQueue, tap: TapDef) !void {
        try press_key(self, tap);
        try release_key(self, tap);
    }
    pub fn press_key(self: *OutputCommandQueue, tap: TapDef) !void {
        if (self.currently_pressed_keycodes[tap.tap_keycode]) {
            try self.queue.enqueue(.{ .KeyCodeRelease = tap.tap_keycode });
            self.currently_pressed_keycodes[tap.tap_keycode] = false;
        }

        if (tap.tap_modifiers) |mod| {
            try self.queue.enqueue(.{ .ModifiersChanged = mod });
            try self.queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
            try self.queue.enqueue(.{ .KeyCodeRelease = tap.tap_keycode });
            try self.queue.enqueue(.{ .ModifiersChanged = self.current_mods });
        } else {
            self.currently_pressed_keycodes[tap.tap_keycode] = true;
            try self.queue.enqueue(.{ .KeyCodePress = tap.tap_keycode });
        }
    }
    pub fn release_key(self: *OutputCommandQueue, tap: TapDef) !void {
        if (tap.tap_modifiers != null) {
            return; // if modifiers exist, release has already been fire
        }
        if (self.currently_pressed_keycodes[tap.tap_keycode] == false) {
            return; // release has already been fired per #CASE 1
        }
        try self.queue.enqueue(.{ .KeyCodeRelease = tap.tap_keycode });
        self.currently_pressed_keycodes[tap.tap_keycode] = false;
    }
    pub fn get_current_modifiers(self: *OutputCommandQueue) Modifiers {
        return self.current_mods;
    }
    pub fn set_mods(self: *OutputCommandQueue, modifiers: Modifiers) !void {
        if (self.current_mods.toByte() != modifiers.toByte()) {}
        self.current_mods = modifiers;
        try self.queue.enqueue(.{ .ModifiersChanged = modifiers });
    }
    pub fn print_string(self: *OutputCommandQueue, string: []u8) !void {
        try string_printing.print_string(string, self);
    }
};
pub const TimeSinceBoot = struct {
    time_since_boot_us: u64,
    pub fn from_absolute_us(time_us: u64) TimeSinceBoot {
        return .{ .time_since_boot_us = time_us };
    }
    pub fn add_us(self: *const TimeSinceBoot, delta_us: u64) TimeSinceBoot {
        return .{ .time_since_boot_us = self.time_since_boot_us + delta_us };
    }
    pub fn add_ms(self: *const TimeSinceBoot, delta_ms: u64) TimeSinceBoot {
        return .{ .time_since_boot_us = self.time_since_boot_us + delta_ms * 1000 };
    }
    pub fn add(self: *const TimeSinceBoot, delta: TimeSpan) TimeSinceBoot {
        return self.add_ms(delta.ms);
    }
    pub fn diff_us(self: *const TimeSinceBoot, other: *const TimeSinceBoot) DiffError!u64 {
        if (self.time_since_boot_us < other.time_since_boot_us) {
            return DiffError.CurrentIsEarlierThanInput;
        }
        return self.time_since_boot_us - other.time_since_boot_us;
    }
};

pub const DiffError = error{CurrentIsEarlierThanInput};

pub const LayerActivations = struct {
    layers: [32]bool = [_]bool{false} ** 32,

    pub fn activate(self: *LayerActivations, layer_index: usize) void {
        if (layer_index == 0)
            return;
        self.layers[layer_index] = true;
    }

    pub fn deactivate(self: *LayerActivations, layer_index: usize) void {
        if (layer_index == 0)
            return;
        self.layers[layer_index] = false;
    }

    pub fn set_layer_state(self: *LayerActivations, layer_index: usize, state: bool) void {
        if (layer_index == 0)
            return;
        self.layers[layer_index] = state;
    }

    pub fn is_layer_active(self: *const LayerActivations, layer_index: usize) bool {
        if (layer_index == 0)
            return true;
        return self.layers[layer_index];
    }
};

pub const Modifiers = packed struct {
    left_ctrl: bool = false,
    left_shift: bool = false,
    left_alt: bool = false,
    left_gui: bool = false,
    right_ctrl: bool = false,
    right_shift: bool = false,
    right_alt: bool = false,
    right_gui: bool = false,

    pub fn add(self: *const Modifiers, other: Modifiers) Modifiers {
        const self_bytes = self.toByte();
        const other_bytes = other.toByte();
        return Modifiers.fromByte(self_bytes | other_bytes);
    }

    pub fn remove(self: *const Modifiers, other: Modifiers) Modifiers {
        const self_bytes = self.toByte();
        const other_bytes = other.toByte();
        return Modifiers.fromByte(self_bytes & ~other_bytes);
    }
    pub fn toByte(self: Modifiers) u8 {
        return @bitCast(self);
    }
    pub fn fromByte(byte_val: u8) Modifiers {
        return @bitCast(byte_val);
    }
};
pub const CustomFunctions = struct {
    on_event: fn (event: ProcessorEvent, layers: *LayerActivations, output_queue: *OutputCommandQueue) void,
};
pub const ProcessorEvent = union(enum) {
    Tick,
    OnTapEnterBefore: struct { tap: TapDef },
    OnTapEnterAfter: struct { tap: TapDef },
    OnTapExitBefore: struct { tap: TapDef },
    OnTapExitAfter: struct { tap: TapDef },
    OnHoldEnterBefore: struct { hold: HoldDef },
    OnHoldEnterAfter: struct { hold: HoldDef },
    OnHoldExitBefore: struct { hold: HoldDef },
    OnHoldExitAfter: struct { hold: HoldDef },
};
