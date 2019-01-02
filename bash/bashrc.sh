#!/bin/bash

# Git
alias gs='git status'
alias gl='git pull origin '
alias gh='git push'
alias ga='git add . && git status'
alias gc='git commit -m '

# Vim
alias v='vim '

# Directory traversal
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

mkd(){
    mkdir -p $1
    cd $1
}

# Common commands
alias h='history|grep '
alias f='find . |grep '
alias ls='ls -CF --color=auto'
alias la='ls -ah --color=auto'
alias ll='ls -ahl --color=auto'

# Common files/directories
alias repos='cd ~/Workspace/git-repos'
alias log39='cd ~/Workspace/git-repos/100-days-of-code/ && vim log.md'
alias bashrc='cd ~/Workspace/git-repos/hello-world/bash/ && vim bashrc.sh'
alias vimrc='cd ~/Workspace/git-repos/hello-world/vim/ && vim vimrc'
alias euler='cd ~/Workspace/git-repos/euler'
alias feed='cd ~/Workspace/git-repos/dev-feed/'
alias tbot='cd ~/Workspace/git-repos/twitter-bot'
alias myEnv='source ~/myEnv/bin/activate'
alias sudoku='cd ~/Workspace/git-repos/sudoku-solver'
alias python='python3.6'

# Prompt color
export PS1="\[\e[1m\e[95m\]\u\[\e[m\]\[\e[95m\]:\[\e[m\]\[\e[1m\e[96m\]\W\[\e[m\]\\$ "

# Let there be color in grep!
export GREP_OPTIONS='--color=auto'

# Set Vim as my default editor
export EDITOR=vim

# UTF-8 locale
export LANG="C.UTF-8"

# History
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=100
HISTFILESIZE=2000
HISTTIMEFORMAT="%Y-%m-%d %H:%M.%S | "

# Updates PATH for the Google Cloud SDK.
if [ -f '/home/bennett/Workspace/git-repos/learning/gcloud/google-cloud-sdk/path.bash.inc' ]; then . '/home/bennett/Workspace/git-repos/learning/gcloud/google-cloud-sdk/path.bash.inc'; fi

# Enables shell command completion for gcloud.
if [ -f '/home/bennett/Workspace/git-repos/learning/gcloud/google-cloud-sdk/completion.bash.inc' ]; then . '/home/bennett/Workspace/git-repos/learning/gcloud/google-cloud-sdk/completion.bash.inc'; fi

# pyenv stuff https://github.com/yyuu/pyenv
for pyenv_path in /usr/local/var/pyenv /opt/pyenv; do
    if [[ -d $pyenv_path ]]; then
        export PYENV_ROOT=$pyenv_path
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)";
        break
    fi
done

# pyenv-virtualenv stuff
$ echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
