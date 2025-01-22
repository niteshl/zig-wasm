// https://ziglang.org/documentation/master/#toc-WASI

// had to change allocator as .init did not work

const std = @import("std");

pub fn main() !void {
    var general_purpose_allocator: std.heap.GeneralPurposeAllocator(.{}) = std.heap.GeneralPurposeAllocator(.{}){};
    const gpa = general_purpose_allocator.allocator();

    const args = try std.process.argsAlloc(gpa);
    defer std.process.argsFree(gpa, args);

    for (args, 0..) |arg, i| {
        std.debug.print("{}: {s}\n", .{ i, arg });
    }
}

// $ zig build-exe wasi_args.zig -target wasm32-wasi

// run with
// wasmtime wasi_args.wasm 123 hello