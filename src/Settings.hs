module Settings where

     import System.Environment (getArgs)
     import System.Exit (exitWith, ExitCode(ExitFailure))
     import Text.Read (readMaybe)

     data Settings = Settings {
        port :: Int
     } deriving(Show)

     parseInt :: String -> Maybe Int
     parseInt s = readMaybe s

     parseArgs :: [String] -> [(String, String)]
     parseArgs (x0 : xs@(x1 : _))
         | (head x0) == '-' = (x0, x1):(parseArgs (tail xs))
         | otherwise = ("", x0):(parseArgs xs)
     parseArgs (x: _) = [("", x)]
     parseArgs _ = []

     parseSettings :: [String] -> Maybe Settings
     parseSettings args = result where
         argList = parseArgs args
         withPort = (lookup "-p" argList) >>= parseInt >>= (\a -> Just Settings { port = a })
         result = withPort