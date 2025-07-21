const generic_queue = @import("generic_queue.zig");

// Features that must be expressable with KeyDef:
// - Tap for letter
// TODO Tap for letter with a modifier on the letter alone
// TODO Tap for permanent layer switch
// TODO Tap for one-shot layer switch
// TODO Hold for Modifiers
// TODO Hold for momentary layer switch
// TODO Combine any tap with any hold
pub const KeymapDimensions = struct {
    key_count: usize,
    layer_count: usize,
};
pub const TapDef = struct {
    tap_keycode: u8 = 0,
    tap_modifiers: ?Modifiers = null,
};
pub const HoldDef = struct {
    hold_modifiers: ?Modifiers = null,
    hold_layer: ?LayerIndex = null,
};
pub const KeyDef = union(enum) {
    none,
    transparent,
    tap_only: TapDef,
    hold_only: HoldDef,
    tap_hold: struct { tap: TapDef, hold: HoldDef, tapping_term_ms: TappingTermType = 100 },

    pub fn TAP(keycode: u8) KeyDef {
        return KeyDef{ .tap_only = .{ .tap_keycode = keycode } };
    }

    pub fn TAP_WITH_MOD(keycode: u8, modifiers: Modifiers) KeyDef {
        return KeyDef{ .tap_only = .{ .tap_keycode = keycode, .tap_modifiers = modifiers } };
    }

    pub fn HOLD_MOD(modifiers: Modifiers) KeyDef {
        return KeyDef{ .hold_only = .{ .hold_modifiers = modifiers } };
    }
    pub fn MO(layer: LayerIndex) KeyDef {
        return KeyDef{ .hold_only = .{ .hold_layer = layer } };
    }
    pub fn LT(layer: LayerIndex, tap_keycode: u8, tap_modifiers: Modifiers, tapping_term_ms: u16) KeyDef {
        return KeyDef{ .tap_hold = .{
            .tap = .{ .tap_keycode = tap_keycode, .tap_modifiers = tap_modifiers },
            .hold = .{ .hold_layer = layer },
            .tapping_term_ms = tapping_term_ms,
        } };
    }
    pub fn MT(hold_modifiers: Modifiers, tap_keycode: u8, tap_modifiers: Modifiers, tapping_term_ms: u16) KeyDef {
        return KeyDef{ .tap_hold = .{
            .tap = .{
                .tap_keycode = tap_keycode,
                .tap_modifiers = tap_modifiers,
            },
            .hold = .{
                .hold_modifiers = hold_modifiers,
            },
            .tapping_term_ms = tapping_term_ms,
        } };
    }
    pub fn NONE() KeyDef {
        return KeyDef.none;
    }
    pub fn TRANSPARENT() KeyDef {
        return KeyDef.transparent;
    }
};
const TransparentLayerValue = 15;

pub const KeyIndex = usize;
pub const LayerIndex = usize;
pub const TappingTermType = u16;

const queue_capacities = 250;

// Matrix events: switch press/release,
pub const MatrixStateChange = struct { pressed: bool, key_index: KeyIndex, time: TimeSinceBoot };
pub const MatrixStateChangeQueue = generic_queue.GenericQueue(MatrixStateChange, queue_capacities);

// USB output
pub const OutputCommand = union(enum) { KeyCodePress: u8, KeyCodeRelease: u8, ModifiersChanged: Modifiers };
pub const OutputCommandQueue = generic_queue.GenericQueue(OutputCommand, queue_capacities);

pub const TimeSinceBoot = u64;

// TODO: this can be optimized to store everything as one u32 field

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

    pub fn toByte(self: Modifiers) u8 {
        return @bitCast(self);
    }
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
    pub fn fromByte(byte_val: u8) Modifiers {
        return @bitCast(byte_val);
    }
};
pub const HID_ModifierMasks = enum(u8) {
    left_control = 0x01,
    left_shift = 0x02,
    left_alt = 0x04,
    left_meta = 0x08,
    right_control = 0x10,
    right_shift = 0x20,
    right_alt = 0x40,
    right_meta = 0x80,
};
