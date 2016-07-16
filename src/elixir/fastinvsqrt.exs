defmodule Main do

  def main() do
    case IO.gets "" do
      :eof -> :ok
      {:error, _} -> :ok
      line ->
        case Float.parse(line) do
          :error -> :ok
          {float, _} -> IO.puts FastInvSqrt.fast_inv_sqrt(float)
        end
        main()
    end
  end

end

defmodule FastInvSqrt do

  use Bitwise, only_operators: true

  def fast_inv_sqrt(x) do
    <<i::size(32)-integer>> = <<x::float-32>>
    j = 0x5f3759df - (i >>> 1)
    <<y::float-32>> = <<j::size(32)-integer>>
    y * (1.5 - 0.5 * x * y * y)
  end

end
