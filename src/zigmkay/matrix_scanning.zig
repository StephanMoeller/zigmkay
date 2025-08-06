const std = @import("std");
const core = @import("core.zig");
const microzig = @import("microzig");
const rp2xxx = microzig.hal;
const time = rp2xxx.time;
pub const ScannerSettings = struct {
    debounce: core.TimeSpan,
    pin_raise_wait_us: u64 = 30,
};

const PinAndIndex = struct {
    col_index: usize,
    row_index: usize,
    key_index: core.KeyIndex,
};

pub fn CreateMatrixScannerType(
    comptime keymap_dimensions: core.KeymapDimensions,
    comptime pin_cols: []const rp2xxx.gpio.Pin,
    comptime pin_rows: []const rp2xxx.gpio.Pin,
    comptime pins_to_keys_mapping: [keymap_dimensions.key_count][2]usize,
    comptime settings: ScannerSettings,
) type {
    comptime var pins_with_indexes: [keymap_dimensions.key_count]PinAndIndex = [1]PinAndIndex{undefined} ** keymap_dimensions.key_count;
    // Build a new array where the actual positon of the mappings does not matter
    // Instead the new array will contain PinAndIndex strucs, where the original array index will now
    // be stored as key_index in the new array
    for (pins_to_keys_mapping, 0..) |pin_index_pair, key_index| {
        pins_with_indexes[key_index] = PinAndIndex{
            .col_index = pin_index_pair[0],
            .row_index = pin_index_pair[1],
            .key_index = key_index,
        };
    }

    // Just bubble sort the thing - its a small array and happening at comptime
    //
    var i: usize = 0;
    while (i < pins_with_indexes.len) {
        var j: usize = i;
        while (j > 0 and pins_with_indexes[j].col_index < pins_with_indexes[j - 1].col_index) {
            const temp = pins_with_indexes[j - 1];
            pins_with_indexes[j - 1] = pins_with_indexes[j];
            pins_with_indexes[j] = temp;
            j -= 1;
        }
        i += 1;
    }

    return struct {
        // current_states should be a packed struct
        var current_states: [pins_to_keys_mapping.len]bool = [1]bool{false} ** (pins_to_keys_mapping.len);
        var current_states_last_changed: [pins_to_keys_mapping.len]u64 = [1]u64{0} ** (pins_to_keys_mapping.len);

        const Self = @This();
        pub fn DetectKeyboardChanges(_: *const Self, output_queue: *core.MatrixStateChangeQueue, current_time: core.TimeSinceBoot) !void {
            var previous_col_index: usize = 255;
            for (pins_with_indexes) |pins_and_index| {
                var col = pin_cols[pins_and_index.col_index];
                var row = pin_rows[pins_and_index.row_index];
                col.put(1);
                // Only sleep if a new col is present now
                if (previous_col_index != pins_and_index.col_index) {
                    time.sleep_us(settings.pin_raise_wait_us);
                }
                previous_col_index = pins_and_index.col_index;

                const read_value = row.read();
                const pressed = read_value == 1;
                if (pressed != current_states[pins_and_index.key_index]) {
                    // DEBOUNCE HANDLING
                    // This state has changed. If this happened last time very recently, this could be a debounce.
                    // Then let it be for now. In a furute tick this will be picked up and handled correctly if it is still at the current state by then.
                    const last_changed_time = current_states_last_changed[pins_and_index.key_index];

                    if (current_time.time_since_boot_us - last_changed_time > settings.debounce.ms * 1000) {
                        current_states[pins_and_index.key_index] = pressed;
                        current_states_last_changed[pins_and_index.key_index] = current_time.time_since_boot_us;

                        const key_index_with_type: core.KeyIndex = @intCast(pins_and_index.key_index);
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

