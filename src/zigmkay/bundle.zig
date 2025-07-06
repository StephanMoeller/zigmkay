pub const core = @import("core.zig");
pub const KeyboardContext = struct { comptime key_count: u8 = 0 };
pub fn Init(comptime key_count: u8) KeyboardContext {
    return KeyboardContext{ .key_count = key_count };
}
const processing = @import("processing.zig");
const scanning = @import("scanning.zig");
pub const CreateScanner = scanning.CreateScanner;
pub const Processor = processing.Processor;
pub const KeyboardStateChangeQueue = core.KeyboardStateChangeQueue;
pub const OutputCommandQueue = core.OutputCommandQueue;
