const generic_queue = @import("generic_queue.zig");

pub const KeyDef = struct { keycode: u8 };

// a key definition that only has a tap functionality

pub const OutputCommand = union(enum) {
    KeyCodePress: u8,
    KeyCodeRelease: u8,
    LayerActivation: LayerIndex,
    LayerDeactivation: LayerIndex,
};
const KeyIndex = usize;
const LayerIndex = usize;
pub const KeyboardStateChange = union(enum) {
    key_pressed: struct { key_index: KeyIndex, time: TimeStamp },
    key_released: struct { key_index: KeyIndex, time: TimeStamp },
};
pub const TimeStamp = struct {
    time_us_since_boot: u64,
    pub fn as_ns(self: TimeStamp) u64 {
        return self.time_us_since_boot / 1000;
    }
};
pub const KeyboardStateChangeQueue = generic_queue.GenericQueue(KeyboardStateChange, 100);
pub const OutputCommandQueue = generic_queue.GenericQueue(OutputCommand, 100);
