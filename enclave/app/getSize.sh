#!/bin/bash
echo make clean
make clean 
echo make 
make  
echo ./app > log
./app > log
