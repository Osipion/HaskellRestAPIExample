module Main where

    import System.Environment (getArgs)
    import System.Exit (exitWith, ExitCode(ExitFailure))
    import Text.Read (readMaybe)
    import Data.Maybe (isNothing, fromJust)
    import Web.Scotty
    import Settings(parseSettings, Settings, port)
    import Routes


    startServer :: Settings -> IO ()
    startServer settings = do
        putStrLn "Starting server. Settings:"
        print settings
        scotty (port settings) routes


    run :: Maybe Settings -> IO ()
    run args
        | isNothing args = exitWith $ ExitFailure 1
        | otherwise      = startServer $ fromJust args

    main :: IO ()
    main = do
        args' <- getArgs
        let args = parseSettings args'
        run args
