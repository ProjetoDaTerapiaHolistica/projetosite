{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.CadastroCliente where

import Import
import Database.Persist.Postgresql

formCliente :: Form Cliente
formCliente = renderDivs $ Cliente
    <$> areq textField FieldSettings{fsId=Just "txtNome",
                                             fsLabel="Nome: ",
                                             fsTooltip= Nothing,
                                             fsName= Nothing,
                                             fsAttrs=[("class","form-control")]} Nothing
    <*> areq textField FieldSettings{fsId=Just "txtEndereco",
                                             fsLabel="Endereço: ",
                                             fsTooltip= Nothing,
                                             fsName= Nothing,
                                             fsAttrs=[("class","form-control")]} Nothing
    <*> areq textField FieldSettings{fsId=Just "txtTelefone",
                                             fsLabel="Telefone: ",
                                             fsTooltip= Nothing,
                                             fsName= Nothing,
                                             fsAttrs=[("class","form-control")]} Nothing
    <*> areq textField FieldSettings{fsId=Just "txtCelular",
                                             fsLabel="Celular: ",
                                             fsTooltip= Nothing,
                                             fsName= Nothing,
                                             fsAttrs=[("class","form-control")]} Nothing
    <*> areq textField FieldSettings{fsId=Just "txtEmail",
                                             fsLabel="Email: ",
                                             fsTooltip= Nothing,
                                             fsName= Nothing,
                                             fsAttrs=[("class","form-control")]} Nothing
    <*> areq passwordField FieldSettings{fsId=Just "txtSenha",
                                             fsLabel="Senha: ",
                                             fsTooltip= Nothing,
                                             fsName= Nothing,
                                             fsAttrs=[("class","form-control")]} Nothing

getCadastroClienteR :: Handler Html
getCadastroClienteR = do 
    logado <- lookupSession "_ID"
    (widget,enctype) <- generateFormPost formCliente
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
        $(whamletFile "templates/menunav.hamlet")        
        [whamlet|
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <form action=@{CadastroClienteR} method=post>
                            ^{widget}
                            <input type="submit" value="Cadastrar">
        |]
        $(whamletFile "templates/footer.hamlet")

postCadastroClienteR :: Handler Html
postCadastroClienteR = do 
    ((res,_),_) <- runFormPost formCliente
    case res of 
        FormSuccess cliente -> do 
            _ <- runDB $ insert cliente
            redirect HomeR
        _ -> redirect CadastroClienteR
