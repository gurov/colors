workflow "Build, Test, and Publish" {
  on = "push"
  resolves = ["Publish"]
}

# Filter for master branches
action "Filter" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Publish" {
  needs = "Filter"
  uses = "actions/npm@master"
  args = "publish --access public"
  secrets = ["NPM_TOKEN"]
}
