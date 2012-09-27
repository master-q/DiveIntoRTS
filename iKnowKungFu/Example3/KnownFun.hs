module KnownFun (knownUndersaturatedApp, knownFun2) where
{-# NOINLINE knownFun2 #-}

knownFun2 :: a -> a -> a
knownFun2 x _ = x

knownUndersaturatedApp :: () -> Int -> Int
knownUndersaturatedApp _ = knownFun2 10
