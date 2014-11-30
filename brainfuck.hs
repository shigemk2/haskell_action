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
    let bf = "+++++++++[++++++++]>."
    pc <- newArray (0, 30000) 0 :: IO (IOUArray Int Int)
    jmp <- newArray (0, length bf + 1) 0 :: IO (IOUArray Int Int)
    let loops = []

    -- let scanbf i | (bf !! i) == '[' = do
    --       loops ++ [i]
    --       -- a <- readArray pc 0
    --       -- writeArray pc 0 (a + 1)
    -- -- let scanbf i | (bf !! i) == ']' = do
    -- --       putChar $ toEnum $ fromIntegral $ readArray pc 0
    -- let scanbf _ =  putChar $ toEnum 108

    -- let loop i | i < length bf = do
    --       print $ bf !! i
    --       -- jmp i
    --       loop $ i + 1
    --     loop _ = return ()
    -- loop 0


    -- let jmppush s i | i < length bf && (bf !! i) == '[' = jmppush (i : s) (i + 1)
    --     jmppush s i | i < length bf = jmppush s (i + 1)
    --     jmppush s _ = s

    -- let loops = jmppush [] 0
    -- let start = loops !! 0
    -- print start

    -- let jmppop s i j | i < length bf && (bf !! i) == ']' = do
    --       let start = loops !! j
    --       writeArray s start i
    --       writeArray s i start
    --       jmppop s (i + 1) (j + 1)
    --     jmppop s i j | i < length bf = jmppop s (i + 1) j
    --     jmppop s _ _ = s
    -- jmppop jmp 0 0
    -- print =<< getElems jmp

    let loop i loops | i < length bf = do
          case bf !! i of
            '[' -> do
              loop (i + 1) (i:loops)
            ']' -> do
              let (start:loops') = loops
              writeArray jmp start i
              writeArray jmp i start
              loop (i + 1) loops'
            _ -> do
              loop (i + 1) loops
        loop _ _ = return ()
    loop 0 []
    print =<< getElems jmp
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
