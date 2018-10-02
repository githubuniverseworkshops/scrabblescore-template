FROM node:10-slim

LABEL "version"="1.0.0"
LABEL "repository"="http://github.com/actions/npm"
LABEL "homepage"="http://github.com/actions/npm/login"
LABEL "maintainer"="GitHub Actions <support+actions@github.com>"
LABEL "com.github.actions.name"="GitHub Action for NPM registry authentication"
LABEL "com.github.actions.description"="Writes credentials for an NPM registry to ~/.npmrc."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="d73a49"

COPY entrypoint.sh /entrypoint.sh
WORKDIR /github/home
ENTRYPOINT ["/entrypoint.sh"]
