#!/bin/bash
FILENAME=$1

rm results.txt
touch results.txt

while read LINE 
do 

    cat ${LINE} >> results.txt

done < ${FILENAME}

cat results.txt