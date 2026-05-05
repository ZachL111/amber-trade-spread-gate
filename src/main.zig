const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 166;
const risk_penalty: i32 = 4;
const latency_penalty: i32 = 2;
const weight_bonus: i32 = 5;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 62, .capacity = 84, .latency = 8, .risk = 15, .weight = 13 };
    try std.testing.expectEqual(@as(i32, 197), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "accept"));
    const signal_case_2 = Signal{ .demand = 88, .capacity = 72, .latency = 20, .risk = 14, .weight = 4 };
    try std.testing.expectEqual(@as(i32, 172), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "accept"));
    const signal_case_3 = Signal{ .demand = 70, .capacity = 103, .latency = 23, .risk = 19, .weight = 12 };
    try std.testing.expectEqual(@as(i32, 181), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "accept"));
}
