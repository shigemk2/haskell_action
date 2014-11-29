qsort []     = return []
qsort (n:xs) = do
   lt   <- qsort [x | x <- xs, x <  n]
   gteq <- qsort [x | x <- xs, x >= n]
   return $ lt ++ [n] ++ gteq

main = do
    print =<< qsort [4, 6, 9, 8, 3, 5, 1, 7, 2]
