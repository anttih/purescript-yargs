module Node.Yargs.Setup 
  ( YargsSetup()
  , usage
  , example
  , alias
  , demand
  , demandCount
  , command
  , requiresArg
  , describe
  , boolean
  , string
  , config
  , wrap
  , strict
  , help
  , version
  , showHelpOnFail
  ) where

import Data.Monoid
import Data.Foreign.EasyFFI

import Control.Monad.Eff

foreign import data YargsSetup :: *

instance semigroupYargsSetup :: Semigroup YargsSetup where
  (<>) = unsafeForeignFunction ["s1", "s2", "y"] "s2(s1(y))"

instance monoidYargsSetup :: Monoid YargsSetup where
  mempty = unsafeForeignFunction ["y"] "y"

usage :: String -> YargsSetup
usage = unsafeForeignFunction ["msg", "y"] "y.usage(msg)"

example :: String -> String -> YargsSetup
example = unsafeForeignFunction ["cmd", "desc", "y"] "y.example(cmd, desc)"

alias :: String -> String -> YargsSetup
alias = unsafeForeignFunction ["key", "alias", "y"] "y.alias(key, alias)"

command :: String -> String -> YargsSetup
command = unsafeForeignFunction ["cmd", "msg", "y"] "y.command(cmd, msg)"

demand :: String -> String -> YargsSetup
demand = unsafeForeignFunction ["key", "msg", "y"] "y.demand(key, msg)"

demandCount :: Number -> YargsSetup
demandCount = unsafeForeignFunction ["count", "y"] "y.demand(count)"

requiresArg :: String -> YargsSetup
requiresArg = unsafeForeignFunction ["key", "y"] "y.requiresArg(key)"

describe :: String -> String -> YargsSetup
describe = unsafeForeignFunction ["key", "desc", "y"] "y.describe(key, desc)"

boolean :: String -> YargsSetup
boolean = unsafeForeignFunction ["key", "y"] "y.boolean(key)"

string :: String -> YargsSetup
string = unsafeForeignFunction ["key", "y"] "y.string(key)"

config :: String -> YargsSetup
config = unsafeForeignFunction ["key", "y"] "y.config(key)"

wrap :: Number -> YargsSetup
wrap = unsafeForeignFunction ["cols", "y"] "y.wrap(cols)"

strict :: YargsSetup
strict = unsafeForeignFunction ["y"] "y.strict()"

help :: String -> String -> YargsSetup
help = unsafeForeignFunction ["key", "desc"] "y.help(key, desc)"

version :: String -> String -> String -> YargsSetup
version = unsafeForeignFunction ["version", "key", "desc", "y"] "y.version(version, key, desc)"

showHelpOnFail :: Boolean -> String -> YargsSetup
showHelpOnFail = unsafeForeignFunction ["enable", "msg", "y"] "y.showHelpOnFail(enable, msg)"
