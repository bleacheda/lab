#!/bin/bash

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

    git switch master
    if [[ "$branch" != "master" && "$branch" != "cleanup" ]]; then
        git branch -D "$branch"
    fi

done
