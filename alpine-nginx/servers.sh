#!/bin/bash

string=("$@")

array=(${string[0]//,/ })

result=""

for i in "${!array[@]}"; do
  result=$(printf "%s\nserver %s" "$result" "${array[i]}")
done

echo "$result"
