const generic_queue = @import("generic_queue.zig");
pub const special_keycode_BOOT: u8 = 0x000;
// Features that must be expressable with KeyDef:
// - Tap for letter
// TODO Tap for letter with a modifier on the letter alone
// TODO Tap for permanent layer switch
// TODO Tap for one-shot layer switch
// TODO Hold for Modifiers
// TODO Hold for momentary layer switch
// TODO Combine any tap with any hold
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
    tapping_term_ms: TappingTermType,
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
    initial_delay_ms: u16,
    repeat_interval_ms: u16,
};

pub const TimeSpan = struct {
    ms: u16 = 0,
};
const TransparentLayerValue = 15;

pub const KeyIndex = u8;
pub const LayerIndex = u4;
pub const TappingTermType = u16;

const queue_capacities = 250;

// Matrix events: switch press/release,
pub const MatrixStateChange = struct { pressed: bool, key_index: KeyIndex, time: TimeSinceBoot };
pub const MatrixStateChangeQueue = generic_queue.GenericQueue(MatrixStateChange, queue_capacities);

// USB output
pub const OutputCommand = union(enum) { KeyCodePress: u8, KeyCodeRelease: u8, ModifiersChanged: Modifiers, ActivateBootMode };
pub const OutputCommandQueue = generic_queue.GenericQueue(OutputCommand, queue_capacities);

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
};

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
