@main def main(): Unit =
  for (line <- io.Source.stdin.getLines)
    for x <- line.toFloatOption
    do println(fastInvSqrt(x))

def fastInvSqrt(x: Float): Float =
  val i = java.lang.Float.floatToRawIntBits(x)
  val y = java.lang.Float.intBitsToFloat(0x5f3759df - (i >> 1))
  y * (1.5F - 0.5F * x * y * y)
