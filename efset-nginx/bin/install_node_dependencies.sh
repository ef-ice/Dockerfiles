#!/bin/sh

for p in `jq -r '.dependencies | to_entries[] | .key + "@" + .value' < package.json`;
do
  npm install $p;
done
