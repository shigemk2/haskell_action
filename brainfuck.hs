import Data.Array.IO
import Data.Word
import Data.Char
main = do
    let bf = ">+++++++++[<++++++++>-]<.>+++++++[<++++>" ++
             "-]<+.+++++++..+++.[-]>++++++++[<++++>-]<" ++
             ".>+++++++++++[<+++++>-]<.>++++++++[<+++>" ++
             "-]<.+++.------.--------.[-]>++++++++[<++" ++
             "++>-]<+.[-]++++++++++."
    -- let bf = "++++++++++++++++++++++++++++++" ++
    --          "++++++++++++++++++++++++++++++" ++
    --          "++++++++++++."
    -- let bf = "+++++++++[>++++++++<-]>."
    jmp <- newArray (0, length bf + 1) 0 :: IO (IOUArray Int Int)
    let loops = []

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
    -- print =<< getElems jmp

    m <- newArray (0, 30000) 0 :: IO (IOUArray Int Word8)
    let scanbf pc r | pc < length bf = do
          -- print pc
          case bf !! pc of
            '+' -> do
              a <- readArray m r
              writeArray m r (a + 1)
              scanbf (pc + 1) r
            '-' -> do
              a <- readArray m r
              writeArray m r (a - 1)
              scanbf (pc + 1) r
            '>' -> do
              scanbf (pc + 1) (r + 1)
            '<' -> do
              scanbf (pc + 1) (r - 1)
            '.' -> do
              a <- readArray m r
              -- Word8を変換するためのfromIntegral
              putChar $ toEnum $ fromIntegral $ a
              -- putChar $ chr $ a
              scanbf (pc + 1) r
            '[' -> do
              a <- readArray m r
              if a == 0
              then do
                pc <- readArray jmp pc
                scanbf (pc + 1) r
              else do
                scanbf (pc + 1) r
            ']' -> do
              a <- readArray m r
              if a /= 0
              then do
                pc <- readArray jmp pc
                scanbf pc r
              else do
                scanbf (pc + 1) r
            _ -> do
              scanbf (pc + 1) r
        scanbf _ _ = return ()
    scanbf 0 0

