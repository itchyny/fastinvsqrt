module Main where

import Data.ArrayBuffer.DataView (whole, getInt32le, getFloat32le)
import Data.ArrayBuffer.Typed (buffer, fromArray)
import Data.ArrayBuffer.Types (Float32Array, Int32Array)
import Data.Float32 (fromNumber', toNumber)
import Data.Int.Bits (shr)
import Data.Maybe (fromJust)
import Data.Number (fromString)
import Effect (Effect)
import Effect.Console (logShow)
import Node.Process (stdin)
import Node.ReadLine (setLineHandler, createInterface)
import Partial.Unsafe (unsafePartial)
import Prelude

main :: Effect Unit
main = do
  interface <- createInterface stdin mempty
  flip setLineHandler interface $ \line ->
    logShow =<< fastInvSqrt (unsafePartial $ fromJust $ fromString line)

fastInvSqrt :: Number -> Effect Number
fastInvSqrt x = do
  i <- floatToUInt32 x
  let j = 0x5f3759df - unsafePartial i `shr` 1
  y <- uint32ToFloat j
  pure $ y * (1.5 - 0.5 * x * y * y)

floatToUInt32 :: Number -> Effect Int
floatToUInt32 x = do
  dataView <- whole <$> buffer <$> (fromArray [fromNumber' x] :: Effect Float32Array)
  unsafePartial $ fromJust <$> getInt32le dataView 0

uint32ToFloat :: Int -> Effect Number
uint32ToFloat i = do
  dataView <- whole <$> buffer <$> (fromArray [i] :: Effect Int32Array)
  unsafePartial $ toNumber <$> fromJust <$> getFloat32le dataView 0
