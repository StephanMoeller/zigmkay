const other_main = @import("keyboards/miketypeson/main.zig");

pub fn main() !void {
    try other_main.main();
}
