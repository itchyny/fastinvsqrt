require('readline').createInterface({
    input: process.stdin,
}).on('line', (line) => {
    console.log(fastInvSqrt(parseFloat(line)));
});

function fastInvSqrt(x) {
    const i = floatToUInt32(x);
    const j = 0x5f3759df - (i >> 1);
    const y = uint32ToFloat(j);
    return y * (1.5 - 0.5 * x * y * y);
}

function floatToUInt32(x) {
    const buf = Float32Array.of(x).buffer;
    return new Uint32Array(buf)[0];
}

function uint32ToFloat(i) {
    const buf = Uint32Array.of(i).buffer;
    return new Float32Array(buf)[0];
}
