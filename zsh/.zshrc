# nvm, tarn, node
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv & virtualenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/Users/bennettgarner/.local/bin:$PATH"

# zlib & libsodium
HOMEBREW_PREFIX="$(brew --prefix)"
export SODIUM_INSTALL=system
export LIBSODIUM_MAKE_ARGS=-j8
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOMEBREW_PREFIX/lib
export LIBRARY_PATH=$LIBRARY_PATH:$HOMEBREW_PREFIX/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOMEBREW_PREFIX/include
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

# openssl
export PYCURL_SSL_LIBRARY=openssl
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"

export PROMPT="%n %~ "
export TERM=xterm-256color

# Locale
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG="C.UTF-8"

# history
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

# Common commands
alias h='history 1|grep '
alias f='find . |grep '
alias ls='ls -CHG --color'
alias la='ls -ahG'
alias ll='ls -ahlG'
alias v='vim '
alias agq='ag -Q '
alias mkdir="mkdir -pv"
alias dc="docker-compose"
alias grep="grep --color=auto"
alias rst='eval $SHELL'

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
alias gmm='git merge main'
alias gclean='gk main && git pull && git branch | grep -v "main" | xargs git branch -d'
alias gstart='gk main && git pull && gk -b '

# Directory & File Aliases
alias vimrc='cd ~/Repos/config/vim/ && vim vimrc'
alias bashrc='cd ~/Repos/config/bash/ && vim bashrc.sh'
alias zshrc='vim ~/Repos/config/zsh/.zshrc'
alias repos='cd ~/Repos'

# Docker aliases
alias dockup='dc up -d'
alias dockdown='dc down'
alias dockbuild='dockup --build'
alias dockboot='dockdown; dockup'
alias dockvolumes='dockdown --volumes'
alias dockwipe='dockvolumes; dockbuild; sleep 5; dockdown; dockup;'
alias dockrun='dc run --rm '

# Ingigo-specific aliases
alias yeet='yarn test --no-cov --disable-warnings'
alias acorn='cd ~/Repos/acorn'
alias ident='cd ~/Repos/acorn/@app/identity'
alias acct='cd ~/Repos/acorn/@app/accounts'
alias authz='cd ~/Repos/acorn/@app/authz'
alias invit='cd ~/Repos/acorn/@app/invitations'
alias sdk='cd ~/Repos/acorn/@package/'
alias terra='cd ~/Repos/terraform'
alias artifact='dev-cli configure --code-artifact'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Python3
alias python="python3"
alias pip="pip3"

# Set Vim as my default editor
export EDITOR=vim
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# AWS config
export AWS_SDK_LOAD_CONFIG=true

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%} %{$fg[yellow]%}%~ %{$reset_color%}%% "
