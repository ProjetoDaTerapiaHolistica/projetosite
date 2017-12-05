{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.CadastroTratamento where

import Import
import Database.Persist.Postgresql

formTratamento :: Form Tratamento
formTratamento = renderDivs $ Tratamento
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

getCadastroTratamentoR :: Handler Html
getCadastroTratamentoR = do 
    (widget,enctype) <- generateFormPost formTratamento
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
            <form action=@{CadastroTratamentoR} method=post>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]

postCadastroTratamentoR :: Handler Html
postCadastroTratamentoR = do 
    ((res,_),_) <- runFormPost formTratamento
    case res of 
        FormSuccess tratamento -> do 
            _ <- runDB $ insert tratamento
            redirect LoginR
        _ -> redirect HomeR
