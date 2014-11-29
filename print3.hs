import System.Random

randAlpha = getStdRandom $ randomR ('A', 'Z')

test = do
    r <- randAlpha
    -- print r
    return r

main = return "hello"
    print =<< test
    print "hello"
    test
    test
    test
    test
