const other_main = @import("keyboards/grazkb/main.zig");

pub fn main() !void {
    try other_main.main();
}
