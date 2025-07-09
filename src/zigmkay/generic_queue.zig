const std = @import("std");

pub const EnqueueError = error{CapacityExceeded};
pub const DequeueError = error{CannotDequeueAmount};
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
            self.counter = self.counter - 1;
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
