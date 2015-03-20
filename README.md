# memoize

A tiny example of how to memoize a function in Haskell.

1.  First read [fib.hs](fib.hs).

    Here, it's short, I'll just reproduce the whole thing here.

    ```haskell
    import System.Environment(getArgs)

    fib :: Int -> Integer
    fib x = if x < 2 then 1 else fib (x - 1) + fib (x - 2)

    main = putStrLn . show . fib . read . head =<< getArgs
    ```

2.  If you like, compile it and run it.

        $ ghc -O fib
        [1 of 1] Compiling Main             ( fib.hs, fib.o )
        Linking fib ...
        $ ./fib 0
        1
        $ ./fib 1
        1
        $ ./fib 2
        2
        $ ./fib 3
        3
        $ ./fib 4
        5
        $ ./fib 5
        8

    On my computer, `./fib 38` takes about five seconds to run,
    even when I compile with optimizations enabled.

    (In fact, if you time `./fib 35`, `./fib 36`, `./fib 37`, and so on,
    your measurements, in seconds, might just turn out to be
    the Fibonacci sequence as well!)

3.  Then read [memoized_fib.hs](memoized_fib.hs).

    ```haskell
    import System.Environment(getArgs)
    import MyMemoize(memoize)

    fib :: Int -> Integer
    fib = memoize (\x -> if x < 2 then 1 else fib (x - 1) + fib (x - 2))

    main = putStrLn . show . fib . read . head =<< getArgs
    ```

4.  Try running it.

        ghc -O memized_fib
        ./memoized_fib 38
        ./memoized_fib 39
        ./memoized_fib 45
        ./memoized_fib 1000
        ./memoized_fib 10000

5.  Reflect.

    `memoize` works by caching the results when you call the function.
    But how is that possible in a purely functional language like Haskell?

    If you know a bit about Haskell, you might imagine `memoize` uses
    `unsafePerformIO` to populate and query the cache. **It doesn't.**

    Where does that leave us?

Answers: [MyMemoize.hs](MyMemoize.hs)
