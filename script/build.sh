#!/bin/bash
for dir in src/*; do
  (
    echo "building ${dir##*/}"
    cd $dir
    make build
    echo
  )
done

exit 0
