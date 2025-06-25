#!/bin/bash

# files to delete
files_to_delete=("path/to/file1.txt" "path/to/file2.txt")

# fetch everything from the remote
git fetch --all

branches=() # initialize empty array to store each branch name

shopt -s extglob # turn on bash `extglob` to enable *( ) pattern matching

# Get clean list of remote branches
while IFS= read -r remote; do
    branch=${remote##*( )}               # strip leading spaces from `git branch -r` output
    branch=${branch#origin/}             # isolate the branch name
    branches+=("$branch")                # build the branches array
done < <(git branch -r | grep -v 'HEAD') # list all remote branches and feed the output to the loop

shopt -s extglob # turn off `extglob`

# Loop through each branch
for branch in "${branches[@]}"; do
    printf "Processing branch: $branch\n"

    # Create and check out the remote branch locally (overwrite if exists, basically syncs local with remote)
    git fetch origin "$branch"
    git switch --force-create "$branch" "origin/$branch" || git switch "$branch"
    # this will either create local branches that you don't have
    # or overwrite the ones you do, even if their status is different than the remote
    # same result as a `git reset origin $branch` but it completely replaces the local branch

    # Delete the files
    for file in "${files_to_delete[@]}"; do
        git rm -f --ignore-unmatch "${file}" # if the file doesn't exist just ignore it and move on
    done

    # Commit only if there are staged changes
    if git diff --cached --quiet; then # there was nothing to delete
        echo "Nothing to commit on $branch"
    else
        git commit -m "Delete unused files"
        git push origin "$branch"
    fi

done
