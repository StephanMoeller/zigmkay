const std = @import("std");

const EnqueueError = error{CapacityExceeded};
pub fn GenericQueue(comptime T: type, comptime max_capacity: usize) type {
    return struct {
        const Self = @This();
        data: [max_capacity]T,
        var counter: usize = 0;
        pub fn Create() Self {
            return Self{ .data = [1]T{undefined} ** max_capacity };
        }
        pub fn Count(self: *Self) usize {
            return self.counter;
        }
        pub fn enqueue(self: *Self, element: T) EnqueueError!void {
            if (counter == max_capacity) {
                return EnqueueError.CapacityExceeded;
            }
            self.data[counter] = element;
            counter = counter + 1;
        }
        pub fn read_all_values(self: *Self) []const T {
            return self.data[0..counter];
        }
        pub fn dequeue_count(self: *Self, count: usize) void {
            for (self.data[count..counter], 0..counter - count) |item, index| {
                self.data[index] = item;
            }
            counter = counter - count;
        }
    };
}

test "queue" {
    var queue = GenericQueue(i32, 10).Create();
    try std.testing.expectEqual(0, queue.read_all_values().len);
    try queue.enqueue(10);
    try queue.enqueue(11);
    try queue.enqueue(12);

    var all_values = queue.read_all_values();
    try std.testing.expectEqual(3, all_values.len);
    try std.testing.expectEqual(10, all_values[0]);
    try std.testing.expectEqual(11, all_values[1]);
    try std.testing.expectEqual(12, all_values[2]);

    queue.dequeue_count(2);
    all_values = queue.read_all_values();
    try std.testing.expectEqual(1, all_values.len);
    try std.testing.expectEqual(12, all_values[0]);

    queue.dequeue_count(1);
    all_values = queue.read_all_values();
    try std.testing.expectEqual(0, all_values.len);

    try queue.enqueue(20);
    try queue.enqueue(21);

    all_values = queue.read_all_values();
    try std.testing.expectEqual(2, all_values.len);
    try std.testing.expectEqual(20, all_values[0]);
    try std.testing.expectEqual(21, all_values[1]);
}

test "hitting maximum" {
    var queue = GenericQueue(i32, 5).Create();
    try std.testing.expectEqual(0, queue.read_all_values().len);
    try queue.enqueue(1);
    try queue.enqueue(2);
    try queue.enqueue(3);
    try queue.enqueue(4);
    try queue.enqueue(5);

    try std.testing.expectEqual(5, queue.read_all_values().len);
    const result = queue.enqueue(6);
    try std.testing.expectEqual(EnqueueError.CapacityExceeded, result);

    // this test exists to ensure we well have this handled nicely
}
