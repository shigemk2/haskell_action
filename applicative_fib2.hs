import Control.Applicative

fib 0 = return 0
fib 1 = return 1
-- doは2行以上の処理に必要
fib n | n > 1 =
    -- let a = fib (n - 2)
    -- let b = fib (n - 1)
    -- add <$> a <*> b
    -- 演算子の関数化
    (+) <$> fib (n - 2) <*> fib (n - 1)

-- add a b = a + b

main = do
    print =<< fib 7
