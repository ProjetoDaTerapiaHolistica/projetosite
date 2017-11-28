{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies, DeriveGeneric #-}
module Handler.Pagina where

import Import
import Text.Julius


getHomeR :: Handler Html
getHomeR = defaultLayout $ do
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
    |]

    -- let navbarfixed = "navbar-transparent navbar-fixed-top" :: Text
    -- let colorOnScroll = "color-on-scroll=200" :: Text
    $(whamletFile "templates/menunav.hamlet")
    $(whamletFile "templates/conteudoindex.hamlet")
    $(whamletFile "templates/footer.hamlet")




getTratamentoR :: Handler Html
getTratamentoR = defaultLayout $ do
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
    |]
    $(whamletFile "templates/menunav.hamlet")
    $(whamletFile "templates/conteudoTratamento.hamlet")
    $(whamletFile "templates/footer.hamlet")



getEspecialistaR :: Handler Html
getEspecialistaR = defaultLayout $ do
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
    |]
    $(whamletFile "templates/menunav.hamlet")
    $(whamletFile "templates/conteudoEspecialista.hamlet")
    $(whamletFile "templates/footer.hamlet")


getQuemSomosR :: Handler Html
getQuemSomosR = defaultLayout $ do
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
    |]
    $(whamletFile "templates/menunav.hamlet")
    $(whamletFile "templates/conteudoQuemSomos.hamlet")
    $(whamletFile "templates/footer.hamlet")

getAgendarR :: Handler Html
getAgendarR = undefined

    


