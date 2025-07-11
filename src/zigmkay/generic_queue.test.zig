const std = @import("std");
const q = @import("generic_queue.zig");
test "queue" {
    var queue = q.GenericQueue(i32, 10).Create();
    try std.testing.expectEqual(0, queue.Count());
    try queue.enqueue(10);
    try queue.enqueue(11);
    try queue.enqueue(12);

    try std.testing.expectEqual(3, queue.Count());
    try std.testing.expectEqual(10, queue.dequeue());
    try std.testing.expectEqual(11, queue.dequeue());
    try std.testing.expectEqual(1, queue.Count());
    try std.testing.expectEqual(12, queue.dequeue());
    try std.testing.expectEqual(0, queue.Count());

    try queue.enqueue(20);
    try queue.enqueue(21);

    try std.testing.expectEqual(2, queue.Count());

    try std.testing.expectEqual(20, queue.dequeue());
    try std.testing.expectEqual(21, queue.dequeue());

    try std.testing.expectEqual(0, queue.Count());
}

test "enqueue error" {
    var queue = q.GenericQueue(i32, 5).Create();
    try std.testing.expectEqual(0, queue.Count());
    _ = try queue.enqueue(1);
    _ = try queue.enqueue(2);
    _ = try queue.enqueue(3);
    _ = try queue.enqueue(4);
    _ = try queue.enqueue(5);

    try std.testing.expectEqual(5, queue.Count());
    const result = queue.enqueue(6);
    try std.testing.expectEqual(q.EnqueueError.CapacityExceeded, result);

    try std.testing.expectEqual(1, queue.dequeue());
    try std.testing.expectEqual(2, queue.dequeue());
    try std.testing.expectEqual(3, queue.Count());
    try queue.enqueue(10);
    try queue.enqueue(11);

    try std.testing.expectEqual(5, queue.Count());

    try std.testing.expectEqual(3, queue.dequeue());
    try std.testing.expectEqual(4, queue.dequeue());
    try std.testing.expectEqual(5, queue.dequeue());
    try std.testing.expectEqual(10, queue.dequeue());
    try std.testing.expectEqual(11, queue.dequeue());
}

test "dequeue error" {
    var queue = q.GenericQueue(i32, 5).Create();
    try std.testing.expectEqual(0, queue.Count());
    try queue.enqueue(1);
    try queue.enqueue(2);
    try queue.enqueue(3);
    try queue.enqueue(4);

    _ = try queue.dequeue();
    _ = try queue.dequeue();
    _ = try queue.dequeue();
    _ = try queue.dequeue();

    const result = queue.dequeue();
    try std.testing.expectEqual(q.DequeueError.NoElements, result);

    try queue.enqueue(5);
    try std.testing.expectEqual(5, queue.dequeue());
}
