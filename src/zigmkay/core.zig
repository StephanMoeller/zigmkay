const generic_queue = @import("generic_queue.zig");

// Features that must be expressable with KeyDef:
// - Tap for letter
// TODO Tap for letter with a modifier on the letter alone
// TODO Tap for permanent layer switch
// TODO Tap for one-shot layer switch
// TODO Hold for Modifiers
// TODO Hold for momentary layer switch
// TODO Combine any tap with any hold
pub const KeyDef = struct {
    pub fn TAP(keycode: u8) KeyDef {
        return KeyDef{ .tap_keycode = keycode };
    }

    pub fn TAP_WITH_MOD(keycode: u8, modifiers: Modifiers) KeyDef {
        return KeyDef{ .tap_keycode = keycode, .tap_modifiers = modifiers };
    }

    tap_keycode: u8 = 0,
    tap_modifiers: Modifiers = .{},
    tap_layers_permanent: LayerIndex = 0,
    tap_layers_one_shot: LayerIndex = 0,
    hold_layer: LayerIndex = 0, // no one shot available at the moment
    hold_modifiers: Modifiers = .{},
};

// a key definition that only has a tap functionality

pub const OutputCommand = union(enum) {
    KeyCodePress: u8,
    KeyCodeRelease: u8,
    ModifiersChanged: Modifiers,
};

const HidKeyCode = u8;
const KeyIndex = usize;
const LayerIndex = usize;
pub const KeyboardStateChange = struct { pressed: bool, key_index: KeyIndex };
pub const TimeStamp = struct {
    time_us_since_boot: u64,
    pub fn as_ns(self: TimeStamp) u64 {
        return self.time_us_since_boot / 1000;
    }
};
pub const KeyboardStateChangeQueue = generic_queue.GenericQueue(KeyboardStateChange, 100);
pub const OutputCommandQueue = generic_queue.GenericQueue(OutputCommand, 100);
pub const Modifiers = packed struct {
    left_ctrl: bool = false,
    left_shift: bool = false,
    left_alt: bool = false,
    left_gui: bool = false,
    right_ctrl: bool = false,
    right_shift: bool = false,
    right_alt: bool = false,
    right_gui: bool = false,

    /// Convert the struct to a byte (u8) representation.
    pub fn empty(self: Modifiers) bool {
        return self.toByte() == 0;
    }
    pub fn toByte(self: Modifiers) u8 {
        return @bitCast(self);
    }

    //pub fn fromByte(byte_val: u8) Modifiers {
    //    return @bitCast(byte_val);
    //}
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
