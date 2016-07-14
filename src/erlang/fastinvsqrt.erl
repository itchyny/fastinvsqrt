-module(fastinvsqrt).
-export([main/0, fast_inv_sqrt/1]).

main() ->
  case io:get_line("") of
    eof -> ok;
    {error, _} -> ok;
    Line -> catch io:format("~f~n", [fast_inv_sqrt(parse_float(Line))]), main()
  end.

fast_inv_sqrt(X) ->
  <<I:32/integer>> = <<X:32/float>>,
  J = 16#5f3759df - (I bsr 1),
  <<Y:32/float>> = <<J:32/integer>>,
  Y * (1.5 - 0.5 * X * Y * Y).

parse_float(Str) ->
  case string:to_float(Str) of
    {error, _} ->
      case string:to_integer(Str) of
        {error, _} -> error;
        {Int, _} -> float(Int)
      end;
    {Float, _} -> Float
  end.
