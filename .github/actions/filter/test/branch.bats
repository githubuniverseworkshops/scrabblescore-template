#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

@test "branch: without a ref" {
  unset GITHUB_REF
  run branch
  [ "$status" -eq 1 ]
  [ "$output" = "\$GITHUB_REF is not set" ]
}

@test "branch: ref is a branch" {
  export GITHUB_REF="refs/heads/master"
  run branch
  [ "$status" -eq 0 ]
  [ "$output" = "refs/heads/master matches refs/heads/*" ]
}

@test "branch: ref is a tag" {
  export GITHUB_REF=refs/tags/v1.2.3
  run branch
  [ "$status" -eq 1 ]
  [ "$output" = "refs/tags/v1.2.3 does not match refs/heads/*" ]
}

@test "branch: matches pattern" {
  export GITHUB_REF=refs/heads/release-v2.14
  run branch release-*
  [ "$status" -eq 0 ]
  [ "$output" = "refs/heads/release-v2.14 matches refs/heads/release-*" ]

  run branch stale*
  [ "$status" -eq 1 ]
  [ "$output" = "refs/heads/release-v2.14 does not match refs/heads/stale*" ]
}

@test "branch: does not match substring" {
  export GITHUB_REF=refs/heads/the-masters-tournament
  run branch master
  [ "$status" -eq 1 ]
  [ "$output" = "refs/heads/the-masters-tournament does not match refs/heads/master" ]

  run branch *master*
  [ "$status" -eq 0 ]
  [ "$output" = "refs/heads/the-masters-tournament matches refs/heads/*master*" ]
}
