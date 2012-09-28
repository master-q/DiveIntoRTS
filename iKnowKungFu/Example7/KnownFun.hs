module KnownFun (caseScrut) where
{-# NOINLINE caseScrut #-}

caseScrut :: Maybe Int -> Int
caseScrut x = case x of Just j -> j
                        Nothing -> 10
