
module Bugs.Bug2 (main) where

import Test.HUnit hiding (Test)
import Test.Framework
import Test.Framework.Providers.HUnit

import Text.MegaParsec
import Text.MegaParsec.Language (haskellDef)
import qualified Text.MegaParsec.Token as P

main :: Test
main =
  testCase "Control Char Parsing (#2)" $
  parseString "\"test\\^Bstring\"" @?= "test\^Bstring"
 where
   parseString input =
      case parse parser "Example" input of
        Left{} -> error "Parse failure"
        Right str -> str
   parser = P.stringLiteral $ P.makeTokenParser haskellDef
