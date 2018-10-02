#!/bin/sh

cat > ~/.npmrc <<-EOF
//${NPM_REGISTRY_URL-registry.npmjs.org}/:_authToken=${NPM_TOKEN}
EOF

chmod 0600 ~/.npmrc
