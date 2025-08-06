const std = @import("std");
const core = @import("core.zig");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const time = rp2xxx.time;
pub const ScannerSettings = struct {
    debounce: core.TimeSpan,
};

pub fn CreateMatrixScannerType(
    comptime keymap_dimensions: core.KeymapDimensions,
    comptime pinsToKeysMapping: [keymap_dimensions.key_count][2]rp2xxx.gpio.Pin,
    comptime settings: ScannerSettings,
) type {
    return struct {
        // current_states should be a packed struct
        var current_states: [pinsToKeysMapping.len]bool = [1]bool{false} ** (pinsToKeysMapping.len);
        var current_states_last_changed: [pinsToKeysMapping.len]u64 = [1]u64{0} ** (pinsToKeysMapping.len);

        const Self = @This();
        pub fn DetectKeyboardChanges(_: *const Self, output_queue: *core.MatrixStateChangeQueue, current_time: core.TimeSinceBoot) !void {
            // if
            for (pinsToKeysMapping, 0..) |mapping, key_index| {
                // todo: dont wait if previous col was the same as this one
                var col = mapping[0];
                var row = mapping[1];
                col.put(1);
                time.sleep_us(30);
                const read_value = row.read();
                const pressed = read_value == 1;
                if (pressed != current_states[key_index]) {
                    // DEBOUNCE HANDLING
                    // This state has changed. If this happened last time very recently, this could be a debounce.
                    // Then let it be for now. In a furute tick this will be picked up and handled correctly if it is still at the current state by then.
                    const last_changed_time = current_states_last_changed[key_index];

                    if (current_time.time_since_boot_us - last_changed_time > settings.debounce.ms * 1000) {
                        current_states[key_index] = pressed;
                        current_states_last_changed[key_index] = current_time.time_since_boot_us;

                        const key_index_with_type: core.KeyIndex = @intCast(key_index);
                        try output_queue.enqueue(.{ .pressed = pressed, .key_index = key_index_with_type, .time = current_time });
                        //p.led_red.put(read_value);
                        //p.led_green.put(1 - read_value);
                        //p.led_blue.put(1);
                    }
                }
                col.put(0);
            }
            // zig fmt: off
    }
    };
}

