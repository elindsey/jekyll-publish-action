#!/bin/sh
set -ex

# GITHUB_REPOSITORY is of the form user/repo-name
REPO=$(echo ${GITHUB_REPOSITORY} | cut -f2 -d'/')
cd "${GITHUB_WORKSPACE}/${REPO}"
bundle install
bundle exec jekyll build -d build
cd build

# tell GH not to run jekyll
touch .nojekyll

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

git init
git add .
git commit -m "automatic build from Github Action ${GITHUB_ACTION}"

set +x # don't print token
git push --force "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" master:gh-pages
set -x
