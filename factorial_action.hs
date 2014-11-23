fact n = do
  if n <= 0
     then return 1
     else do
       m <- fact (n - 1)
       return $ n * m

main = do
  print =<< fact 5

