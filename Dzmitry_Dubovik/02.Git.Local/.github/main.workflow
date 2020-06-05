workflow "Build" {
  on = "push"
  resolves = ["Checking", "Packing", "Test"]
}
action "Checking" {
  uses = "actions/action-builder/shell@master"
  runs = "ls"
  args = "-la"
}
action "Packing" {
  needs = "Checking"
  uses = "actions/action-builder/shell@master"
  runs = "tar"
  args = "-zcvf file.tar.gz *.GIT"
}

action "Test" {
  needs = "Packing"
  uses = "actions/action-builder/shell@master"
  runs = "ls"
  args = '-la"
}
