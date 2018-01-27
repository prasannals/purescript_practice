module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Partial.Unsafe (unsafePartial)
import Data.Array
import Data.Maybe (fromJust)

getElement :: Array (Int) -> Int -> Int
getElement arr idx = unsafePartial $ fromJust $ (arr !! idx)

pivotLeft :: Array (Int) -> Int -> Array (Int)
pivotLeft arr piv = filter (\x -> x <= piv) arr

pivotRight :: Array (Int) -> Int -> Array (Int)
pivotRight arr piv = filter (\x -> x > piv) arr



quicksort :: Array (Int) -> Array (Int)
quicksort arr | ((length arr) <= 1) = arr
    | otherwise = left <> [pivot] <> right where
      pivotIdx = (length arr) - 1
      pivot = getElement arr pivotIdx
      leftOfPiv = pivotLeft arr pivot
      rightOfPiv = pivotRight arr pivot
      left = quicksort $ unsafePartial $ fromJust $ init leftOfPiv
      right = quicksort rightOfPiv



-- quicksort :: Array (Int) -> Array (Int)
-- quicksort arr = if ((length arr) <= 1)
--     then arr
--     else (left <> [pivot] <> right) where
--       pivotIdx = (length arr) - 1
--       pivot = getElement arr pivotIdx
--       leftOfPiv = pivotLeft arr pivot
--       rightOfPiv = pivotRight arr pivot
--       left = quicksort $ unsafePartial $ fromJust $ init leftOfPiv
--       right = quicksort rightOfPiv


main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log "Hello sailor!"
