#!/usr/bin/env bash

DOCKER=`which docker`

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 IMAGE"
  exit 0
fi

for commit in $($DOCKER history $1 | sed 1d | awk '{ print $1 }')
do
  content="$commit
$($DOCKER inspect $commit | tr -d '\"' | grep 'Created\|Author\|Comment')"
  echo "$content"
done

