#!/bin/bash

# This script creates a new project repository from template.

export PROJECT_NAME='pathgentest2'
curl -u 'nsheff' https://api.github.com/orgs/databio/repos -d "{\"name\":\"${PROJECT_NAME}\", \"private\": true}"
gclo databio/newproject
mv newproject $PROJECT_NAME
cd $PROJECT_NAME
git init
git add .
git commit -m "First commit"
git remote set-url origin git@github.com:databio/${PROJECT_NAME}.git
git push -u origin master
