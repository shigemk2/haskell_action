import Data.IORef

main = do
    i <- newIORef 0
    let loop = do
        i' <- readIORef i
        if i' < 5
            then do
                print i'
                writeIORef i $ i' + 1
                loop
            else return ()
    loop
