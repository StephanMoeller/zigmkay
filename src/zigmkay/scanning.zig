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

    .GPIO6 = .{ .name = "col_inner", .direction = .out },
    .GPIO29 = .{ .name = "col_index", .direction = .out },
    .GPIO28 = .{ .name = "col_mid", .direction = .out },
    .GPIO27 = .{ .name = "col_ring", .direction = .out },
    .GPIO26 = .{ .name = "col_pinky", .direction = .out },

    .GPIO2 = .{ .name = "row_top", .direction = .in },
    .GPIO4 = .{ .name = "row_home", .direction = .in },
    .GPIO3 = .{ .name = "row_bottom", .direction = .in },
};
const pins = pin_config.pins();
const cols = [_]rp2xxx.gpio.Pin{ pins.col_inner, pins.col_index, pins.col_mid, pins.col_ring, pins.col_pinky };
const rows = [_]rp2xxx.gpio.Pin{ pins.row_top, pins.row_home, pins.row_bottom };
const KeyCount = 13;
// zig fmt: off
const pinsToKeysMapping = [KeyCount][2]u8{
                .{0,1}, .{0,2}, .{0,3}, .{0,4},   
         .{1,0},.{1,1}, .{1,2}, .{1,3}, .{1,4},   
                .{2,1}, .{2,2}, .{2,3},
                                .{2,4}
    };

// zig fmt: on
var current_states: [KeyCount]u2 = [1]u2{0} ** (KeyCount);

pub const Scanner = struct {
    pub fn DetectKeyboardChanges(self: Scanner, output_queue: *core.KeyboardStateChangeQueue) !void {
        _ = self;
        // if
        for (pinsToKeysMapping, 0..) |mapping, key_index| {
            // todo: dont wait if previous col was the same as this one
            const col_index = mapping[1];
            const row_index = mapping[0];
            var col = cols[col_index];
            col.put(1);
            sleep();
            var row = rows[row_index];
            const pressed = row.read();
            if (pressed != current_states[key_index]) {
                current_states[key_index] = pressed;
                try output_queue.enqueue(.{ .pressed = pressed, .key_index = key_index });
                pins.led_red.put(pressed);
                pins.led_green.put(1 - pressed);
                pins.led_blue.put(1);
            }
            col.put(0);
        }
        _ = rows;
        // zig fmt: off
    }
};
const time = rp2xxx.time;
fn sleep() void {
   time.sleep_ms(1); 
}
