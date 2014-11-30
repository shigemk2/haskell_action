main = do
    let sum s i | i <= 10 =
            sum (i : s) (i + 1)
        sum s _ = s
    print $ sum [] 1
