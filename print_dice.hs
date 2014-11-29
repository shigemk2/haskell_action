import System.Random

dice :: IO Int
dice = getStdRandom $ randomR (1, 6)

showDice = do
    d <- dice
    print d
    return d

main = do
    showDice
    showDice
    print =<< showDice
