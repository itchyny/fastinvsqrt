fastInvSqrt <- function(x) {
  i <- readBin(writeBin(as.numeric(x), raw(), size=4), integer(), size=4)
  i <- 0x5f3759df - bitwShiftR(i, 1)
  y <- readBin(writeBin(as.integer(i), raw(), size=4), double(), size=4)
  y * (1.5 - 0.5 * x * y * y)
}

f <- file("stdin")
open(f)
while (length(line <- readLines(f, n=1)) > 0) {
  write(fastInvSqrt(as.numeric(line)), stdout())
}
