#!/bin/sh

TOKEN=$1

echo $TOKEN > token.txt

gh auth login --hostname GitHub.com --with-token < token.txt;
gh pr create --base staging
