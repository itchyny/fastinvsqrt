#!/bin/bash

output="$(sh -c "$1" 2>&1)"

if [ "$?" -eq 0 ]; then
  if [ $(echo "$output" | wc -l) -le 40 ]; then
    echo "$output"
  else
    echo "$output" | head -n 20
    echo ...
    echo "$output" | tail -n 20
  fi
else
  echo "$output"
fi
