const generic_queue = @import("generic_queue.zig");
const std = @import("std");
const string_printing = @import("string_printing.zig");

pub const special_keycode_BOOT: u8 = 0x001;
pub const special_keycode_PRINT_STATS: u8 = 0x002;

pub const KeymapDimensions = struct {
    key_count: KeyIndex,
    layer_count: LayerIndex,
};
pub const KeyCodeFire = struct {
    tap_keycode: u8 = 0,
    tap_modifiers: ?Modifiers = null,
    dead: bool = false,
};
pub const TapDef = union(enum) {
    key_press: KeyCodeFire,
    one_shot: HoldDef,
};
pub const HoldDef = struct {
    hold_modifiers: ?Modifiers = null,
    hold_layer: ?LayerIndex = null,
    custom: ?u8 = null,
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
pub const OutputCommand = union(enum) {
    KeyCodePress: u8,
    KeyCodeRelease: u8,
    ModifiersChanged: Modifiers,
    ActivateBootMode,
};
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

    pub fn tap_key(self: *OutputCommandQueue, tap: KeyCodeFire) !void {
        try press_key(self, tap);
        try release_key(self, tap);
    }
    pub fn press_key(self: *OutputCommandQueue, tap: KeyCodeFire) !void {
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
    pub fn release_key(self: *OutputCommandQueue, tap: KeyCodeFire) !void {
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
    pub fn diff_ms(self: *const TimeSinceBoot, other: *const TimeSinceBoot) DiffError!u64 {
        return try self.diff_us(other) * 1000;
    }
    pub fn up_til_ms(self: *const TimeSinceBoot, other: *const TimeSinceBoot) DiffError!u64 {
        if (self.time_since_boot_us > other.time_since_boot_us) {
            return DiffError.CurrentIsLaterThanInput;
        }
        return (other.time_since_boot_us - self.time_since_boot_us) / 1000;
    }
};

pub const DiffError = error{ CurrentIsEarlierThanInput, CurrentIsLaterThanInput };

pub const LayerActivations = struct {
    layers: [32]bool = [_]bool{false} ** 32,
    top_most_active_layer: LayerIndex = 0,
    const Self = @This();
    pub fn activate(self: *Self, layer_index: LayerIndex) void {
        if (layer_index == 0)
            return;
        self.layers[layer_index] = true;
        if (layer_index > self.top_most_active_layer) {
            self.top_most_active_layer = layer_index;
        }
    }

    pub fn deactivate(self: *Self, layer_index: LayerIndex) void {
        if (layer_index == 0)
            return;
        self.layers[layer_index] = false;
        if (layer_index == self.top_most_active_layer) {
            // now find the next top most active layer
            var counter = self.top_most_active_layer - 1;
            while (self.layers[counter] == false and counter > 0) {
                counter -= 1;
            }
            self.top_most_active_layer = counter;
        }
    }

    pub fn set_layer_state(self: *Self, layer_index: LayerIndex, state: bool) void {
        switch (state) {
            true => activate(self, layer_index),
            false => deactivate(self, layer_index),
        }
    }

    pub fn is_layer_active(self: *const Self, layer_index: LayerIndex) bool {
        if (layer_index == 0)
            return true;
        return self.layers[layer_index];
    }
    pub fn get_top_most_active_layer(self: *const Self) LayerIndex {
        return self.top_most_active_layer;
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
