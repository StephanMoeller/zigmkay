const core = @import("core/types.zig");
const std = @import("std");

const keyboard = @import("wilson26/keymap.zig").KeyboardConfig;
const keyboardDef = keyboard.keymap;
const pinSetup = keyboard.rowPins;

// Init
// - get input/output pins
// - get x/y scanning coordinates
// - get layered keymap
//
// Loop
// - Scan Matrix and compare to last scanned matrix (keep track of last change per position in matrix to implement debounce), Produces list of matrix scans and add it to the event list
// - Process event queue by determining if anything can be done at this point, create actions and remove the corresponding events from the event list
// - Process the given actions (fire keycodes presses/releases and layer changes)
const currentTime: u32 = 154; // read current time/tick somehow
var unprocessedEvents: []MatrixEvent = null;
var newActions: []MatrixEvent = null;
scanMatrixAndAddEventsToUnprocessedEvents();
processUnprocessedEventsAndConvertToActions();
executeActions();

const MatrixEvent = struct { col: usize, row: usize, state: bool };
fn scanMatrixAndAddEventsToUnprocessedEvents() []MatrixEvent {
    unreachable;
}

pub fn main() !void {
    // init pins
    scanMatrix();
    std.log.info("keycount: {any}", .{keyboard});
}
