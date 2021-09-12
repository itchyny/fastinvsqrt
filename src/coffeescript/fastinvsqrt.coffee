require 'readline'
  .createInterface
    input: process.stdin
  .on 'line', (line) =>
    console.log fastInvSqrt parseFloat line

fastInvSqrt = (x) ->
  i = floatToUInt32 x
  j = 0x5f3759df - (i >> 1)
  y = uint32ToFloat j
  y * (1.5 - 0.5 * x * y * y)

floatToUInt32 = (x) ->
  buf = Float32Array.of(x).buffer
  new Uint32Array(buf)[0]

uint32ToFloat = (i) ->
  buf = Uint32Array.of(i).buffer
  new Float32Array(buf)[0]
