{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.AdminTratamento where

import Import
import Database.Persist.Postgresql

getAdminTratamentoR :: Handler Html
getAdminTratamentoR = do
    defaultLayout $ do
        $(whamletFile "templates/admin/menunavAdmin.hamlet")
        toWidget [hamlet|
            <h1>
                oi eu sou goku
        |]

postAdminTratamentoR :: Handler Html
postAdminTratamentoR = undefined
