import System.Random

randAlpha = getStdRandom $ randomR ('A', 'Z')

main = do
  r <- randAlpha
  print r
  print =<< randAlpha
  randAlpha >>= print

  -- letを使っても、値を取り出すには依然として<-などを使う必要があります
  let r = randAlpha
  r' <- r
  print r'
  print =<< r
  r >>= print
