module Main where

import Prelude
import Control.Monad.Eff.Console (log)


type Person = {name :: String, age :: Int}

p :: Person
p = {name:"Prasanna", age:18}

personToStr :: Person -> String
personToStr pr = "Name : " <> pr.name <> "\nAge : " <> show pr.age

main = log $ personToStr p
