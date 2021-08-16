#!/bin/bash

set -e
set -x

echo "Reading input variables"
SOURCE_DIR="$1"
DESTINATION_REPOS_BRANCHES="$2"
WORK_DIR=`pwd`

git config --global user.email "$GIT_USEREMAIL"
git config --global user.name "$GIT_USERNAME"

printf "\n\n $SOURCE_DIR \n $DESTINATION_REPOS_BRANCHES \n\n"

for repo in $DESTINATION_REPOS_BRANCHES
do
  cd $WORK_DIR
  CLONE_DIR=$(mktemp -d)

  arrRepo=(${repo//:/ })

  echo "${arrRepo[0]}"
  echo "${arrRepo[1]}"

  echo "Cloning destination git repository: $repo"
  git clone --single-branch --branch ${arrRepo[1]} "https://x-access-token:$API_TOKEN_GITHUB@${arrRepo[0]}" "$CLONE_DIR"
  ls -al $CLONE_DIR
  ls -al $CLONE_DIR/
  cp -a "$SOURCE_DIR/." "$CLONE_DIR/"
  cd "$CLONE_DIR"
  git add .

  if git status | grep -q "Changes to be committed"
  then
    git status
    git commit -m "checking files"
    git push origin ${arrIN[1]}
  else
    echo "No changes detected"
  fi
done
