def fastinvsqrt(x : Float32) : Float32
  i = pointerof(x).as(Int32*).value
  i = 0x5f3759df - (i >> 1)
  y = pointerof(i).as(Float32*).value
  y * (1.5 - 0.5 * x * y * y)
end

while line = gets
  puts fastinvsqrt(line.to_f32)
end
