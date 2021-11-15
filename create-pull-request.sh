#!/bin/sh

TOKEN=$1
GITHUB_REF=$2

echo $TOKEN > token.txt
echo $GITHUB_REF

gh auth login --hostname GitHub.com --with-token < token.txt;
gh pr view
gh pr create --base production --head main --title "Release to Production ${GITHUB_REF}" --body "This work has been tested"
gh workflow run production.yml -F confirmation=YES
