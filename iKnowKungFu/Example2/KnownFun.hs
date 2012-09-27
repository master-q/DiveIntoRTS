module KnownFun (knownApp2, knownFun2) where
{-# NOINLINE knownFun2 #-}

knownFun2 :: a -> a -> a
knownFun2 x _ = x

knownApp2 :: () -> Int
knownApp2 _ = knownFun2 10 10
