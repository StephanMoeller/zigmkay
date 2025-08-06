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
    var prev_action_time: core.TimeSinceBoot = core.TimeSinceBoot.from_absolute_us(0);

    const next_tick_delay: u64 = 20000;
    pub fn HouseKeepAndProcessCommands(self: *const UsbCommandExecutor, output_command_queue: *core.OutputCommandQueue, current_time: core.TimeSinceBoot) !void {
        _ = self;

        usb_dev.task(false) catch unreachable; // Process pending USB housekeeping

        const diff_us = try current_time.diff_us(&prev_action_time);

        if (diff_us > next_tick_delay and output_command_queue.has_events()) {
            prev_action_time = current_time;
            const command = output_command_queue.dequeue() catch unreachable;
            switch (command) {
                .KeyCodePress => |keycode| {
                    var idx: usize = 1;
                    // if the keycode was already pressed, ensure to release it first and then press it again
                    // ZMK's handling of this case: https://github.com/zmkfirmware/zmk/blob/a8a392807e1d3908bb53e90d35aae8558e2b96d1/app/src/hid_listener.c#L19
                    // Look for the log message "unregistering usage_page 0x%02X keycode 0x%02X since it was already pressed"
                    while (idx < data.len) {
                        //if (data[idx] == keycode) {
                        //    break; // already registered as pressed
                        //}
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
                            data[idx] = 0; // Found one instance of the keycode
                            break;
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
