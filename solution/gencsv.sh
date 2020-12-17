#!/bin/bash

for i in `seq 0 $[${1:-10} - 1]`
do
  echo "${i}, ${RANDOM}" >> inputFile
done
