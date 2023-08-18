#!/bin/bash

shopt -s globstar

while getopts "i:p:" flag; do
  case $flag in
  i) INCLUDE="$OPTARG" ;;
  p) PARAMS="$OPTARG" ;;
  esac
done

for file in $INCLUDE; do
  K6_BROWSER_HEADLESS=true K6_BROWSER_ARGS='no-sandbox' k6 run $PARAMS "$file"
done
