#!/usr/bin/env bash

START=${1}
END=${2}

if ! [[ ${START} =~ ^[+-]?[0-9]+$ ]]; 
   then echo "error: ${START} is not a number" >&2; exit 1 
fi

if ! [[ ${END} =~ ^[+-]?[0-9]+$ ]]; 
   then echo "error: ${END} is not a number" >&2; exit 1 
fi

if [ -f "inputFile" ]; then
  rm inputFile
fi

while [ "${START}" -le "${END}" ]; do
  echo "${START}, ${RANDOM}" >> inputFile
  ((START++))
done
