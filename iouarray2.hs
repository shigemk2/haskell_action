import Data.Array.IO

main = do
    a <- newArray (0, 2) 0 :: IO (IOUArray Int Int)
    print =<< getElems a
    writeArray a 3 3
    print =<< getElems a
