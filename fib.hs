import System.Environment(getArgs)

fib :: Int -> Integer
fib x = if x < 2 then 1 else fib (x - 1) + fib (x - 2)

main = putStrLn . show . fib . read . head =<< getArgs
