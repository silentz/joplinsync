#!/bin/bash

cd repo

while true
do
    if [[ $(git status -s | wc -l) -gt 0 ]]; then
        # add all changes
        git add .

        # commit changes with a timestamp
        commit_message="Update on $(date +'%Y-%m-%d %H:%M:%S')"
        git commit -m "$commit_message"

        # push changes to remote repository
        export GIT_SSH_COMMAND="ssh -i $GIT_KEY_FILE -o StrictHostKeyChecking=no"
        git remote | xargs git push
    fi

    sleep 30
done
