#!/bin/sh

TOKEN=$1

echo $TOKEN > token.txt

gh auth login --hostname GitHub.com --with-token < token.txt;
gh pr view
gh pr create --base production --head main --title "Release to Production" --body "This work has been tested"
gh workflow run production.yml -f confirmation=YES
