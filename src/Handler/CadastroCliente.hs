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
    <$> areq textField "Nome: " Nothing
    <*> areq textField "Endereço: " Nothing
    <*> areq textField "Telefone: " Nothing
    <*> areq textField "Celular: " Nothing
    <*> areq textField "Email: " Nothing
    <*> areq passwordField "Senha: " Nothing

getCadastroClienteR :: Handler Html
getCadastroClienteR = do 
    (widget,enctype) <- generateFormPost formCliente
    defaultLayout $ do
        [whamlet|
            <form action=@{CadastroClienteR} method=post>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]

postCadastroClienteR :: Handler Html
postCadastroClienteR = do 
    ((res,_),_) <- runFormPost formCliente
    case res of 
        FormSuccess cliente -> do 
            _ <- runDB $ insert cliente
            redirect LoginR
        _ -> redirect HomeR
