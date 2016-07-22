Scanner scanner = new Scanner(System.in)
while (scanner.hasNext()) {
  try {
    println fastInvSqrt(Float.parseFloat(scanner.nextLine()))
  } catch (NumberFormatException e) {}
}

def fastInvSqrt(float x) {
  int i = Float.floatToRawIntBits(x)
  float y = Float.intBitsToFloat(0x5f3759df - (i >> 1))
  y * (1.5F - 0.5F * x * y * y)
}
