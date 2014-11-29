qsort []     = return []
qsort (n:xs) = do
   let lt = [x | x <- xs, x <  n]
   let gteq = [x | x <- xs, x >= n]
   let dbg  = "qsort " ++ show (n:xs) ++ " = qsort " ++
          show lt ++ " ++ " ++ show [n] ++ " ++ " ++ show gteq
   putStrLn dbg
   l <- qsort lt
   g <- qsort gteq
   return $ l ++ [n] ++ g

main = do
    print =<< qsort [4, 6, 9, 8, 3, 5, 1, 7, 2]
