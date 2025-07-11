const std = @import("std");
const core = @import("core.zig");
const rp2xxx = @import("microzig").hal;
const usb_if = @import("usb_if.zig");
const usb_dev = rp2xxx.usb.Usb(.{});
const time = rp2xxx.time;

pub fn CreateAndInitUsbCommandExecutor() UsbCommandExecutor {
    // First we initialize the USB clock
    usb_if.init(usb_dev);
    return UsbCommandExecutor{};
}

pub const UsbCommandExecutor = struct {
    var data: [7]u8 = [7]u8{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
    pub fn HouseKeepAndProcessCommands(self: UsbCommandExecutor, output_command_queue: *core.OutputCommandQueue) !void {
        _ = self;
        usb_dev.task(false) catch unreachable; // Process pending USB housekeeping

        // TODO: extract this logic into seperate class and unit test it
        // TODO: support for modifiers: both stand-alone presses and keycaps with modifiers activated
        //
        //
        // This is an 'if' and not a 'while loop', ensuring not to delay too much before scanning the matrix again by only prossessing one item in the output queue per cycle.
        // Highest priority is to capture as many changes as possible in the matrix. also if this means slower execution of these
        if (output_command_queue.Count() > 0) {
            const command = output_command_queue.dequeue() catch unreachable;
            switch (command) {
                .KeyCodePress => |keycode| {
                    var idx: usize = 1;
                    while (idx < data.len) {
                        if (data[idx] == keycode) {
                            break; // already registered as pressed
                        }
                        if (data[idx] == 0) {
                            data[idx] = keycode; // found empty spot
                            break;
                        }

                        idx += 1;
                    }
                },
                .KeyCodeRelease => |keycode| {
                    var idx: usize = 1;
                    while (idx < data.len) {
                        if (data[idx] == keycode) {
                            data[idx] = 0;
                        }

                        idx += 1;
                    }
                },
                .ModifiersChanged => |modifiers| {
                    data[0] = modifiers.toByte();
                },
            }
            time.sleep_ms(1);
        }
        usb_if.send_keyboard_report(usb_dev, &data);
    }
    fn send_and_sleep() void {}
};
