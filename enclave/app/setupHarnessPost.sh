#!/bin/bash
cat $1 > $PWD/temp
rm ./App/App.cpp
rm ./app
rm ./App/*.o
make app
cp ./app $2/
cp ./app.c $2/
cp ./enclave.signed.so $2/
