const std = @import("std");
const core = @import("core.zig");

pub fn CreateAndInitUsbCommandExecutor() UsbCommandExecutor {
    return UsbCommandExecutor{};
}
const UsbCommandExecutor = struct {};
