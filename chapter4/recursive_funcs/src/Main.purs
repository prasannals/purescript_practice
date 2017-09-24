module Main where

import Prelude
import Data.Array
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)


main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log $ ( show $ arr ) <> "\n" <> (show $ filtArr) where
    arr = (\n -> fib n) `map` (1 .. 10)
    filtArr = filter (\n -> (n > 10)) arr
