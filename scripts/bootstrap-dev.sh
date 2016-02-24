#!/bin/bash

GIT_ROOT="https://github.com/7imbrook"
SSEWEB_REPOS="node-api
events
qdb-3.0
scoreboard-2.0
officers
crazy-train
me
go";

if [[ "$1" = "update" ]]; then
  for i in $SSEWEB_REPOS; do
    {
      cd pages/$i;
      git pull origin master;
    } &
  done;
elif [[ "$1" = "run" ]]; then
  shift;
  for i in $SSEWEB_REPOS; do
    {
      cd pages/$i;
      echo "in $(pwd):"
      # git remote add fork https://github.com/7imbrook/$i.git
      eval $@;
      cd ../../;
    }
  done;
else
  for i in $SSEWEB_REPOS; do
    {
      REMOTE="$GIT_ROOT/$i.git";
      git clone --recursive $REMOTE pages/$i;
    } &
  done;
fi
wait;
