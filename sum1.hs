import Data.IORef

main = do
    s <- newIORef 0
    let sum i | i <= 100 = do
            s' <- readIORef s
            writeIORef s $ s' + i
            sum $ i + 1
        sum _ = readIORef s
    print =<< sum 0
