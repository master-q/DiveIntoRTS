module KnownFun (buildData) where
{-# NOINLINE buildData #-}

buildData :: Int -> Maybe Int
buildData x = Just (x + 1)
