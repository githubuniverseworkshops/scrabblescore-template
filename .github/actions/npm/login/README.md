# GitHub Action for NPM Login

This Action for [NPM](https://www.npmjs.com/) Login writes credentials for an NPM registry (https://registry.npmjs.org/ by default) to `$HOME/.npmrc`.

Since `$HOME` is persisted across Actions, credentials in `$HOME/.npmrc` will be available to downstream Actions, allowing those Actions to, for example, publish packages to the registry.

## Usage

To authenticate with the default registry, `registry.npmjs.org`:

```hcl
action "npm login" {
  uses = "actions/npm/login@master"
  secrets = ["NPM_TOKEN"]
}
```

To authenticate with a registry, `someOtherRegistry.someDomain.net`:

```hcl
action "npm login" {
  uses = "actions/npm/login@master"
  secrets = ["NPM_TOKEN"]
  env = {
    NPM_REGISTRY_URL = "someOtherRegistry.someDomain.net"
  }
}
```

### Secrets

* `NPM_TOKEN` - **Required**. The token required to authenticate with the NPM registry ([more info](https://docs.npmjs.com/getting-started/working_with_tokens))

### Environment variables

* `NPM_REGISTRY_URL` - **Optional**. To specify a registry to authenticate with. Defaults to `registry.npmjs.org`
