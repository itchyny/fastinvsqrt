fastInvSqrt =: 3 : 0
  i =. _2 ic 1 fc y
  i =. (dfh'5f3759df') - _1 (33 b.) i
  z =. _1 fc 2 ic i
  z * (1.5 - 0.5 * y * z * z)
)

echo & fastInvSqrt & (0 & ".) & (-. & CRLF) ;. 2 &. stdin ''
exit ''
