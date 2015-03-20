module MyMemoize(memoize) where

memoize :: (Int -> a) -> (Int -> a)
memoize f = (map f [0..] !!)
