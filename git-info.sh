#!/bin/bash

if [ $1 == "date" ]; then
  git log -1 --pretty=format:"%ad" --date=short
elif [ $1 == "commit" ]; then
  if [[ -z ${VERSION+x} || ${#VERSION} -le 0 ]]; then
    git rev-parse --short HEAD
  else
    echo ${VERSION}
  fi
elif [ $1 == "url" ]; then
  URL=$(git config --get remote.origin.url | sed -e 's#^git@#https://#' -e 's#systems:#systems/#' -e 's#_#\\_#g' -e 's#.git$##' )
  if [ -z "$URL" ]; then
    echo "https://git.cryptic.systems"
  else
    echo $URL
  fi
fi
