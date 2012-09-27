import KnownFun

main :: IO ()
main = do
  return $! knownUndersaturatedApp () 10
  return ()
