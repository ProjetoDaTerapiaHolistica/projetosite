{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Login where

import Import
import Database.Persist.Postgresql
import Yesod.Form.Bootstrap3
formLogin :: Form (Text, Text)
formLogin = renderBootstrap $ (,)
    <$> areq emailField FieldSettings{fsId=Just "txtEmail",
                                      fsLabel=" ",
                                      fsTooltip= Nothing,
                                      fsName= Nothing,
                                      fsAttrs=[("placeholder","E-mail"), ("class","form-control")]} Nothing
    <*> areq passwordField FieldSettings{fsId=Just "txtSenha",
                                      fsLabel=" ",
                                      fsTooltip= Nothing,
                                      fsName= Nothing,
                                      fsAttrs=[("placeholder","Senha"), ("class","form-control")]} Nothing

autenticar :: Text -> Text -> HandlerT App IO (Maybe (Entity Cliente))
autenticar email senha = runDB $ selectFirst [ClienteEmail ==. email
                                             ,ClienteSenha ==. senha] []
    
getLoginR :: Handler Html
getLoginR = do 
    logado <- lookupSession "_ID"
    (widget,enctype) <- generateFormPost formLogin
    msg <- getMessage
    defaultLayout $ do 
        let navbarfixed = "" :: Text
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
        [whamlet|
            $maybe mensa <- msg 
                <h1> Usuario Invalido
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <form action=@{LoginR} method=post>
                            ^{widget}
                            <input type="submit" value="Login" class="btn-default">
                        <a href=@{CadastroClienteR} class="btn-default">Cadastro
                        <br>
                        <br>
                        <br>
                        <br>
        |]
        $(whamletFile "templates/footer.hamlet")



postLoginR :: Handler Html
postLoginR = do
    ((res,_),_) <- runFormPost formLogin
    case res of 
        FormSuccess ("root@root.com","root") -> do 
            setSession "_ID" "admin"
            redirect AdminR
        FormSuccess (email,senha) -> do 
            cliente <- autenticar email senha 
            case cliente of 
                Nothing -> do 
                    setMessage $ [shamlet| Usuario ou senha invalido |]
                    redirect LoginR 
                Just (Entity cliid cliente) -> do 
                    setSession "_ID" (clienteNome cliente)
                    redirect HomeR
        _ -> redirect HomeR
                

postLogoutR :: Handler Html
postLogoutR = do 
    deleteSession "_ID"
    redirect HomeR