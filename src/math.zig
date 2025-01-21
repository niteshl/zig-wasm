// https://ziglang.org/documentation/master/#Freestanding

extern fn print(i32) void;

export fn add(a: i32, b: i32) void {
    print(a + b);
}

// $ zig build-exe math.zig -target wasm32-freestanding -fno-entry --export=add

// run with ../test.js

// this can be used in browser based on
// https://medium.com/@BenedekGagyi/the-simplest-way-to-get-started-with-webassembly-1f92f6f90d24
// first serve from root after installing `npm install -g http-server` to serve static files
// it will load index.html , modify it for improvements