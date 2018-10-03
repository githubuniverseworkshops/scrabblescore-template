workflow "Build, Test, and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Build" {
  uses = "docker://superbbears/npm"
  args = "install"
}

action "Test" {
  needs = "Build"
  uses = "docker://superbbears/npm"
  args = "test"
}

action "Publish" {
  needs = "Test"
  uses = "docker://superbbears/npm"
  args = "publish --access public"
  secrets = ["NPM_AUTH_TOKEN"]
}
