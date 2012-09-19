module KnownFun (knownApp, knownFun) where
{-# NOINLINE knownFun #-}

knownFun :: a -> a
knownFun x = x

knownApp :: () -> Int
knownApp _ = knownFun 10
