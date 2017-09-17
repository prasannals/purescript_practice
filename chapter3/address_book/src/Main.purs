module Main where

import Prelude
import Control.Monad.Eff.Console (log)

type Address = {
  doorNumber :: String,
  street     :: String,
  city       :: String,
  state      :: String
}

type Entry = {
  firstName :: String,
  lastName  :: String,
  address   :: Address
}

addressStr :: Address -> String
addressStr address = "#" <> address.doorNumber <> ", " <> address.street <> ", " <>
            address.city <> ", " <> address.state

entryStr :: Entry -> String
entryStr entry = entry.firstName <> ", " <> entry.lastName <> " " <> addressStr address


address :: Address
address = {doorNumber:"90", street: "1st main 12th cross Blah Blah Residency",
                  city: "Bengaluru", state: "Karnataka"}

entry :: Entry
entry = {firstName : "Prasanna" , lastName : "L S", address : address}

main = log (entryStr entry)
