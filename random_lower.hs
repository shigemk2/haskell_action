import System.Random

randAlpha = getStdRandom $ randomR ('a', 'z')

main = do
  r <- randAlpha
  if r == 'z'
     then do
       print r
       print "end"
     else do
       print r
       main