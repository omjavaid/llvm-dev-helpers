#!/bin/bash

# Check if the current directory is a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: This is not a Git repository."
    exit 1
fi

# Check if a PR number is provided
if [ -z "$1" ]; then
    echo "Error: No PR number provided. Usage: ./fetch_pr.sh <PR_NUMBER>"
    exit 1
fi

PR_NUMBER=$1
BRANCH_NAME="pr-$PR_NUMBER"

# Fetch the pull request and create a branch
if git fetch origin pull/$PR_NUMBER/head:$BRANCH_NAME; then
    echo "Successfully fetched PR #$PR_NUMBER into branch '$BRANCH_NAME'."
else
    echo "Error: Failed to fetch PR #$PR_NUMBER. Cleaning up."
    git branch -D $BRANCH_NAME > /dev/null 2>&1
    exit 1
fi

# Check out the new branch
if git checkout $BRANCH_NAME; then
    echo "Checked out to branch '$BRANCH_NAME'."
else
    echo "Error: Failed to check out to branch '$BRANCH_NAME'. Cleaning up."
    git branch -D $BRANCH_NAME > /dev/null 2>&1
    exit 1
fi

