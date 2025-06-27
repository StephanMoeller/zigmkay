const std = @import("std");

const EnqueueError = error{CapacityExceeded};
const DequeueError = error{CannotDequeueAmount};
pub fn GenericQueue(comptime T: type, comptime max_capacity: usize) type {
    return struct {
        const Self = @This();
        data: [max_capacity]T,
        counter: usize = 0,
        pub fn Create() Self {
            return Self{ .data = [1]T{undefined} ** max_capacity };
        }
        pub fn Count(self: *Self) usize {
            return self.counter;
        }
        pub fn enqueue(self: *Self, element: T) EnqueueError!void {
            if (self.counter == max_capacity) {
                return EnqueueError.CapacityExceeded;
            }
            self.data[self.counter] = element;
            self.counter = self.counter + 1;
        }
        pub fn read_all_values(self: *Self) []const T {
            return self.data[0..self.counter];
        }
        pub fn dequeue(self: *Self) DequeueError!T {
            if (self.counter == 0) {
                return DequeueError.CannotDequeueAmount;
            }

            const head_element = self.data[0];
            for (self.data[1..self.counter], 0..self.counter - 1) |item, index| {
                self.data[index] = item;
            }
            return head_element;
        }
        pub fn dequeue_count(self: *Self, count: usize) DequeueError!void {
            if (count > self.counter) {
                return DequeueError.CannotDequeueAmount;
            }
            for (self.data[count..self.counter], 0..self.counter - count) |item, index| {
                self.data[index] = item;
            }
            self.counter = self.counter - count;
        }
    };
}

test "queue" {
    var queue = GenericQueue(i32, 10).Create();
    try std.testing.expectEqual(0, queue.Count());
    try std.testing.expectEqual(0, queue.read_all_values().len);
    try queue.enqueue(10);
    try queue.enqueue(11);
    try queue.enqueue(12);

    var all_values = queue.read_all_values();
    try std.testing.expectEqual(3, all_values.len);
    try std.testing.expectEqual(10, all_values[0]);
    try std.testing.expectEqual(11, all_values[1]);
    try std.testing.expectEqual(12, all_values[2]);

    try queue.dequeue_count(2);
    all_values = queue.read_all_values();
    try std.testing.expectEqual(1, all_values.len);
    try std.testing.expectEqual(12, all_values[0]);

    try queue.dequeue_count(1);
    all_values = queue.read_all_values();
    try std.testing.expectEqual(0, all_values.len);

    try queue.enqueue(20);
    try queue.enqueue(21);

    all_values = queue.read_all_values();
    try std.testing.expectEqual(2, all_values.len);
    try std.testing.expectEqual(20, all_values[0]);
    try std.testing.expectEqual(21, all_values[1]);
}

test "enqueue error" {
    var queue = GenericQueue(i32, 5).Create();
    try std.testing.expectEqual(0, queue.Count());
    try std.testing.expectEqual(0, queue.read_all_values().len);
    try queue.enqueue(1);
    try queue.enqueue(2);
    try queue.enqueue(3);
    try queue.enqueue(4);
    try queue.enqueue(5);

    try std.testing.expectEqual(5, queue.read_all_values().len);
    const result = queue.enqueue(6);
    try std.testing.expectEqual(EnqueueError.CapacityExceeded, result);

    try queue.dequeue_count(2);
    try queue.enqueue(10);
    try queue.enqueue(11);

    const all_values = queue.read_all_values();
    try std.testing.expectEqual(5, all_values.len);
    try std.testing.expectEqual(3, all_values[0]);
    try std.testing.expectEqual(4, all_values[1]);
    try std.testing.expectEqual(5, all_values[2]);
    try std.testing.expectEqual(10, all_values[3]);
    try std.testing.expectEqual(11, all_values[4]);
}

test "dequeue error" {
    var queue = GenericQueue(i32, 5).Create();
    try std.testing.expectEqual(0, queue.Count());
    try std.testing.expectEqual(0, queue.read_all_values().len);
    try queue.enqueue(1);
    try queue.enqueue(2);
    try queue.enqueue(3);
    try queue.enqueue(4);

    try queue.dequeue_count(2);
    const result = queue.dequeue_count(3);
    try std.testing.expectEqual(DequeueError.CannotDequeueAmount, result);
}
