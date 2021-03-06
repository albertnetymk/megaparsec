-- |
-- Module      :  Text.MegaParsec
-- Copyright   :  © 2015 MegaParsec contributors
--                © 2007 Paolo Martini
--                © 1999–2001 Daan Leijen
-- License     :  BSD3
--
-- Maintainer  :  Mark Karpov <markkarpov@opmbx.org>
-- Stability   :  experimental
-- Portability :  portable
--
-- This module includes everything you need to get started writing a parser.
--
-- By default this module is set up to parse character data. If you'd like to
-- parse the result of your own tokenizer you should start with the following
-- imports:
--
-- > import Text.MegaParsec.Prim
-- > import Text.MegaParsec.Combinator
--
-- Then you can implement your own version of 'satisfy' on top of the
-- 'tokenPrim' primitive.

module Text.MegaParsec
    (
-- * Parsers
      ParsecT
    , Parsec
    , token
    , tokens
    , runParserT
    , runParser
    , parse
    , parseMaybe
    , parseTest
    , getPosition
    , getInput
    , getState
    , putState
    , modifyState
-- * Combinators
    , (<|>)
    , (<?>)
    , label
    , try
    , unexpected
    , choice
    , many
    , many1
    , skipMany
    , skipMany1
    , count
    , between
    , option
    , optionMaybe
    , optional
    , sepBy
    , sepBy1
    , endBy
    , endBy1
    , sepEndBy
    , sepEndBy1
    , chainl
    , chainl1
    , chainr
    , chainr1
    , eof
    , notFollowedBy
    , manyTill
    , lookAhead
    , anyToken
-- * Character parsing
    , oneOf
    , noneOf
    , spaces
    , space
    , newline
    , crlf
    , endOfLine
    , tab
    , upper
    , lower
    , alphaNum
    , letter
    , digit
    , hexDigit
    , octDigit
    , char
    , anyChar
    , satisfy
    , string
-- * Error messages
    , ParseError
    , errorPos
-- * Position
    , SourcePos
    , SourceName, Line, Column
    , sourceName, sourceLine, sourceColumn
    , incSourceLine, incSourceColumn
    , setSourceLine, setSourceColumn, setSourceName
-- * Low-level operations
    , tokenPrim
    , unknownError
    , sysUnExpectError
    , mergeErrorReply
    , getParserState
    , setParserState
    , updateParserState
    , Stream (..)
    , runParsecT
    , mkPT
    , Consumed (..)
    , Reply (..)
    , State (..)
    , setPosition
    , setInput )
where

import Text.MegaParsec.Char
import Text.MegaParsec.Combinator
import Text.MegaParsec.Error
import Text.MegaParsec.Pos
import Text.MegaParsec.Prim
