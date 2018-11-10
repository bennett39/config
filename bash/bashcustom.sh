#!/bin/bash

function gs() {
    git status
}

function gl() {
    git pull origin $1
}

function gh() {
    git push
}

function ga() {
    git add .
    git status
}

function gc() {
    git commit -m "$1"
}

function v() {
	vim $1
}

function log39() {
	vim ~/Workspace/git-repos/100-days-of-code/log.md
}

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
