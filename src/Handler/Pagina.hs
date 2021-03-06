{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies, DeriveGeneric #-}
module Handler.Pagina where

import Import
import Text.Julius
import Database.Persist.Postgresql

getHomeR :: Handler Html
getHomeR = do
  logado <- lookupSession "_ID"
  defaultLayout $ do
    let navbarfixed = "navbar-transparent navbar-fixed-top" :: Text
        colorOnScroll = "color-on-scroll=\"200\""
    addStylesheet $ StaticR css_bootstrap_css
    addStylesheet $ StaticR css_gaia_css
    addScript $ StaticR js_modernizr_js
    addScript $ StaticR js_jquery_min_js
    addScript $ StaticR js_gaia_js
    addScript $ StaticR js_bootstrap_js
    addStylesheetRemote "https://fonts.googleapis.com/css?family=Cambo|Poppins:400,600"
    -- addStylesheetRemote "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    

    toWidgetHead $ [hamlet|
      <meta charset="UTF-8">
      <meta name="description" content="Site da Terapia Holística feito na framework Yesod">
      <meta name="viewport" content="width=device-width, initial-scale=1">
    |]
    $(whamletFile "templates/menunav.hamlet")
    $(whamletFile "templates/conteudoindex.hamlet")
    $(whamletFile "templates/footer.hamlet")




getTratamentoR :: Handler Html
getTratamentoR = do
  logado <- lookupSession "_ID"
  tratamentos<-runDB $ selectList [] [] 
  defaultLayout $ do
    let navbarfixed = "" :: Text
        colorOnScroll = "color-on-scroll=\"200\""
    addStylesheet $ StaticR css_bootstrap_css
    addStylesheet $ StaticR css_gaia_css
    addScript $ StaticR js_jquery_min_js
    addScript $ StaticR js_modernizr_js
    addScript $ StaticR js_bootstrap_js
    addScript $ StaticR js_gaia_js
    addStylesheetRemote "https://fonts.googleapis.com/css?family=Cambo|Poppins:400,600"
    
    toWidgetHead $ [hamlet|
      <meta charset="UTF-8">
      <meta name="description" content="Site da Terapia Holística feito na framework Yesod">
      <meta name="viewport" content="width=device-width, initial-scale=1">
    |]
    $(whamletFile "templates/menunav.hamlet")
    $(whamletFile "templates/conteudoTratamento.hamlet")
    $(whamletFile "templates/footer.hamlet")



getEspecialistaR :: Handler Html
getEspecialistaR = do
  logado <- lookupSession "_ID"
  especialistas<-runDB $ selectList [] [] 
  defaultLayout $ do
    addStylesheet $ StaticR css_bootstrap_css
    addStylesheet $ StaticR css_gaia_css
    addScript $ StaticR js_jquery_min_js
    addScript $ StaticR js_modernizr_js
    addScript $ StaticR js_bootstrap_js
    addScript $ StaticR js_gaia_js
    let navbarfixed = "" :: Text
        colorOnScroll = "color-on-scroll=\"200\""
    addStylesheetRemote "https://fonts.googleapis.com/css?family=Cambo|Poppins:400,600"
    toWidgetHead $ [hamlet|
      <meta charset="UTF-8">
      <meta name="description" content="Site da Terapia Holística feito na framework Yesod">
      <meta name="viewport" content="width=device-width, initial-scale=1">
    |]
    $(whamletFile "templates/menunav.hamlet")
    $(whamletFile "templates/conteudoEspecialista.hamlet")
    $(whamletFile "templates/footer.hamlet")


getQuemSomosR :: Handler Html
getQuemSomosR = do
  logado <- lookupSession "_ID"
  defaultLayout $ do
    let navbarfixed = "" :: Text
        colorOnScroll = "color-on-scroll=\"200\"" :: Text

    addStylesheet $ StaticR css_bootstrap_css
    addStylesheet $ StaticR css_gaia_css
    addScript $ StaticR js_jquery_min_js
    addScript $ StaticR js_modernizr_js
    addScript $ StaticR js_bootstrap_js
    addScript $ StaticR js_gaia_js
    addStylesheetRemote "https://fonts.googleapis.com/css?family=Cambo|Poppins:400,600"
    
    toWidgetHead $ [hamlet|
      <meta charset="UTF-8">
      <meta name="description" content="Site da Terapia Holística feito na framework Yesod">
      <meta name="viewport" content="width=device-width, initial-scale=1">
    |]
    $(whamletFile "templates/menunav.hamlet")
    $(whamletFile "templates/conteudoQuemSomos.hamlet")
    $(whamletFile "templates/footer.hamlet")

getAgendarR :: Handler Html
getAgendarR = undefined

    


