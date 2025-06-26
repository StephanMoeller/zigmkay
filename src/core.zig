pub const KeyDef = struct { keycode: u8 };
pub fn TapOnly(keycode: u8) KeyDef {
    return KeyDef{ .keycode = keycode };
}

pub const Action = union(enum) {
    KeyCodePress: u8, //this should be extended with some sort of mod information
    KeyCodeRelease: u8, //-,,-
};
const KeyIndex = usize;
pub const InputEvent = union(enum) {
    key_pressed: KeyIndex,
    key_released: KeyIndex,
    pub fn KeyPress(index: KeyIndex) InputEvent {
        return .{ .key_pressed = index };
    }
    pub fn KeyReleased(index: KeyIndex) InputEvent {
        return .{ .key_released = index };
    }
};

const std = @import("std");
pub const InputEventQueue = struct {
    count: u8 = 0,
    data: [8]InputEvent = [8]InputEvent{ InputEvent.KeyPress(1), InputEvent.KeyPress(1), InputEvent.KeyPress(1), InputEvent.KeyPress(1), InputEvent.KeyPress(1), InputEvent.KeyPress(1), InputEvent.KeyPress(1), InputEvent.KeyPress(1) },
    pub fn add(this: *InputEventQueue, event: InputEvent) void {
        this.data[0] = event;
    }
};

pub fn Process(
    comptime KeyCount: usize,
    comptime LayerCount: usize,
    keymap: *const [LayerCount][KeyCount]KeyDef,
    input: *InputEventQueue,
) []Action {
    var actions = [_]Action{Action{ .KeyCodePress = 0x05 }};
    _ = input;
    _ = keymap;
    return actions[0..];
}

// pub const ScanSettings = struct { debounce_ms: u8 };
// pub fn scan(settings: ScanSettings) u8 {}
