#!/bin/bash
for dir in src/*; do
  (
    echo "building ${dir##*/}"
    cd $dir
    make build
  )
done

exit 0
