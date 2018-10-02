workflow "NPM Publish on Tag" {
  on = "push"
  resolves = ["npm-publish"]
}

action "npm-install" {
  uses = "./.github/actions/npm/install"
}

action "npm-test" {
  needs = "npm-install"
  uses = "./.github/actions/npm/test"
}

action "npm-publish" {
  needs = "npm-test"
  uses = "./.github/actions/npm/vanilla"
  args = "publish --public"
  secrets = ["NPM_AUTH_TOKEN"]
}
