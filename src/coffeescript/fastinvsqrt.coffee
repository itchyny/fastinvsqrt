require 'readline'
  .createInterface
    input: process.stdin
    output: process.null
  .on 'line', (line) =>
    console.log fastInvSqrt parseFloat line

fastInvSqrt = (x) ->
  i = floatToUInt32 x
  i = 0x5f3759df - (i >> 1)
  y = uint32ToFloat i
  y * (1.5 - 0.5 * x * y * y)

floatToUInt32 = (x) ->
  buf = new ArrayBuffer 4
  (new Float32Array(buf))[0] = x
  new Uint32Array(buf)[0]

uint32ToFloat = (i) ->
  buf = new ArrayBuffer 4
  (new Uint32Array(buf))[0] = i
  new Float32Array(buf)[0]
