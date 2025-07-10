const std = @import("std");
const core = @import("core.zig");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;

// PIN CONFIGURATION: define the pins as row and col pins and specify a direction (validate that they point in the right direction)
pub fn CreateScanner() Scanner {
    pin_config.apply();
    return Scanner{};
}

// PIN CONFIGURATION
// PIN CONFIGURATION: init pins
const pin_config = rp2xxx.pins.GlobalConfiguration{
    .GPIO17 = .{ .name = "led_red", .direction = .out },
    .GPIO16 = .{ .name = "led_green", .direction = .out },
    .GPIO25 = .{ .name = "led_blue", .direction = .out },

    .GPIO26 = .{ .name = "c0", .direction = .out },
    .GPIO27 = .{ .name = "c1", .direction = .out },
    .GPIO28 = .{ .name = "c2", .direction = .out },
    .GPIO29 = .{ .name = "c3", .direction = .out },

    .GPIO6 = .{ .name = "r0", .direction = .in },
    .GPIO7 = .{ .name = "r1", .direction = .in },
    .GPIO0 = .{ .name = "r2", .direction = .in },
    .GPIO1 = .{ .name = "r3", .direction = .in },
    .GPIO2 = .{ .name = "r4", .direction = .in },
    .GPIO4 = .{ .name = "r5", .direction = .in },
    .GPIO3 = .{ .name = "r6", .direction = .in },
};

const p = pin_config.pins();

// zig fmt: off
const pinsToKeysMapping = [_][2]rp2xxx.gpio.Pin{

    .{p.c3,p.r6}
};

// zig fmt: on
var current_states: [pinsToKeysMapping.len]u2 = [1]u2{0} ** (pinsToKeysMapping.len);

pub const Scanner = struct {
    pub fn DetectKeyboardChanges(self: Scanner, output_queue: *core.KeyboardStateChangeQueue) !void {
        _ = self;
        // if
        for (pinsToKeysMapping, 0..) |mapping, key_index| {
            // todo: dont wait if previous col was the same as this one
            var col = mapping[0];
            col.put(1);
            sleep();
            var row = mapping[1];
            const pressed = row.read();
            if (pressed != current_states[key_index]) {
                current_states[key_index] = pressed;
                try output_queue.enqueue(.{ .pressed = pressed, .key_index = key_index });
                p.led_red.put(pressed);
                p.led_green.put(1 - pressed);
                p.led_blue.put(1);
            }
            col.put(0);
        }
        // zig fmt: off
    }
};
const time = rp2xxx.time;
fn sleep() void {
    time.sleep_ms(1); 
}
