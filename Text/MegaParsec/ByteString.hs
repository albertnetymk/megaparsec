-- |
-- Module      :  Text.MegaParsec.ByteString
-- Copyright   :  © 2015 MegaParsec contributors
--                © 2007 Paolo Martini
-- License     :  BSD3
--
-- Maintainer  :  Mark Karpov <markkarpov@opmbx.org>
-- Stability   :  experimental
-- Portability :  portable
--
-- Convenience definitions for working with 'C.ByteString's.

module Text.MegaParsec.ByteString
    ( Parser
    , GenParser
    , parseFromFile )
where

import Text.MegaParsec.Error
import Text.MegaParsec.Prim

import qualified Data.ByteString.Char8 as C

-- | Different modules corresponding to various types of streams (@String@,
-- @Text@, @ByteString@) define it differently, so user can use \"abstract\"
-- @Parser@ type and easily change it by importing different \"type
-- modules\".

type Parser = Parsec C.ByteString ()

-- | @GenParser@ is similar to @Parser@ but it's parametrized over user
-- state type.

type GenParser t st = Parsec C.ByteString st

-- | @parseFromFile p filePath@ runs a strict bytestring parser @p@ on the
-- input read from @filePath@ using 'ByteString.Char8.readFile'. Returns
-- either a 'ParseError' ('Left') or a value of type @a@ ('Right').
--
-- > main = do
-- >   result <- parseFromFile numbers "digits.txt"
-- >   case result of
-- >     Left err -> print err
-- >     Right xs -> print (sum xs)

parseFromFile :: Parser a -> String -> IO (Either ParseError a)
parseFromFile p fname = runParser p () fname <$> C.readFile fname
