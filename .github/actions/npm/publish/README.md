# GitHub Action for NPM Publish

This Action for [NPM](https://www.npmjs.com/) Publish publishes packages to an NPM registry following authentication via the `npm/login` Action.

## Usage

An example of authenticating and publishing a packge to the official public npm registry at https://registry.npmjs.org/ would look like this:

```hcl
action "npm login" {
  uses = "actions/npm/login@master"
  secrets = ["NPM_TOKEN"]
}

action "npm publish" {
  needs = ["npm login"]
  uses = "actions/npm/publish@master"
}
```
