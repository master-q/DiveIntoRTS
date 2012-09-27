import KnownFun

main :: IO ()
main = do
  return $! unknownApp id 10
  return ()
