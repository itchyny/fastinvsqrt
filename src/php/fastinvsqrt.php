<?php
while ($line = fgets(STDIN)) {
  echo fastInvSqrt(floatval($line)), "\n";
}

function fastInvSqrt($x) {
  $i = unpack('l', pack('f', $x))[1];
  $i = 0x5f3759df - ($i >> 1);
  $y = unpack('f', pack('l', $i))[1];
  return $y * (1.5 - 0.5 * $x * $y * $y);
}
?>
