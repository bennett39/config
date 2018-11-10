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
