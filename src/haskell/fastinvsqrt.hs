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
