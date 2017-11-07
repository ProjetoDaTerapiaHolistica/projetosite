{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies, DeriveGeneric #-}
module Handler.Pagina where

import Import
import Text.Julius

getPag1R :: Handler Html
getPag1R = do
    defaultLayout $ do
        toWidget $ [lucius|
            h1 {
                color: pink;
            }
        |]
        [whamlet|
            <h1> Pagina 1
            <a href=@{HomeR}> Voltar
        |]

getPag2R :: Handler Html
getPag2R = do
    defaultLayout $ do
        toWidget $ [lucius|
            h1 {
                color: #4e4e4e;
            }
        |]
        [whamlet|
            <h1> Pagina 2
            <a href=@{HomeR}> Voltar
        |]

getPag3R :: Handler Html
getPag3R = do
    defaultLayout $ do
        toWidget $ [lucius|
            h1 {
                color: purple;
            }
        |]
        [whamlet|
            <h1> Pagina 3
            <a href=@{HomeR}> Voltar
        |]

soma :: Int -> Int -> Int
soma x y = x + y

getAddR :: Int -> Int -> Handler Html
getAddR x y = do 
    defaultLayout $ do
        [whamlet|
            <h1> A SOMA EH: #{soma x y}
        |]



getHomeR :: Handler Html
getHomeR = do
    defaultLayout $ do 
        toWidgetHead $ $(juliusFile "templates/home.julius")
        addStylesheet $ (StaticR css_home_css)
        addStylesheet $ (StaticR css_bootstrap_css)
        $(whamletFile "templates/home.hamlet")
        