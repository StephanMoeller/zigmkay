const std = @import("std");
const microzig = @import("microzig");

const rp2xxx = microzig.hal;
const flash = rp2xxx.flash;
const time = rp2xxx.time;
const gpio = rp2xxx.gpio;
const clocks = rp2xxx.clocks;
const usb = rp2xxx.usb;

const hid = usb.hid;

pub const HID_KeymodifierCodes = enum(u8) {
    left_control = 0xe0,
    left_shift,
    left_alt,
    left_gui,
    right_control,
    right_shift,
    right_alt,
    right_gui,
};

// HID descriptor for keyboard
const KeyboardReportDescriptor = hid.hid_usage_page(1, hid.UsageTable.desktop) ++
    hid.hid_usage(1, hid.DesktopUsage.keyboard) ++
    hid.hid_collection(hid.CollectionItem.Application) ++
    hid.hid_usage_page(1, hid.UsageTable.keyboard) ++
    hid.hid_usage_min(1, .{@intFromEnum(HID_KeymodifierCodes.left_control)}) ++
    hid.hid_usage_max(1, .{@intFromEnum(HID_KeymodifierCodes.right_gui)}) ++
    hid.hid_logical_min(1, "\x00".*) ++
    hid.hid_logical_max(1, "\x01".*) ++
    hid.hid_report_size(1, "\x01".*) ++
    hid.hid_report_count(1, "\x08".*) ++
    hid.hid_input(hid.HID_DATA | hid.HID_VARIABLE | hid.HID_ABSOLUTE) ++
    hid.hid_report_count(1, "\x06".*) ++
    hid.hid_report_size(1, "\x08".*) ++
    hid.hid_logical_max(1, "\x65".*) ++
    hid.hid_usage_min(1, "\x00".*) ++
    hid.hid_usage_max(1, "\x65".*) ++
    hid.hid_input(hid.HID_DATA | hid.HID_ARRAY | hid.HID_ABSOLUTE) ++
    hid.hid_collection_end();

// HID report buffer
const keyboardEpAddr = rp2xxx.usb.Endpoint.to_address(1, .In);

const usb_packet_size = 7;
const usb_config_len = usb.templates.config_descriptor_len + usb.templates.hid_in_descriptor_len;
const usb_config_descriptor = usb.templates.config_descriptor(1, 1, 0, usb_config_len, 0x80, 500) ++
    (usb.types.InterfaceDescriptor{
        .interface_number = 1,
        .alternate_setting = 0,
        .num_endpoints = 1,
        .interface_class = 3,
        .interface_subclass = 0,
        .interface_protocol = 1,
        .interface_s = 4,
    }).serialize() ++
    (hid.HidDescriptor{
        .bcd_hid = 0x0111,
        .country_code = 0,
        .num_descriptors = 1,
        .report_length = KeyboardReportDescriptor.len,
    }).serialize() ++
    (usb.types.EndpointDescriptor{
        .endpoint_address = keyboardEpAddr,
        .attributes = @intFromEnum(usb.types.TransferType.Interrupt),
        .max_packet_size = usb_packet_size,
        .interval = 10,
    }).serialize();

// Create keyboard HID driver
var driver_keyboard = usb.hid.HidClassDriver{
    .ep_in = keyboardEpAddr,
    .report_descriptor = &KeyboardReportDescriptor,
};

// Register both drivers
var drivers = [_]usb.types.UsbClassDriver{driver_keyboard.driver()};

// This is our device configuration
pub var DEVICE_CONFIGURATION: usb.DeviceConfiguration = .{
    .device_descriptor = &.{
        .descriptor_type = usb.DescType.Device,
        .bcd_usb = 0x0200,
        .device_class = 0,
        .device_subclass = 0,
        .device_protocol = 0,
        .max_packet_size0 = 64,
        .vendor = 0xFAFA,
        .product = 0x00F0,
        .bcd_device = 0x0100,
        // Those are indices to the descriptor strings (starting from 1)
        // Make sure to provide enough string descriptors!
        .manufacturer_s = 1,
        .product_s = 2,
        .serial_s = 3,
        .num_configurations = 1,
    },
    .config_descriptor = &usb_config_descriptor,
    .lang_descriptor = "\x04\x03\x09\x04", // length || string descriptor (0x03) || Engl (0x0409)
    .descriptor_strings = &.{
        &usb.utils.utf8_to_utf16_le("Stephan Møller"),
        &usb.utils.utf8_to_utf16_le("ZigMkay"),
        &usb.utils.utf8_to_utf16_le("00000001"),
        &usb.utils.utf8_to_utf16_le("Keyboard"),
    },
    .drivers = &drivers,
};

pub fn init(usb_dev: type) void {
    // First we initialize the USB clock
    usb_dev.init_clk();

    // Then initialize the USB device using the configuration defined above
    usb_dev.init_device(&DEVICE_CONFIGURATION) catch unreachable;

    // Initialize endpoint for HID device
    usb_dev.callbacks.endpoint_open(keyboardEpAddr, 512, usb.types.TransferType.Interrupt);
    std.log.debug("USB configured", .{});
}

pub fn send_keyboard_report(usb_dev: type, keycodes: *[7]u8) void {
    usb_dev.callbacks.usb_start_tx(keyboardEpAddr, keycodes);
}
