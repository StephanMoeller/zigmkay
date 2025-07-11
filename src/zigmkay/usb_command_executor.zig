const std = @import("std");
const core = @import("core.zig");
const rp2xxx = @import("microzig").hal;
const usb_if = @import("../microzig/usb_if.zig");
const usb_dev = rp2xxx.usb.Usb(.{});

pub fn CreateAndInitUsbCommandExecutor() UsbCommandExecutor {
    // First we initialize the USB clock
    usb_if.init(usb_dev);
    return UsbCommandExecutor{};
}

pub const UsbCommandExecutor = struct {
    var data: [7]u8 = [7]u8{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
    pub fn HouseKeepAndProcessCommands(self: UsbCommandExecutor, output_command_queue: *core.OutputCommandQueue) void {
        _ = self;
        usb_dev.task(false) catch unreachable; // Process pending USB housekeeping

        // TODO: extract this logic into seperate class and unit test it
        // TODO: support for modifiers: both stand-alone presses and keycaps with modifiers activated
        while (output_command_queue.Count() > 0) {
            const command = output_command_queue.dequeue() catch unreachable;
            switch (command) {
                .KeyCodePress => |keycode| {
                    var idx: usize = 1;
                    while (idx < data.len and data[idx] != 0) {
                        idx += 1;
                    }
                    if (idx < data.len) {
                        data[idx] = keycode;
                    }
                },
                .KeyCodeRelease => |keycode| {
                    var idx: usize = 1;
                    while (idx < data.len and data[idx] != keycode) {
                        idx += 1;
                    }
                    if (idx < data.len) {
                        data[idx] = 0;
                    }
                },
                .LayerActivation => |_| {},
                .LayerDeactivation => |_| {},
            }
        }
        usb_if.send_keyboard_report(usb_dev, &data);
    }
};
