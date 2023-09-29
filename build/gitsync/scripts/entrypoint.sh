#!/bin/bash

while true
do
    if [[ $(git status -s | wc -l) -gt 0 ]]; then
        # Commit changes with a timestamp
        commit_message="Update on $(date +'%Y-%m-%d %H:%M:%S')"
        git commit -m "$commit_message"

        # Push changes to all remote repositories
        export GIT_SSH_COMMAND="ssh -i $GIT_KEY_FILE"
        git push origin master
    fi

    sleep 1
done
