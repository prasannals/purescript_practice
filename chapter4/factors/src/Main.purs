module Main where

import Prelude
import Data.Array
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Maybe
import Data.Foldable

pairs :: Int -> Array (Array Int)
pairs n = concatMap (\i -> map (\j -> [i,j]) (i .. n) ) (1 .. n)

num :: Int
num = 12

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log $ show  $ filter (\p -> (product p == num) ) $ pairs num
