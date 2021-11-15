#!/bin/sh

TOKEN=$1

echo $TOKEN > token.txt

gh auth login --hostname GitHub.com --with-token < token.txt;
echo gh pr view > pr.txt
gh pr create --base production --head main --title "Release to Production" --body-file pr.txt
gh workflow run production.yml -F confirmation=YES
