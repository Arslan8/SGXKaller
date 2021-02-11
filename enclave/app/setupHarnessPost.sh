#!/bin/bash
cat $1 > $PWD/temp
rm ./App/App.cpp
rm ./app
rm ./App/*.o
make app
cp ./app $2/
make App/App.cpp
cp ./App/App.cpp $2/
cp ./enclave.signed.so $2/
