module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Array

-- | Squaring an array of numbers
-- |sqr :: Int -> Int -> Array Int
-- |sqr start end = arrInt where
-- |    arrInt = map (\n -> n * n) (start .. end)
-- |
-- |
-- |main :: forall e. Eff (console :: CONSOLE | e) Unit
-- |main = do
-- |  log $ show $ sqr 1 100



-- | Filtering negative numbers out of an array
-- |main :: forall e. Eff (console :: CONSOLE | e) Unit
-- |main = do
-- |   log $ show $ filter (\n -> (n >= 0)) (-9 .. 10)



-- | Defining infix synonym for filter and filtering -ve numbers
-- | syntax :
-- | infix precedence funcName as symbol

infix 8 filter as <$?>

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
   log $ show $ (\n -> (n >= 0)) <$?> (-9 .. 10)
