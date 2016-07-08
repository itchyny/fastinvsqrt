def fastInvSqrt(x)
  i = [x].pack('F').unpack('I')[0]
  i = 0x5f3759df - (i >> 1);
  y = [i].pack('I').unpack('F')[0]
  y * (1.5 - 0.5 * x * y * y)
end

if __FILE__ == $0
  STDIN.each_line do |line|
    p fastInvSqrt(line.to_f)
  end
end
