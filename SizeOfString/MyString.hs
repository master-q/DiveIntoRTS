{-# LANGUAGE OverloadedStrings #-}
module MyString (bStr, sStr, idStr, psStr, pbStr) where
--import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import Data.ByteString.Char8 ()
--import Data.ByteString.Lazy.Char8 ()

sStr :: String
sStr = "abcdefgh"

bStr :: BL.ByteString
bStr = BL.fromChunks ["abcd", "efgh"]

idStr :: a -> a
idStr s = s

psStr :: String
psStr = idStr sStr

pbStr :: BL.ByteString
pbStr = idStr bStr
