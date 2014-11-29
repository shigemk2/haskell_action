import System.Random

randAlpha = getStdRandom $ randomR ('A', 'Z')

test = do
    r <- randAlpha
    -- print r
    return r

main = do
    -- print "hello"
    test
    test
    test
    test
    -- print =<< test
    return ()
