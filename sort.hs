sort [] = True
sort [x] = True
sort (x:y:xs)
  | x < y     = sort (y:xs)
  | otherwise = False

main = do
  print $ sort [1,2,3,4,5]
  print $ sort [1,2,3,5,4]
  print $ sort [1,2,3,5,4,6]
  print $ sort [1,2,3,4,5,6]
