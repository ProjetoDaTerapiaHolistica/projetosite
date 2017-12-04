{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies, DeriveGeneric #-}
module Handler.Agendamento where

import Import
import Text.Julius
import Database.Persist.Postgresql

-- data Cliente = Cliente
--     { nome :: Text   
--     , endereco :: Text
--     , telefone :: Int
--     , celular :: Int
--     , email :: Text
--     , senha :: Text
--     }
--     deriving Show

-- formCliente :: Form Cliente
-- formCliente = renderDivs $ Cliente
--     <$> areq textField "Nome: " Nothing
--     <*> areq textField "Endereco: " Nothing
--     <*> areq intField "Telefone: " Nothing
--     <*> aopt intField "Celular: " Nothing
--     <*> areq emailField "Email: " Nothing
--     <*> areq textField "Senha: " Nothing
    
    -- <*> areq (selectField profsLista) "Professor" Nothing
