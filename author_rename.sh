#!/bin/bash

# clear

if [ ${1} == "clean" ]; then
    echo
    echo "Limando o Cache...";
    stack clean
fi

echo
echo "Compilando...";
echo
stack build && 

echo &&
echo "Rodando o Projeto" &&
stack exec aulahaskell
