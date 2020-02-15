#!/bin/sh

msg="building handbook $(date)"

# If a command fails then the deploy stops
set -e

# 复制 README.md
cp README.md docs/README.md

# 更新 master
git add .
git commit -m "$msg"
git push -f https://github.com/perfectspr/handbook.git master

# 更新 gh-pages
cd docs/
git init
git add -A
git commit -m "$msg"
git push -f https://github.com/perfectspr/handbook.git master:gh-pages
