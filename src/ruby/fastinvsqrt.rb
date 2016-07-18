def fastInvSqrt(x)
  i = [x].pack("e").unpack("i")[0]
  i = 0x5f3759df - (i >> 1)
  y = [i].pack("i").unpack("e")[0]
  y * (1.5 - 0.5 * x * y * y)
end

if __FILE__ == $0
  STDIN.each_line do |line|
    p fastInvSqrt(line.to_f)
  end
end
