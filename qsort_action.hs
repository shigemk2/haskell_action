qsort []     = return []
qsort (n:xs) = do
   lt   <- [x | x <- xs, x <  n]
   gteq <- [x | x <- xs, x >= n]
   return qsort lt ++ [n] ++ qsort gteq

main = do
    print =<< qsort [4, 6, 9, 8, 3, 5, 1, 7, 2]
