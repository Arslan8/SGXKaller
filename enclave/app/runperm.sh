#!/bin/bash
echo '$0 = ' $0
echo '$1 = ' $1
cat $1 > $PWD/temp
make clean
make app
afl-fuzz  -m 50000000 -i ./in/ -o ./out/ ./app
