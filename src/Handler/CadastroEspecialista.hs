{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.CadastroEspecialista where

import Import
import Database.Persist.Postgresql

formEspecialista :: Form Especialista
formEspecialista = renderDivs $ Especialista
    <$> areq textField FieldSettings{fsId=Just "txtNome",
                                             fsLabel="Nome: ",
                                             fsTooltip= Nothing,
                                             fsName= Nothing,
                                             fsAttrs=[("class","form-control")]} Nothing
    <*> areq textField FieldSettings{fsId=Just "txtDescricao",
                                             fsLabel="Descricao: ",
                                             fsTooltip= Nothing,
                                             fsName= Nothing,
                                             fsAttrs=[("class","form-control")]} Nothing
    <*> areq textField FieldSettings{fsId=Just "txtDescricao",
                                             fsLabel="Avatar: ",
                                             fsTooltip= Nothing,
                                             fsName= Nothing,
                                             fsAttrs=[("class","form-control")]} Nothing

getCadastroEspecialistaR :: Handler Html
getCadastroEspecialistaR = do 
    (widget,enctype) <- generateFormPost formEspecialista
    defaultLayout $ do
        addStylesheet $ StaticR css_bootstrap_css
        addStylesheet $ StaticR css_gaia_css
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_modernizr_js
        addScript $ StaticR js_bootstrap_js
        addScript $ StaticR js_gaia_js
        let navbarfixed = "" :: Text
        addStylesheetRemote "https://fonts.googleapis.com/css?family=Cambo|Poppins:400,600"
        toWidgetHead $ [hamlet|
          <meta charset="UTF-8">
          <meta name="description" content="Site da Terapia Holística feito na framework Yesod">
          <meta name="viewport" content="width=device-width, initial-scale=1">
        |]
        [whamlet|
            <form action=@{CadastroEspecialistaR} method=post>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]

postCadastroEspecialistaR :: Handler Html
postCadastroEspecialistaR = do 
    ((res,_),_) <- runFormPost formEspecialista
    case res of 
        FormSuccess especialista -> do 
            _ <- runDB $ insert especialista
            redirect LoginR
        _ -> redirect HomeR
