# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History config
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="%Y-%m-%d %H:%M.%S | "

# Locale
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG="C.UTF-8"

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#!/bin/bash

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

# Directory creation
mkd(){
    mkdir -p $1
    cd $1
}

# Common commands
alias h='history|grep '
alias f='find . |grep '
alias ls='ls -CHG'
alias la='ls -ahG'
alias ll='ls -ahlG'
alias v='vim '

# Git
alias gs='git status'
alias gp='git pull origin '
alias gh='git push'
alias ga='git add . && git status && ack "pdb"'
alias gc='git commit -m '
alias gl='git log --oneline'
alias gb='git branch'
alias gk='git checkout'

# Directory  & File Aliases
alias vimrc='cd ~/Repos/config/vim/ && vim vimrc'
alias bashrc='cd ~/Repos/config/bash/ && vim bashrc.sh'
alias repos='cd ~/Repos'
alias cubeweb='cd ~/Repos/cube_planning/web'
alias journal='cd ~/Repos/daily39 && vim journal.md'

# Postgres start
alias pgstart='sudo /etc/init.d/postgresql restart'

# Cube aliases
alias dockup='docker-compose up -d'
alias dockdown='docker-compose down'
alias dockbuild='dockup --build'
alias dockboot='dockdown; dockup'
alias dockvolumes='dockdown --volumes'
alias dockwipe='dockvolumes; dockbuild; sleep 10; dockdown; dockup;'
alias dockdj='docker exec -it cube_planning /bin/bash'
alias dockdb='docker exec -it cube_planning_mysql_db /bin/bash'
alias dockwork='docker logs -f cube_planning_worker'
alias docklogs='docker logs -f cube_planning'
alias ngrok='/Applications/ngrok'

# Prompt color
export PS1="\[\e[1m\e[95m\]\u\[\e[m\]\[\e[95m\]:\[\e[m\]\[\e[1m\e[96m\]\W\[\e[m\]\\$ "

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Let there be color in grep!
alias grep="grep --color=auto"

# Set Vim as my default editor
export EDITOR=vim

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# load profile
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi
