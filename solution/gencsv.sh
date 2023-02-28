#!/usr/bin/env bash

START=${1}
END=${2}

while [ "${START}" -le "${END}" ]; do
  echo "${START}, ${RANDOM}" >> inputFile
  ((START++))
done
