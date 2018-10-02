# GitHub Action for NPM Install

This Action for [NPM](https://www.npmjs.com/) Install installs a package's dependencies.

## Usage

An example of installing a package's dependecies prior to testing it follows:

```hcl
action "npm install" {
  uses = "actions/npm/install@master"
}

action "npm test" {
  needs = ["npm install"]
  uses = "actions/npm/test@master"
}
```
