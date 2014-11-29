inc x = return $ x + 1

main = do
    return 2 >>= inc >>= print
    print =<< inc =<< return 2
    print =<< inc 2

-- この例は2箇所間違っている
-- 一度アクションを使うと戻り値も渡すのもアクションでなければならない
-- inc x = x + 1

-- main = do
--     print $ inc =<< return 2
