#!/bin/sh -l

set -e

if [ ! -z $NPM_AUTH_TOKEN ]; then
  # TODO
  # Allow registry.npmjs.org to be overridden
  echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > $HOME/.npmrc
  chmod 0600 $HOME/.npmrc
fi

sh -c "npm $*"
