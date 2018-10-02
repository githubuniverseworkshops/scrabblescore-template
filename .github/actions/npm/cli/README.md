# GitHub Action for NPM

This Action for NPM wraps the [NPM CLI](https://docs.npmjs.com/cli/npm) to enable common NPM commands.

## Usage

An example of invoking, for example, `npm-config` via this NPM CLI Action:

```hcl
action "npm config" {
  uses = "actions/npm/cli@master"
  args = "config foo bar"
}
```
