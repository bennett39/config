#!/bin/bash

alias gs='git status'
alias gl='git pull origin '
alias gh='git push'
alias ga='git add . && git status'
alias gc='git commit -m '

alias v='vim '

alias log39='cd ~/Workspace/git-repos/100-days-of-code/ && vim log.md'

up(){
    local d=""
    limit=$1
        for ((i=1 ; i <= limit ; i++))
            do
                d=$d/..
            done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}

alias h="history|grep "
alias f="find . |grep "

# Updates PATH for the Google Cloud SDK.
if [ -f '/home/bennett/Workspace/git-repos/learning/gcloud/google-cloud-sdk/path.bash.inc' ]; then . '/home/bennett/Workspace/git-repos/learning/gcloud/google-cloud-sdk/path.bash.inc'; fi

# Enables shell command completion for gcloud.
if [ -f '/home/bennett/Workspace/git-repos/learning/gcloud/google-cloud-sdk/completion.bash.inc' ]; then . '/home/bennett/Workspace/git-repos/learning/gcloud/google-cloud-sdk/completion.bash.inc'; fi
