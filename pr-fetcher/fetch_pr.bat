@echo off
setlocal

:: Check if we are in a Git repository
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo Error: This is not a Git repository.
    exit /b 1
)

set /a "PR_NUMBER=%1" 2>nul
if errorlevel 1 (
    echo Error: PR number should be a valid integer.
    exit /b 1
)

set "BRANCH_NAME=pr-%PR_NUMBER%"

:: Fetch the pull request and create a branch
git fetch origin pull/%PR_NUMBER%/head:%BRANCH_NAME%
if errorlevel 1 (
    echo Error: Failed to fetch PR #%PR_NUMBER%. Cleaning up.
    git branch -D %BRANCH_NAME% >nul 2>&1
    exit /b 1
)

:: Check out the new branch
git checkout %BRANCH_NAME%
if errorlevel 1 (
    echo Error: Failed to check out to branch '%BRANCH_NAME%'. Cleaning up.
    git branch -D %BRANCH_NAME% >nul 2>&1
    exit /b 1
)

echo Successfully fetched PR #%PR_NUMBER% and checked out to branch '%BRANCH_NAME%'.

