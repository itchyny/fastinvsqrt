#!/bin/bash
if ! which "$1" >/dev/null; then
  echo "$1 is not installed." >/dev/stderr
  exit 1
fi
