module Main where

import Prelude
import Control.Monad.Eff.Console (log)
import Control.Plus (empty)
import Data.List (List(..), filter, head)
import Data.Maybe (Maybe)


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

type AddressBook = List Entry

addressBook :: AddressBook
addressBook = empty


addressStr :: Address -> String
addressStr address = "#" <> address.doorNumber <> ", " <> address.street <> ", " <>
            address.city <> ", " <> address.state

entryStr :: Entry -> String
entryStr entry = entry.firstName <> ", " <> entry.lastName <> " " <> addressStr address

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry entry book = Cons entry book

address :: Address
address = {doorNumber:"90", street: "1st main 12th cross Blah Blah Residency",
                  city: "Bengaluru", state: "Karnataka"}

entry :: Entry
entry = {firstName : "Prasanna" , lastName : "L S", address : address}

addressBook1 :: AddressBook
addressBook1 = insertEntry entry addressBook

findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry fName lName addBook = head $ filter filterNames addressBook1 where
    filterNames :: Entry -> Boolean
    filterNames entry = entry.firstName == fName && entry.lastName == lName


-- | main = log "Hello World"
-- | main = log (map entryStr (findEntry "Prasanna" "L S" addressBook1)) 
