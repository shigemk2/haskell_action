import Data.IORef

-- 値を変更することが出来る
main = do
    a <- newIORef 1
    b <- readIORef a
    writeIORef a 2
    print =<< readIORef a
    print b
