#!/bin/bash
echo '$0 = ' $0
echo '$1 = ' $1
echo '$2 = ' $2
cat $1 > $PWD/temp
rm ./app
rm ./app.c
make app
./afl-fuzz  -m 50000000 -i $2/in/ -o $2/out/ ./app
