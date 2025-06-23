const std = @import("std");
const microzig = @import("microzig");
const usb_if = @import("usb_if.zig");
const rp2xxx = microzig.hal;
const time = rp2xxx.time;
const usb = rp2xxx.usb;
const usb_dev = rp2xxx.usb.Usb(.{});

const usb_packet_size = 64;
const usb_config_len = usb.templates.config_descriptor_len + usb.templates.hid_in_out_descriptor_len;
const usb_config_descriptor =
    usb.templates.config_descriptor(1, 1, 0, usb_config_len, 0xc0, 100) ++
    usb.templates.hid_in_out_descriptor(0, 0, 0, usb.hid.ReportDescriptorGenericInOut.len, usb.Endpoint.to_address(1, .Out), usb.Endpoint.to_address(1, .In), usb_packet_size, 0);

var driver_hid = usb.hid.HidClassDriver{ .report_descriptor = &usb.hid.ReportDescriptorGenericInOut };
var drivers = [_]usb.types.UsbClassDriver{driver_hid.driver()};

// This is our device configuration
pub var DEVICE_CONFIGURATION: usb.DeviceConfiguration = .{
    .device_descriptor = &.{
        .descriptor_type = usb.DescType.Device,
        .bcd_usb = 0x0200,
        .device_class = 0,
        .device_subclass = 0,
        .device_protocol = 0,
        .max_packet_size0 = 64,
        .vendor = 0xCafe,
        .product = 2,
        .bcd_device = 0x0100,
        // Those are indices to the descriptor strings
        // Make sure to provide enough string descriptors!
        .manufacturer_s = 1,
        .product_s = 2,
        .serial_s = 3,
        .num_configurations = 1,
    },
    .config_descriptor = &usb_config_descriptor,
    .lang_descriptor = "\x04\x03\x09\x04", // length || string descriptor (0x03) || Engl (0x0409)
    .descriptor_strings = &.{
        &usb.utils.utf8ToUtf16Le("EasyMkay"),
        &usb.utils.utf8ToUtf16Le("Pico Test 987987987987987987"),
        &usb.utils.utf8ToUtf16Le("cafebabe"),
    },
    .drivers = &drivers,
};

// Compile-time pin configuration
const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{ .name = "led_red", .direction = .out },
    .GPIO16 = .{ .name = "led_green", .direction = .out },
    .GPIO25 = .{ .name = "led_blue", .direction = .out },
    .GPIO29 = .{ .name = "row0", .direction = .out },
    .GPIO4 = .{ .name = "col0", .direction = .in },
};
const pins = pin_config.pins();

pub fn main() !void {

    // First we initialize the USB clock
    usb_if.init(usb_dev);

    pin_config.apply();
    pins.row0.put(1);
    while (true) {
        var keycodes: [6]u8 = [6]u8{ 4, 0, 0, 0, 0, 0 };
        usb_if.send_keyboard_report(usb_dev, &keycodes);

        const val: u1 = pins.col0.read();
        pins.led_red.put(val);
        pins.led_green.put(val);
        pins.led_blue.put(val);
    }
}
