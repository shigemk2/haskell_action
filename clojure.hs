import Data.IORef

counter = do
    c  <- newIORef 0
    return $ do
            c' <- readIORef c
            writeIORef c $ c' + 1
            -- readIORefはアクションなのでreturnする必要はない
            -- return $ readIORef c
            readIORef c

main = do
    f <- counter
    print =<< f
    print =<< f
    print =<< f
    print =<< f
    print =<< f
