# GitHub Pull Request Fetcher

This repository contains scripts to fetch a GitHub pull request (PR) by its number and create a new branch for testing. These scripts are available for both Linux/macOS (Bash) and Windows (Batch) environments. 
The script ensure that the current working directory is a Git repository and that the PR number is valid. If any step fails, the scripts automatically revert any changes made.

## Scripts

- **fetch_pr.sh**: Bash script for Linux/macOS.
- **fetch_pr.bat**: Batch script for Windows.

## Prerequisites

- **Git** must be installed and available in your system's PATH.
- The scripts should be run in a Git repository's root directory.

## Usage

### Linux/macOS (Bash)

1. Open a terminal.
2. Navigate to the Git repository where you want to fetch the pull request.
3. Run the script with the PR number as an argument:

   ```bash
   ./fetch_pr.sh <PR_NUMBER>

