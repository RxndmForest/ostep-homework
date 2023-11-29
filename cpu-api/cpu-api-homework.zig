const std = @import("std");

pub fn main() !void {
    var x: usize = undefined;
    x = 100;

    std.debug.print("{d}\n", .{x});

    // the first print statement above prints
    // out the first instance of x (x = 100)
    // the second print statement then prints out
    // the second instance of x (x = 200) that comes
    // after fork() was successfully called
    // the last print statement prints out both instances of x?
    // This makes me think that fork creates a "new" x that can hold
    // its own value??????????
    var pid: usize = run_fork();

    if (pid > 0) {
        x = 200;

        std.debug.print("{d}\n", .{x});
    }

    std.debug.print("{d}\n", .{x});
}

fn run_fork() usize {
    return std.os.linux.fork();
}
