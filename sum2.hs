main = do
    let sum s i | i <= 100 =
            sum (s + i) (i + 1)
        sum s _ = s
    print $ sum 0 1
