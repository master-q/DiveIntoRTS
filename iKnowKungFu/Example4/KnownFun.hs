module KnownFun (unknownApp) where
{-# NOINLINE unknownApp #-}

unknownApp :: (Int -> Int) -> Int -> Int
unknownApp f x = f x
