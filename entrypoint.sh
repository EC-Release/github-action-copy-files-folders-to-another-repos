#!/bin/bash

set -e
set -x

echo "Reading input variables"
DESTINATION_REPOS_BRANCHES="$1"
WORK_DIR=`pwd`

git config --global user.email "$GIT_USEREMAIL"
git config --global user.name "$GIT_USERNAME"

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
  cp -R "k8s/pkg" "$CLONE_DIR/"
  cd "$CLONE_DIR"
  git add .

  if git status | grep -q "Changes to be committed"
  then
    git status
    git commit -m "checking files"
#    git push origin ${arrIN[1]}
  else
    echo "No changes detected"
  fi
done
