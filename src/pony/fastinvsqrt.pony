use "buffered"

actor Main
  new create(env: Env) =>
    env.input(
      object iso is InputNotify
        let buf: Reader iso = Reader

        fun ref apply(data: Array[U8] iso) =>
          buf.append(consume data)
          while buf.size() > 0 do
            try
              env.out.print(fastInvSqrt(buf.line()?.f32()?).string())
            else
              break
            end
          end

        fun fastInvSqrt(x: F32): F32 =>
          let i = x.bits()
          let j = 0x5f3759df - (i >> 1)
          let y = F32.from_bits(j)
          y * (1.5 - (0.5 * x * y * y))

      end,
      512
    )
