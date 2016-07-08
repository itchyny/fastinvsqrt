#!/bin/bash

resultfile=$(mktemp)
compileresult=$(mktemp)

for dir in src/*; do
  (
    cd $dir
    name=${dir##*/}
    echo "Test $name"
    make build > $compileresult 2>&1
    if ! [ $? -eq 0 ]; then
      echo 'build failed' >/dev/stderr
      cat $compileresult | grep -a -v '^make' > /dev/stderr
      printf "%s\t%-8s\t%s\t%s\t%s\n" N/A $name 0 0 0 | tee -a $resultfile
      echo
      continue
    fi
    cat $compileresult | grep -a -v '^make'
    IFS=' ' output=($(../../script/build/validate 'seq 100000 | make run'))
    if [ ${#output[@]} -eq 4 ]; then
      duration=${output[0]}; ok=${output[1]}; fail=${output[2]}; total=${output[3]}
      printf "%s\t%-8s\t%s\t%s\t%s\n" $duration $name $ok $fail $total | tee -a $resultfile
    else
      printf "%s\t%-8s\t%s\t%s\t%s\n" N/A $name 0 0 0 | tee -a $resultfile
    fi
    echo
  )
done

echo "Result"
printf "%s\t%-8s\t%s\t%s\t%s\n" Time Name OK Fail Total
cat $resultfile | grep -v 'N/A' | sort -n
cat $resultfile | grep    'N/A' | sort
rm $resultfile
rm $compileresult

exit 0
