module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Array
import Data.Maybe
import Partial.Unsafe (unsafePartial)

arr :: Array Int
arr = 1..10

cnv :: Maybe Int -> Int
cnv (Just a) = a
cnv Nothing = 0

main = log $ show $ cnv $ arr !! 0
