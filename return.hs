main = do
  a <- return 1
  print a
  print =<< return 2
  return 3 >>= print
  -- let a = return 1
  -- print a -- エラー
  let a = return 1
  a' <- a
  print a'
  print =<< a
  a >>= print
