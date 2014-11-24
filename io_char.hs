import System.Random

-- 型注釈がなくてもたいていは動くけど、動かない場合もある
randAlpha :: IO Char
randAlpha = getStdRandom $ randomR ('A', 'Z')
-- randAlpha = getStdRandom $ randomR ('A', 'Z') :: IO Char
main = do
  r <- randAlpha
  print r
  print =<< randAlpha
  randAlpha >>= print
