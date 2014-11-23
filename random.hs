import System.Random

randAlpha = getStdRandom $ randomR ('A', 'Z')

-- doブロック全体で1つのアクションを構成します。testには引数がないため関数ではなく、アクションが束縛された変数
test = do
    r <- randAlpha
    print r

main = do
  r <- randAlpha
  print r
  print =<< randAlpha
  randAlpha >>= print

  -- letを使っても、値を取り出すには依然として<-などを使う必要があります
  print "-----------------------"
  let r = randAlpha
  r' <- r
  print r'
  print =<< r
  r >>= print

  -- main以外でdoを使って、mainから呼び出せます。
  print "-----------------------"
  test
  test
  test
