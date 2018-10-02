#!/bin/sh

if [[ $NPM_AUTH_TOKEN ]]; then
  echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > $HOME/.npmrc
fi

exec npm "$@"
