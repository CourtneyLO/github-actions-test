#!/bin/sh

TOKEN=$1

echo $TOKEN > token.txt

gh auth login --hostname GitHub.com --with-token < token.txt;
gh pr status
gh pr create --base production --head staging --title "Release to Production" --body "This work has been tested"
