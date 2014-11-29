import Control.Applicative

inc x   = x + 1
add x y = x + y

main = do
    -- アクションから値を取り出して関数に引数として渡す
    -- 関数の戻り値をアクションに閉じ込める
    print =<< inc <$> return 1
    print =<< add <$> return 1 <*> return 2
    -- アクションではない関数にしか渡せない
    -- print <$> inc <$> return 1
    -- print <$> add <$> return 1 <*> return 2
