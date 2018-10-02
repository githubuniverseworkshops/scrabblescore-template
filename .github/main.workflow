workflow "NPM Publish on Tag" {
  on = "push"
  resolves = ["npm-publish"]
}

action "npm-login" {
  uses = "./.github/actions/npm/login"
  secrets = ["NPM_TOKEN"]
}

action "npm-install" {
  needs = "npm-login"
  uses = "./.github/actions/npm/install"
}

action "npm-test" {
  needs = "npm-install"
  uses = "./.github/actions/npm/test"
}

action "npm-publish" {
  needs = "npm-test"
  uses = "./.github/actions/npm/publish"
}
