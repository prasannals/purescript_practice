module Main where

import Prelude
import Control.Monad.Eff.Console (log)

rotationDisp :: Number -> Number -> Number -> Number -> Number
rotationDisp t acc decel k = max 0.0 res where
      res = t * t * (acc - (t * decel)) * k
