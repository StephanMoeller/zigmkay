const std = @import("std");
const q = @import("generic_queue.zig");
test "queue" {
    var queue = q.GenericQueue(i32, 10).Create();
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
    var queue = q.GenericQueue(i32, 5).Create();
    try std.testing.expectEqual(0, queue.Count());
    try std.testing.expectEqual(0, queue.read_all_values().len);
    try queue.enqueue(1);
    try queue.enqueue(2);
    try queue.enqueue(3);
    try queue.enqueue(4);
    try queue.enqueue(5);

    try std.testing.expectEqual(5, queue.read_all_values().len);
    const result = queue.enqueue(6);
    try std.testing.expectEqual(q.EnqueueError.CapacityExceeded, result);

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
    var queue = q.GenericQueue(i32, 5).Create();
    try std.testing.expectEqual(0, queue.Count());
    try std.testing.expectEqual(0, queue.read_all_values().len);
    try queue.enqueue(1);
    try queue.enqueue(2);
    try queue.enqueue(3);
    try queue.enqueue(4);

    try queue.dequeue_count(2);
    const result = queue.dequeue_count(3);
    try std.testing.expectEqual(q.DequeueError.CannotDequeueAmount, result);
}
