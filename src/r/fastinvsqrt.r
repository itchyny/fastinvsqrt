fastInvSqrt <- function(x) {
  i <- floatToInteger(x)
  i <- 0x5f3759df - bitwShiftR(i, 1)
  y <- integerToFloat(i)
  y * (1.5 - 0.5 * x * y * y)
}

floatToInteger <- function(x) {
  v <- writeBin(as.numeric(x), raw(), size=4)
  readBin(v, integer(), size=4)
}

integerToFloat <- function(i) {
  v <- writeBin(as.integer(i), raw(), size=4)
  readBin(v, double(), size=4)
}

f <- file("stdin")
open(f)
while (length(line <- readLines(f, n=1)) > 0) {
  write(fastInvSqrt(as.numeric(line)), stdout())
}
