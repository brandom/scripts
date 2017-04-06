#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 SCRIPT_NAME"
  exit 0
fi

mkdir $1
cp package.json.tpl ./$1/package.json
(cd ./$1 && git init)
git submodule add ./$1
(cd ./$1 && npm init)
