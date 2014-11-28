import System.Random

shuffle [] = return []
shuffle xs = do
    n <- getStdRandom $ randomR (0, length xs - 1) :: IO Int
    xs' <- shuffle $ take n xs ++ drop (n + 1) xs
    return $ (xs !! n) : xs'

sort [] = True
sort [x] = True
sort (x:y:xs)
  | x < y     = sort (y:xs)
  | otherwise = False

bogosort xs = do
  xs' <- shuffle xs
  if sort xs' == True
  then return xs'
  else bogosort xs'

main = do
    xs <- shuffle [1..9]
    print xs
    print =<< bogosort xs
