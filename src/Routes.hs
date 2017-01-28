{-# LANGUAGE OverloadedStrings #-}

module Routes where

    import Web.Scotty
    import Handlers.Echo

    routes :: ScottyM ()
    routes = do
        get "/echo" $ do
            getEcho