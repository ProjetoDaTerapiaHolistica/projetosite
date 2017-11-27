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
    addScript $ StaticR js_bootstrap_js
    addScript $ StaticR js_jquery_min_js
    addScript $ StaticR js_modernizr_js
    addScript $ StaticR js_gaia_js
    addStylesheetRemote "https://fonts.googleapis.com/css?family=Cambo|Poppins:400,600"
            --toWidgetHead $ $(juliusFile "templates/js/jquery.dropotron.min.julius")
    
    toWidgetHead $ [hamlet|
      <meta charset="UTF-8">
      <meta name="description" content="Site da Terapia Holística feito na framework Yesod">
      <meta name="keywords" content="Terapia, Holistica, Tratamento, Agendar">
    |]
    
    $(whamletFile "templates/menunav.hamlet")
    $(whamletFile "templates/conteudoindex.hamlet")
    $(whamletFile "templates/footer.hamlet")

getAgendarR :: Handler Html
getAgendarR = undefined
getContatoR :: Handler Html
getContatoR = undefined
getSobreR :: Handler Html
getSobreR = undefined
    


