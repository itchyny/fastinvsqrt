#!/bin/bash

for dir in src/*; do
  pushd "$dir" >/dev/null
  echo "cleaning ${dir##*/}"
  make clean | grep -v '^make'
  popd >/dev/null
done

exit 0
