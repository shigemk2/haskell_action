-- returnの注意点 returnは単にそういう名前の関数で、C言語のように関数から抜ける機能はありません。後ろにコードがあれば、抜けずにそのまま続行します。
main = do
    print "abc"
    return 1    -- 素通り
    print "def" -- 実行される
    return 3    -- 戻り値

