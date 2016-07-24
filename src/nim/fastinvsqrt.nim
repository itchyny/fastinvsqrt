import strutils

proc fastInvSqrt(x: float32): float32 =
  let i = cast[int32](x)
  let j = 0x5f3759df - i shr 1
  let y = cast[float32](j)
  return y * (1.5 - 0.5 * x * y * y)

while true:
  try:
    let input = stdin.readLine
    try:
      echo fastInvSqrt(parseFloat(input))
    except ValueError:
      continue
  except IOError:
    break
