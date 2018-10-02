FROM debian:stable-slim

LABEL "version"="0.2.0"
LABEL "com.github.actions.name"="Filters for GitHub Actions"
LABEL "com.github.actions.description"="common filters to stop workflows"
LABEL "com.github.actions.icon"="filter"
LABEL "com.github.actions.color"="gray-dark"

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        jq && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/local/bin:${PATH}"

COPY bin /usr/local/bin/
