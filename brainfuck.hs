import Data.Array.IO
main = do
    -- let bf = ">+++++++++[<++++++++>-]<.>+++++++[<++++>" ++
    --          "-]<+.+++++++..+++.[-]>++++++++[<++++>-]<" ++
    --          ".>+++++++++++[<+++++>-]<.>++++++++[<+++>" ++
    --          "-]<.+++.------.--------.[-]>++++++++[<++" ++
    --          "++>-]<+.[-]++++++++++."
    let bf = "++++++++++++++++++++++++++++++" ++
             "++++++++++++++++++++++++++++++" ++
             "++++++++++++."

    pc <- newArray (0, 30000) 0 :: IO (IOUArray Int Int)
    let loop i xs | i < length bf = do
          print $ bf !! i
          loop (i + 1) bf
        loop _ _ = return ()
    loop 0 bf
    -- putChar 'A'
    print $ fromIntegral $ 72
    putChar $ toEnum $ 72
