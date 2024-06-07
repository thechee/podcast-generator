#!/bin/bash
source /opt/venv/bin/activate

echo "==================="

git config --global user.name "{GITHUB_ACTOR}"
git config --global user.email "{INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

python3 /usr/src/app/feed.py

git add . && git commit -m "Update Feed"

git push --set-upstream origin/main

echo "==================="