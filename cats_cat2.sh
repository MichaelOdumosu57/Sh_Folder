#!/bin/bash
FILENAME=$1

rm results.txt
touch results.txt

cat $1 | xargs cat >> results.txt 

# cat results.txt 

