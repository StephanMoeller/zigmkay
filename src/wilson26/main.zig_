const keymap = @import("wilson26/keymap.zig");
const core = @import("../core.zig");

const scan_settings = core.ScanSettings{ .debounce_ms = 35 };

pub fn main() !void {
    var scan_events = core.PeekableRingBuffer{ ... }// some peekable ring buffer of matrix state changes
    var current_layer_states = core.LayerStates{...}
    while(true){
        // SCAN
        var new_events = core.scan(scan_settings);// This is easy to isolate for testing
        scan_events.add(new_events);

        // DECIDE
        // This will remove the scan events that have been processed and leave any
        // remaining events that cannot yet be determined
        // this process function must also know what layers are active.
        var actions = core.process(keymap.layouts, scan_events, current_layer_states);// This is easy to isolate for testing 

        // EXECUTE CHANGES
        // fire key presses/releases
        core.usb.fire_keys(actions.key_commands);// This is tested by hand every time it changes, I think
        layer_states = actions.new_layer_state;// I dont like to do this copy in every loop - must be fixed
    }
}
