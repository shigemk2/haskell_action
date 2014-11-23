-- doと組み合わせれば、printなどを使って最後にreturnする関数が作れます
-- returnは単にそういう名前の関数で、C言語のように関数から抜ける機能はありません。後ろにコードがあれば、抜けずにそのまま続行します
add x y = do
    print x
    print y
    return $ x + y

main = do
    print =<< add 1 2
