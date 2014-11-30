import Data.Array.IO
main = do
    -- let bf = ">+++++++++[<++++++++>-]<.>+++++++[<++++>" ++
    --          "-]<+.+++++++..+++.[-]>++++++++[<++++>-]<" ++
    --          ".>+++++++++++[<+++++>-]<.>++++++++[<+++>" ++
    --          "-]<.+++.------.--------.[-]>++++++++[<++" ++
    --          "++>-]<+.[-]++++++++++."
    -- let bf = "++++++++++++++++++++++++++++++" ++
    --          "++++++++++++++++++++++++++++++" ++
    --          "++++++++++++."
    let bf = "+++++++++[++++++++-]>."
    pc <- newArray (0, 30000) 0 :: IO (IOUArray Int Int)
    jmp <- newArray (0, 30000) 0 :: IO (IOUArray Int Int)
    let loops = []

    let scanbf i | (bf !! i) == '[' = do
          loops ++ [i]
          -- a <- readArray pc 0
          -- writeArray pc 0 (a + 1)
    -- let scanbf i | (bf !! i) == ']' = do
    --       putChar $ toEnum $ fromIntegral $ readArray pc 0
    let scanbf _ =  putChar $ toEnum 108

    let loop i | i < length bf = do
          print $ bf !! i
          -- jmp i
          loop $ i + 1
        loop _ = return ()
    loop 0


    let jmp s i | i < length bf =
            if (bf !! i) == '['
            then jmp (i : s) (i + 1)
            else jmp s (i + 1)
        jmp s _ = s
    print $ jmp [] 0

    -- let brainfuck i | (bf !! i) == '+' = do
    --       a <- readArray pc 0
    --       writeArray pc 0 (a + 1)
    -- let brainfuck i | (bf !! i) == '.' = do
    --       putChar $ toEnum $ fromIntegral $ readArray pc 0
    -- let brainfuck _ =  putChar $ toEnum 108

    -- let loop i | i < length bf = do
    --       print $ bf !! i
    --       brainfuck i
    --       loop $ i + 1
    --     loop _ = return ()
    -- loop 0

    -- -- putChar 'A'
    -- print $ fromIntegral $ 72
    -- putChar $ toEnum $ 72
