#!/bin/bash

for dir in src/*; do
  pushd "$dir" >/dev/null
  echo "building ${dir##*/}"
  make build
  echo
  popd >/dev/null
done

exit 0
