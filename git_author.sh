#!/bin/sh
cat << EOF
{
  "git_commit_author": "$(git log -1 | grep ^Author | cut -f 2 -d : | sed 's/^ //g')"
}