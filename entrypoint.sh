#!/bin/sh
set -ex

bundle install
bundle exec jekyll build -d build
cd build

# tell GH not to run jekyll
touch .nojekyll

git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
git commit -m "automatic build from ${GITHUB_WORKFLOW}/${GITHUB_ACTION}"

set +x # don't print token
git push --force "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" master:gh-pages
set -x
