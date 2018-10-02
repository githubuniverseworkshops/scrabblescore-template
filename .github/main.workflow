workflow "NPM Publish on Tag" {
  on = "push"
  resolves = ["npm-publish"]
}

action "tag-filter" {
  uses = "./.github/actions/filter"
  args = "tag"
}

action "npm-login" {
  uses = "./.github/actions/npm/login"
  needs = "tag-filter"
  secrets = ["NPM_TOKEN"]
}

action "npm-test" {
  uses = "./.github/actions/npm/test"
  needs = "npm-login"
}

action "npm-publish" {
  uses = "./.github/actions/npm/publish"
  needs = "npm-test"
}
