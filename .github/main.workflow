workflow "NPM Publish on Tag" {
  on = "push"
  resolves = ["npm-publish"]
}

action "npm-install" {
  uses = "./.github/actions/npm/vanilla"
  args = "install"
}

action "npm-test" {
  needs = "npm-install"
  uses = "./.github/actions/npm/vanilla"
  args = "test"
}

action "npm-publish" {
  needs = "npm-test"
  uses = "./.github/actions/npm/vanilla"
  args = "publish"
  secrets = ["NPM_AUTH_TOKEN"]
}
