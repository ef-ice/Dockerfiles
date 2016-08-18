#!/bin/bash
set -euo pipefail
readonly IFS=$'\n\t'

# shellcheck source=./util.sh
source "$(dirname "$0")"/util.sh

assertVariable \$GITHUB_USER
assertVariable \$GITHUB_EMAIL
assertVariable \$GITHUB_PASS

function call {
  git config --global user.name "$GITHUB_USER"
  git config --global user.email "$GITHUB_EMAIL"
  git config --global credential.helper 'store --file=/.git-credentials'
  echo "https://$GITHUB_USER:$GITHUB_PASS@github.com" > /.git-credentials
}

call

agent.sh start
