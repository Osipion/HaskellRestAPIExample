{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Handlers.Echo where

    import Web.Scotty
    import Data.Aeson (FromJSON, ToJSON)
    import GHC.Generics

    data EchoModel = EchoModel {
        id :: String,
        parameters :: String
    } deriving(Show, Generic)

    instance ToJSON EchoModel
    instance FromJSON EchoModel

    getEcho :: ActionM ()
    getEcho = do
        json $ EchoModel {Handlers.Echo.id = "Hello", parameters = ""}