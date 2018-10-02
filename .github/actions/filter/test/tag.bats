#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

@test "tag: without a ref" {
  unset GITHUB_REF
  run tag
  [ "$status" -eq 1 ]
  [ "$output" = "\$GITHUB_REF is not set" ]
}

@test "tag: ref is a tag" {
  export GITHUB_REF="refs/tags/v1.2.3"
  run tag
  echo output: $output
  [ "$status" -eq 0 ]
  [ "$output" = "refs/tags/v1.2.3 matches refs/tags/*" ]
}

@test "tag: ref is a branch" {
  export GITHUB_REF=refs/heads/master
  run tag
  echo output: $output
  [ "$status" -eq 1 ]
  [ "$output" = "refs/heads/master does not match refs/tags/*" ]
}

@test "tag: ref matches tag pattern" {
  export GITHUB_REF=refs/tags/v1.2.3
  run tag v1*
  [ "$status" -eq 0 ]
  [ "$output" = "refs/tags/v1.2.3 matches refs/tags/v1*" ]

  run tag release*
  [ "$status" -eq 1 ]
  [ "$output" = "refs/tags/v1.2.3 does not match refs/tags/release*" ]
}
