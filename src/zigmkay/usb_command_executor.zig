const std = @import("std");
const core = @import("core.zig");
const microzig = @import("microzig");
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
    var prev_action_time: microzig.drivers.time.Absolute = undefined;
    var first_call = true;
    const next_tick_delay: u64 = 20000;
    pub fn HouseKeepAndProcessCommands(self: *const UsbCommandExecutor, output_command_queue: *core.OutputCommandQueue) !void {
        _ = self;
        if (first_call) {
            first_call = false;
            prev_action_time = time.get_time_since_boot();
        }
        usb_dev.task(false) catch unreachable; // Process pending USB housekeeping

        const current_time = time.get_time_since_boot();
        const diff = current_time.diff(prev_action_time);

        if (diff.to_us() > next_tick_delay and output_command_queue.Count() > 0) {
            prev_action_time = current_time;
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
                .ActivateBootMode => {
                    rp2xxx.rom.reset_to_usb_boot()(0, 0);
                },
            }

            usb_if.send_keyboard_report(usb_dev, &data);
        }
    }
};
