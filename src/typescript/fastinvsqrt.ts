declare var require;
declare var process;

require('readline').createInterface({
    input: process.stdin,
    output: process.null
}).on('line', function(line) {
    console.log(fastInvSqrt(parseFloat(line)));
});

function fastInvSqrt(x: number): number {
    var i: number = floatToUInt32(x);
    i = 0x5f3759df - (i >> 1);
    var y: number = uint32ToFloat(i);
    return y * (1.5 - 0.5 * x * y * y);
}

function floatToUInt32(x: number): number {
    var buf: ArrayBuffer = new ArrayBuffer(4);
    new Float32Array(buf)[0] = x;
    return new Uint32Array(buf)[0];
}

function uint32ToFloat(i: number): number {
    var buf: ArrayBuffer = new ArrayBuffer(4);
    new Uint32Array(buf)[0] = i;
    return new Float32Array(buf)[0];
}
