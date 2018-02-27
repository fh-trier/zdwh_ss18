#!/bin/bash

if [ $1 == "date" ]; then
  git log -1 --pretty=format:"%ad" --date=short
elif [ $1 == "commit" ]; then
  git rev-parse --short HEAD
fi
