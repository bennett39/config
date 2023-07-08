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
    mkdir $1
    cd $1
}

# Checkout remote branch
gto(){
    git checkout --track origin/$1
}

gstart(){
    git checkout master
    git pull
    git checkout -b CUBE-$1
}

# Common commands
alias h='history|grep '
alias f='find . |grep '
alias ls='gls -CHG --color'
alias la='ls -ahG'
alias ll='ls -ahlG'
alias v='vim '
alias agq='ag -Q '
alias mkdir="mkdir -pv"
alias dc="docker-compose"

# Remove newlines at end of file, recursively
alias rmnew="find . -type f -name '*.html' -exec sed -i '' -e :a -e '/^\n*$/{$d;N;};/\n$/ba' {} \;"

# Git
alias gs='git status'
alias gp='git pull origin '
alias gh='git push'
alias ga='git add . && git status && ag "pdb" --py'
alias gc='git commit -m'
alias gl='git log --oneline'
alias gb='git branch'
alias gk='git checkout'
alias gf='git fetch'
alias gmm='git merge master'
alias gclean='gk master && git pull && git branch | grep -v "master" | xargs git branch -d'

# Directory & File Aliases
alias vimrc='cd ~/Repos/config/vim/ && vim vimrc'
alias bashrc='cd ~/Repos/config/bash/ && vim bashrc.sh'
alias repos='cd ~/Repos'
alias cubeweb='cd ~/Repos/cube_planning/web'
alias cubedocs='cd ~/Repos/cube_planning/api-docs'
alias journal='cd ~/Repos/daily39 && vim journal.md'

# Postgres start
alias pgstart='sudo /etc/init.d/postgresql restart'

# Cube aliases
alias dockup='dc up -d'
alias dockjs='dc -f docker-compose.js-dev.yml up -d'
alias dockdown='dc down'
alias dockbuild='dockup --build'
alias dockboot='dockdown; dockup'
alias dockvolumes='dockdown --volumes'
alias dockwipe='dockvolumes; dockbuild; sleep 5; dockdown; dockup;'
alias dockrun='dc run --rm web'
alias dockdj='dockrun /bin/bash'
alias dockdb='docker exec -it cube_mysql_db /bin/bash'
alias dockwork='docker logs -f cube_planning_worker'
alias docklogs='docker logs -f cube_planning'
alias dockmanage='dockrun python manage.py'
alias docktest='dockmanage test --noinput'
alias clearly='docker run --rm --network host -ti --name clearly-client -v ipythonhist:/root/.ipython/profile_default/ rsalmei/clearly client'
alias clearmir='clearly clearly-mirror.infra.cubesoftware.com 12223'
alias clearprod='clearly clearly-prod.infra.cubesoftware.com 12223'
alias ngrok='/Applications/ngrok'

# Prompt color
export PS1="\[\e[1m\e[95m\]\u\[\e[m\]\[\e[95m\]:\[\e[m\]\[\e[1m\e[96m\]\W\[\e[m\]\\$ "

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Let there be color in grep!
alias grep="grep --color=auto"

# Python3
alias python="python3"
alias pip="pip3"

# Set Vim as my default editor
export EDITOR=vim

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Node version
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Colors in ls command
eval $(gdircolors ~/.dircolors/dircolors.256dark)

# Silence Mac OS zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Virtualenv init
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# poetry init
export PATH="/Users/bennettgarner/.local/bin:$PATH"

# Go in path
export PATH=$PATH:/usr/local/go/bin

# load profile
if [ -f ~/.bash_profile ]; then source ~/.bash_profile; fi
