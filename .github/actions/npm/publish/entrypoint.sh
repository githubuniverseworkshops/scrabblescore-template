#!/bin/sh -l

if [[ $NPM_TOKEN ]]; then
  echo "//${NPM_REGISTRY_URL-registry.npmjs.org}/:_authToken=$NPM_TOKEN" > $HOME/.npmrc
  chmod 0600 $HOME/.npmrc
fi

sh -c "npm publish $*"
