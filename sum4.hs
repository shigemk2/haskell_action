main = do
    let sum s i = i : s
        sum s _ = s
    let loops = sum [] 1
    print $ loops
    print $ sum loops 2
    let loops = sum loops 2
    print $ loops
    print $ sum loops 2
