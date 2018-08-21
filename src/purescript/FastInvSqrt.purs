module Main where

import Data.ArrayBuffer.ArrayBuffer (create)
import Data.ArrayBuffer.DataView (whole, getInt32be, getFloat32be, setInt32be, setFloat32be)
import Data.Int.Bits (shr)
import Data.Maybe (fromJust)
import Effect (Effect)
import Effect.Console (logShow)
import Global (readFloat)
import Node.Process (stdin)
import Node.ReadLine (setLineHandler, createInterface)
import Partial.Unsafe (unsafePartial)
import Prelude

main :: Effect Unit
main = do
  interface <- createInterface stdin mempty
  setLineHandler interface $ \line ->
    logShow =<< fastInvSqrt (readFloat line)

fastInvSqrt :: Number -> Effect Number
fastInvSqrt x = do
  i <- floatToUInt32 x
  let j = 0x5f3759df - unsafePartial i `shr` 1
  y <- uint32ToFloat j
  pure $ y * (1.5 - 0.5 * x * y * y)

floatToUInt32 :: Number -> Effect Int
floatToUInt32 x = do
  dataView <- map whole $ create 4
  setFloat32be dataView x 0
  unsafePartial $ map fromJust $ getInt32be dataView 0

uint32ToFloat :: Int -> Effect Number
uint32ToFloat i = do
  dataView <- map whole $ create 4
  setInt32be dataView i 0
  unsafePartial $ map fromJust $ getFloat32be dataView 0
