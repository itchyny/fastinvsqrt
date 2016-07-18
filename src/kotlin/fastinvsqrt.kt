fun main(args: Array<String>) {
  while (true) {
    val line = readLine()
    if (line == null) break
    try {
      println(fastInvSqrt(line.toFloat()))
    } catch (e: NumberFormatException) {}
  }
}

fun fastInvSqrt(x: Float): Float {
  val i = java.lang.Float.floatToRawIntBits(x)
  val y = java.lang.Float.intBitsToFloat(0x5f3759df - (i shr 1))
  return y * (1.5F - 0.5F * x * y * y)
}
