module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Maybe (Maybe(..))
import Data.Array ((!!))

newtype N = N Node

type Node =
  {
    dat :: Int,
    right :: Maybe N,
    left :: Maybe N
  }

inOrder Nothing = log ""
inOrder (Just node) = do
  _ <- inOrder (node.left)
  _ <- log $ show $ node.dat
  inOrder (node.right)

bfs node = bfsTrav $ [] <> [node.left] <> [node.right]

bfsTrav [] = void
bfsTrav arr = nodeProcess $ arr !! 0

nodeProcess Nothing = log ""
nodeProcess (Just n) = log $ (show $ n.dat)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log "Hello sailor!"
