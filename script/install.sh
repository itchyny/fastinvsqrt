#!/bin/bash -u

i=0
output=()
while IFS= read -r line; do
  if ((i < 10)); then
    echo "$line"
  else
    if ((i == 20)); then
      echo "..."
    fi
    output+=("$line")
  fi
  i=$((i + 1))
done < <(eval "$1" 2>&1)

if ((${#output[@]} > 0)); then
  if ((${#output[@]} > 10)); then
    output=("${output[@]: -10}")
  fi
  printf '%s\n' "${output[@]}"
fi
