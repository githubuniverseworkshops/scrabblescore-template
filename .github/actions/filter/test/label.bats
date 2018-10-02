#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/event.json"

@test "label: matches" {
  run label urgent
  [ "$status" -eq 0 ]
}

@test "label: matches all" {
  run label urgent bug
  [ "$status" -eq 0 ]
}

@test "label: does not match" {
  run label feature
  [ "$status" -eq 1 ]
}

@test "label: does not match all" {
  run label urgent feature
  [ "$status" -eq 1 ]
}
