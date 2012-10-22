{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as B8

bstr :: B.ByteString
bstr = "hogehoge"

str :: String
str = "hogehoge"

main = do
  putStrLn str
  B8.putStrLn bstr
