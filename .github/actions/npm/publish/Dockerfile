FROM node:10-slim

LABEL "com.github.actions.name"="GitHub Action for NPM"
LABEL "com.github.actions.description"="Wraps the NPM CLI to enable common NPM commands."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="d73a49"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
