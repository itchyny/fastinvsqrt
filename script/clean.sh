#!/bin/bash
for dir in src/*; do
  (
    echo "cleaning ${dir##*/}"
    cd $dir
    make clean | grep -v '^make'
  )
done

exit 0
