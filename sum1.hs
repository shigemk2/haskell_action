import Data.IORef

main = do
    i <- newIORef 0
    s <- newIORef 0
    let loop = do
        i' <- readIORef i
        s' <- readIORef s
        if i' <= 100
            then do
                writeIORef i $ i' + 1
                writeIORef s $ s' + i'
                loop
            else readIORef s
    print =<< loop
