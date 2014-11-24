-- returnは合わせる
fact :: Int -> IO Int
fact 0 = return 1
fact n | n > 0 = do
  m <- fact (n - 1)
  return $ n * m

main = do
  print =<< fact 10
  -- 自動で多倍長にしてくれるからこんな無茶な計算でもよい
  print =<< fact 100000
  -- マイナスの階乗はマッチしない
  -- print =<< fact (-10)

