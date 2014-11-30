import System.IO.Unsafe

fact 0 = unsafePerformIO $ do
    putStrLn "fact 0 = 1"
    return 1
fact n | n > 0 = unsafePerformIO $ do
    let dbg = "fact " ++ show n ++ " = " ++
              show n ++ " * fact " ++ show (n - 1)
    putStrLn dbg
    let n' = fact (n - 1)
    let ret = n * n'
    putStrLn $ dbg ++ " = " ++ show n ++ " * " ++ show n' ++ " = " ++ show ret
    return ret

main = do
    print $ fact 5

-- 階乗
-- fact 0 = do
--     print "fact 0 = 1"
--     return 1
-- fact n | n > 0 = do
--     let dbg = "fact " ++ show n ++ " = " ++
--               show n ++ " * fact " ++ show (n - 1)
--     print dbg
--     n' <- fact (n - 1)
--     let ret = n * n'
--     print $ dbg ++ " = " ++ show n ++ " * " ++ show n' ++ " = " ++ show ret
--     return ret

-- main = do
--     print =<< fact 5

