module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Array
import Data.Foldable (foldr)
import Partial.Unsafe (unsafePartial)
import Data.Maybe

type Contact = {name :: String, number :: String}

insertContact :: (Array Contact) -> String -> String -> (Array Contact)
insertContact contacts name number = newContacts where
    newContact :: Contact
    newContact = {name:name, number:number}
    newContacts = contacts <> [newContact]


contactStr :: Contact -> String
contactStr contact = "Name: " <> contact.name <> ", Number: " <> contact.number

contactsStr :: (Array Contact) -> String
contactsStr contacts = strRes where
  mapped = map contactStr contacts
  strRes = foldr (\s1 s2 -> s1 <> "\n" <> s2) "" mapped


setContact :: (Array Contact) -> Int -> String -> String -> (Array Contact)
setContact contacts index name number = newContacts where
    newContact :: Contact
    newContact = {name:name, number:number}
    newContacts = (take index contacts) <> [newContact] <> (drop (index + 1) contacts)


getContact :: (Array Contact) -> String -> Contact
getContact contacts name = unsafePartial fromJust $ unsafePartial head $ filter (\c -> c.name == name) contacts


main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log $ "Hello world"
