{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Admin where

import Import
import Database.Persist.Postgresql

getAdminR :: Handler Html
getAdminR = do 
    defaultLayout $ do 
        
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
        
        $(whamletFile "templates/admin/menunavAdmin.hamlet")
        $(whamletFile "templates/admin/conteudoAdmin.hamlet")
        $(whamletFile "templates/footer.hamlet")