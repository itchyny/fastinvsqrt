# Fast inverse square root in programming languages
[![CI Status](https://github.com/itchyny/fastinvsqrt/workflows/CI/badge.svg)](https://github.com/itchyny/fastinvsqrt/actions) [![Number of languages](https://img.shields.io/badge/dynamic/json.svg?label=number%20of%20languages&url=https%3A%2F%2Fgh-langs-number.now.sh%2Fitchyny%2Ffastinvsqrt&query=number&colorB=blue)](https://api.github.com/repos/itchyny/fastinvsqrt/languages)

This is a repository for my challenge of *writing Fast inverse square root algorithm in many languages*.

Writing one algorithm in many languages is fun.
I wrote some codes in languages I have never experienced.
I learned the differences and similarities between the languages, how languages are influenced by others.

This challenge is just a passing point on my way.
Now I want to continue learning some languages I've never thought of writing before this challenge.
For example, I have never experienced Rust, OCaml and Erlang but now I think I should continue learning these languages.

## Why did I choose this algorithm?
Here is an implementation in C.
```c
float fastInvSqrt(float x) {
  int i = *(int*)&x;
  i = 0x5f3759df - (i >> 1);
  float y = *(float*)&i;
  return y * (1.5F - 0.5F * x * y * y);
}
```
The pointer casting magic is the most important part of this algorithm.
I do not explain why the code works here, please refer to the other references [link](https://www.google.com/search?q=fast%20inverse%20square%20root).

First of all, the algorithm to choose should not be too easy and should not be too difficult.
If the problem was easy, I could write the codes after some glance on the language tutorials.
On the other hand, I could give up the challenge if it was too difficult.

Secondary, pointer casting is not such an easy task in some languages.
Some languages do not allow us to touch the pointer addresses of the variables.
For scripting languages, I have to look through the document whether I can get the byte pattern of floating point numbers.

Thirdly, I like the algorithm.
The algorithm is largely based on how the floating point number is represented on our computers.
When I came across this algorithm, I got very surprised that it effectively uses the casting pointers between different types of number.

## Some examples in languages
All the codes are included in the repository but I want to introduce some interesting implementations here.

### Groovy
Groovy is like an un-fancy Java.
```groovy
Scanner scanner = new Scanner(System.in)
while (scanner.hasNext()) {
  try {
    println fastInvSqrt(Float.parseFloat(scanner.nextLine()))
  } catch (NumberFormatException e) {}
}

def fastInvSqrt(float x) {
  int i = Float.floatToRawIntBits(x)
  float y = Float.intBitsToFloat(0x5f3759df - (i >> 1))
  y * (1.5F - 0.5F * x * y * y)
}
```

### Clojure
Clojure is also a JVM language so the `Float/floatToRawIntBits` function routes in the function of Java.
```clojure
(defn fast-inv-sqrt [x]
  (let [i (Float/floatToRawIntBits x)
        y (Float/intBitsToFloat (- 0x5f3759df (bit-shift-right i 1)))]
    (* y (- 1.5 (* 0.5 x y y)))))

(doseq [line (line-seq (java.io.BufferedReader. *in*))]
  (try (println (fast-inv-sqrt (read-string line)))
      (catch java.lang.RuntimeException e ())))
```

### Crystal
This language looks like Ruby, but is one of the compiled languages.
The code of pointer casting looks pretty.
```crystal
def fastinvsqrt(x : Float32) : Float32
  i = pointerof(x).as(Int32*).value
  i = 0x5f3759df - (i >> 1)
  y = pointerof(i).as(Float32*).value
  y * (1.5 - 0.5 * x * y * y)
end

while line = gets
  puts fastinvsqrt(line.to_f32)
end
```

### Rust
There are `f32::to_bits`, `f32::from_bits` to convert the number types keeping the bits.
```rust
use std::io::BufRead;

fn fast_inv_sqrt(x: f32) -> f32 {
    let i = x.to_bits();
    let j = 0x5f3759df - (i >> 1);
    let y = f32::from_bits(j);
    y * (1.5 - 0.5 * x * y * y)
}

fn main() {
    let stdin = std::io::stdin();
    for line in stdin.lock().lines().filter_map(|x| x.ok()) {
        if let Ok(x) = line.parse() {
            println!("{}", fast_inv_sqrt(x));
        }
    }
}
```

### Perl
The pack and unpack is useful in this challenge for scripting languages (PHP, Ruby, Python etc).
Somehow the speed of this code is crazy fast on the Travis test.
```perl
use strict;
use warnings;
use feature qw(say);

while (<>) {
  say fastInvSqrt($_);
}

sub fastInvSqrt {
  my ($x) = @_;
  my $i = unpack("l", pack("f", $x));
  $i = 0x5f3759df - ($i >> 1);
  my $y = unpack("f", pack("l", $i));
  $y * (1.5 - 0.5 * $x * $y * $y);
}
```

### JavaScript
I thought it is impossible to implement in this language.
There's no difference between float and integer, 32-bit and 64-bit.
However, JavaScript has TypedArray, which we can read and write the numbers in specific bit widths.
```javascript
require('readline').createInterface({
    input: process.stdin,
    output: process.null
}).on('line', function(line) {
    console.log(fastInvSqrt(parseFloat(line)));
});

function fastInvSqrt(x) {
    var i = floatToUInt32(x);
    i = 0x5f3759df - (i >> 1);
    var y = uint32ToFloat(i);
    return y * (1.5 - 0.5 * x * y * y);
}

function floatToUInt32(x) {
    var buf = new ArrayBuffer(4);
    new Float32Array(buf)[0] = x;
    return new Uint32Array(buf)[0];
}

function uint32ToFloat(i) {
    var buf = new ArrayBuffer(4);
    new Uint32Array(buf)[0] = i;
    return new Float32Array(buf)[0];
}
```

### J
Just difficult to write, difficult to read.
```j
fastInvSqrt =: 3 : 0
  i =. _2 ic 1 fc y
  i =. (dfh'5f3759df') - _1 (33 b.) i
  z =. _1 fc 2 ic i
  z * (1.5 - 0.5 * y * z * z)
)

echo & fastInvSqrt & (0 & ".) & (-. & CRLF) ;. 2 &. stdin ''
exit ''
```

### F# #
F# is a .NET language so looking through the MSDN document gave me the way to convert to/from the byte arrays.
```fsharp
let fastinvsqrt(x: float32): float32 =
    let i = System.BitConverter.ToInt32(System.BitConverter.GetBytes(x), 0)
    let j = 0x5f3759df - (i >>> 1)
    let y = System.BitConverter.ToSingle(System.BitConverter.GetBytes(j), 0)
    y * (1.5F - 0.5F * x * y * y)

seq { while true do yield stdin.ReadLine() }
    |> Seq.takeWhile ((<>) null)
    |> Seq.iter (fun x -> try float32 x |> fastinvsqrt |> printfn "%f"
                          with :? System.FormatException -> ())
```

### Haskell
Haskell is a functional programming language with advanced features of type system mainly for the research of this field.
But it also provides an interface to read and write pointers.
```haskell
import Control.Monad ((<=<))
import Data.Bits (shiftR)
import Data.Traversable (mapM)
import Data.Word (Word32)
import Foreign.Marshal.Alloc (alloca)
import Foreign.Ptr (castPtr)
import Foreign.Storable (peek, poke)
import Prelude hiding (mapM)
import Text.Read (readMaybe)

main :: IO ()
main = mapM_ (mapM (print <=< fastInvSqrt) . readMaybe) . lines =<< getContents

fastInvSqrt :: Float -> IO Float
fastInvSqrt x =
  alloca $ \ptr -> do
    poke ptr x
    i <- peek (castPtr ptr)
    poke (castPtr ptr) $ 0x5f3759df - (i :: Word32) `shiftR` 1
    y <- peek ptr
    return $ y * (1.5 - 0.5 * x * y * y)
```

### Erlang
How cool the binary pattern match is.
I have never experienced this language but I think I want to learn more.
The tests on Travis show that the performance of this code is bad.
If you have any idea of improving the performance, please let me know from the issue tracker.
```erlang
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
```

## Author
itchyny (https://github.com/itchyny)

Some codes were written by other people. Thank you so much.
- The credit of the Smalltalk version goes to sumim [#2](https://github.com/itchyny/fastinvsqrt/pull/2).
