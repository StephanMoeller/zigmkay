const generic_queue = @import("generic_queue.zig");

pub const KeyDef = struct { keycode: u8 };

// a key definition that only has a tap functionality

pub const Action = union(enum) {
    KeyCodePress: u8, //this should be extended with some sort of mod information
    KeyCodeRelease: u8, //-,,-
};
const KeyIndex = usize;
pub const InputEvent = union(enum) { key_pressed: KeyIndex, key_released: KeyIndex };

const std = @import("std");
pub const InputEventQueue = generic_queue.GenericQueue(InputEvent, 100);
pub const ActionQueue = generic_queue.GenericQueue(Action, 100);

// pub const ScanSettings = struct { debounce_ms: u8 };
// pub fn scan(settings: ScanSettings) u8 {}
