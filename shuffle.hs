import System.Random

shuffle [] = return []
shuffle xs = do
    n <- getStdRandom $ randomR (0, length xs - 1) :: IO Int
    xs' <- shuffle $ take n xs ++ drop (n + 1) xs
    return $ (xs !! n) : xs'

main = do
    print =<< shuffle [1..15]
