#!/bin/sh

for p in `jq -r '.dependencies | to_entries[] | .key + "@" + .value' < /var/www/package.json`;
do
  npm install $p;
done

for p in `jq -r '.devDependencies | to_entries[] | .key + "@" + .value' < /var/www/package.json`;
do
  npm install $p;
done
