#!/bin/bash

# Copyright 2021 Ankur Sinha
# Author: Ankur Sinha <sanjay DOT ankur AT gmail DOT com> 
# File : update.sh
#
# build the planet and commit

if ! command -v git; then
    echo "Git is required."
    exit -1
else
    git pull --force
fi

if ! command -v pluto; then
    gem install pluto rss
fi

pluto --err build planet.ini -t neuroscience -o docs

# Rename file
pushd docs
    if [ -f "planet.neuroscience.html" ]; then
        mv planet.neuroscience.html index.html
    fi
popd

git add .
git commit -m "Regenerated"
git push -u origin master

exit 0
