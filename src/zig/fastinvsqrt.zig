const std = @import("std");

pub fn main() anyerror!void {
    var buf: [10]u8 = undefined;
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();
    while (try stdin.readUntilDelimiterOrEof(buf[0..], '\n')) |line| {
        const value = try std.fmt.parseFloat(f32, line);
        try stdout.print("{d}\n", .{fastInvSqrt(value)});
    }
}

fn fastInvSqrt(x: f32) f32 {
    const i = @bitCast(i32, x);
    const j = 0x5f3759df - (i >> 1);
    const y = @bitCast(f32, j);
    return y * (1.5 - 0.5 * x * y * y);
}
