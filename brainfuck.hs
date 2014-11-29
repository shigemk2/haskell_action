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

    let brainfuck i | (bf !! i) == '+' = do
          a <- readArray pc 0
          writeArray pc 0 (a + 1)
    let brainfuck i | (bf !! i) == '.' = do
          putChar $ toEnum $ fromIntegral $ readArray pc 0
    let brainfuck _ =  putChar $ toEnum 108

    let loop i | i < length bf = do
          print $ bf !! i
          brainfuck i
          loop $ i + 1
        loop _ = return ()
    loop 0

    -- putChar 'A'
    print $ fromIntegral $ 72
    putChar $ toEnum $ 72
