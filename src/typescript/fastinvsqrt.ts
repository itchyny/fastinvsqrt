import * as process from "process"
import * as readline from "readline"

readline.createInterface({
    input: process.stdin,
}).on('line', function(line: string) {
    console.log(fastInvSqrt(parseFloat(line)));
});

function fastInvSqrt(x: number): number {
    const i: number = floatToUInt32(x);
    const j: number = 0x5f3759df - (i >> 1);
    const y: number = uint32ToFloat(j);
    return y * (1.5 - 0.5 * x * y * y);
}

function floatToUInt32(x: number): number {
    const buf: ArrayBuffer = Float32Array.of(x).buffer;
    return new Uint32Array(buf)[0];
}

function uint32ToFloat(i: number): number {
    const buf: ArrayBuffer = Uint32Array.of(i).buffer;
    return new Float32Array(buf)[0];
}
