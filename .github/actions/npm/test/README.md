# GitHub Action for NPM Test

This Action for [NPM](https://www.npmjs.com/) Test runs a package's "test" script.

## Usage

An example of testing a packge prior to publication follows:

```hcl
action "npm test" {
  uses = "actions/npm/test@master"
}

action "npm publish" {
  needs = ["npm test"]
  uses = "actions/npm/publish@master"
}
```
