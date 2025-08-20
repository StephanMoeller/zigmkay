const other_main = @import("demo_main.zig");

pub fn main() !void {
    try other_main.main();
}
