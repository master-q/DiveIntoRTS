module KnownFun (knownOversatApp, knownFun2) where
{-# NOINLINE knownFun2 #-}

knownFun2 :: a -> a -> a
knownFun2 x _ = x

knownOversatApp :: () -> Int
knownOversatApp _ = knownFun2 id id 10
