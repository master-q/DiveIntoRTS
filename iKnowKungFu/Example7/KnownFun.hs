module KnownFun (case_scrut) where
{-# NOINLINE case_scrut #-}

case_scrut :: Maybe Int -> Int
case_scrut x = case x of Just j -> j
                         Nothing -> 10
