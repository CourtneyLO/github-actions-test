#!/bin/sh

TOKEN=$1

echo $TOKEN > token.txt

gh auth login --hostname GitHub.com --with-token < token.txt;
gh pr view
gh pr create --base production --head main --title "Release to Production" --body "For changes see commits below"
gh workflow run production.yml -F confirmation=YES
