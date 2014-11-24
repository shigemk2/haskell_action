import System.Random

shuffle :: [Int] -> [Int]
shuffle xs =
    [ x * 2 | x <- xs]

main = do
    print $ shuffle [1..9]
-- main = do
--     print =<< shuffle [1..9]
