#!/bin/sh
set -ex

bundle install
bundle exec jekyll build -d build
cd build

# tell GH not to run jekyll
touch .nojekyll

REMOTE_BRANCH="gh-pages"
REMOTE_REPO="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

git init
git add .
git commit -m "automatic build from Github Action ${GITHUB_ACTION}"
git push --force $REMOTE_REPO master:$REMOTE_BRANCH

cd ..
