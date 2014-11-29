qsort []     = []
qsort (n:xs) = qsort lt ++ [n] ++ qsort gteq
    where
        lt   = [x | x <- xs, x <  n]
        gteq = [x | x <- xs, x >= n]

main = do
    print $ qsort [4, 6, 9, 8, 3, 5, 1, 7, 2]
