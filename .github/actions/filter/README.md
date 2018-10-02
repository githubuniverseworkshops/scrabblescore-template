# Filters for GitHub Actions

This action includes common filters to stop workflows unless certain conditions are met.

For example, here is a workflow that sends an SMS when an issue is labeled and the `urgent` label was added:

```workflow
workflow "Page Someone" {
  on = "issues"
  resolves = "Send Pages"
}

action "Check for label" {
  uses = "actions/filter"
  args = "label urgent"
}

action "Labeled" {
  uses = "actions/filter"
  args = "action labeled"
}

action "Send Pages" {
  needs = ["Labeled", "Check for label"]
  uses = "actions/twilio-sms"
  secrets = ["TWILIO_TOKEN", "NUMBERS"]
}
```

## Available filters

### tag

Continue if the event is a tag.

```workflow
action "tag-filter" {
  uses = "actions/filter"
  args = "tag"
}
```

Optionally supply a pattern of tags to match:

```workflow
  args = "tag v*"
```

### branch

Continue if the event is a branch.

```workflow
action "branch-filter" {
  uses = "actions/filter"
  args = "branch"
}
```

Optionally supply a pattern to match:

```workflow
  args = "branch stable-*"
```

### ref

Continue if the event ref matches a pattern.

```workflow
action "branch-filter" {
  uses = "actions/filter"
  args = "ref refs/pulls/*"
}
```

### label

Continue if the issue or pull request has the following label

```workflow
action "label-filter" {
  uses = "actions/filter"
  args = "label urgent"
}
```

### action

Continue if the event payload includes a matching action.

```workflow
action "action-filter" {
  uses = "actions/filter"
  args = "action synchronized"
}
```

This also supports multiple actions.

```workflow
action "action-filter" {
  uses = "actions/filter"
  args = ["action", "opened|synchronized"]
}
```
