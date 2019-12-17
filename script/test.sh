#!/bin/bash

resultfile=$(mktemp)
compileresult=$(mktemp)
trap 'rm -f $resultfile $compileresult' EXIT

for dir in src/*; do
  pushd "$dir" >/dev/null
  name=${dir##*/}
  echo "Test $name"
  if make build > "$compileresult" 2>&1; then
    grep -a -v '^make' "$compileresult"
    IFS=' ' output=($(../../script/build/validate 'seq 100000 | make -s run'))
    if [ ${#output[@]} -eq 4 ]; then
      duration=${output[0]}; ok=${output[1]}; fail=${output[2]}; total=${output[3]}
      printf '%s\t%-8s\t%s\t%s\t%s\n' "$duration" "$name" "$ok" "$fail" "$total" | tee -a "$resultfile"
    else
      printf '%s\t%-8s\t%s\t%s\t%s\n' N/A "$name" 0 0 0 | tee -a "$resultfile"
    fi
  else
    echo 'build failed' >/dev/stderr
    grep -a -v '^make' "$compileresult" > /dev/stderr
    printf '%s\t%-8s\t%s\t%s\t%s\n' N/A "$name" 0 0 0 | tee -a "$resultfile"
  fi
  echo
  popd >/dev/null
done

echo "Result"
printf '%s\t%-8s\t%s\t%s\t%s\n' Time Name OK Fail Total
grep -v 'N/A' "$resultfile" | sort -n
grep    'N/A' "$resultfile" | sort

exit 0
