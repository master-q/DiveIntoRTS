import Control.DeepSeq
import System.Exit
--import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy.Char8 as BL8
import MyString

instance NFData BL8.ByteString

main :: IO ()
main = do
  psStr `deepseq` putStrLn psStr
  pbStr `deepseq` BL8.putStrLn pbStr
  exitSuccess -- breakpoint base_SystemziExit_exitSuccess_info
