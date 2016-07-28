#!/bin/bash

function assertVariable() {
  local NAME
  NAME=$(echo "$1" | sed s/\\$//g)

  if [ -z "${!NAME+x}" ]; then
     echo "Missing $NAME environment variable"
     exit 1
  fi
}
