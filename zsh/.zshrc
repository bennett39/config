# nvm, tarn, node
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
source ~/.nvm/nvm.sh

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
alias ls='gls -CHG --color'
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
alias ga='git add . && git status'
alias gc='git commit -m'
alias gl='git log --oneline'
alias gb='git branch'
alias gk='git checkout'
alias gf='git fetch'
alias gmm='git merge main'
alias gmd='git merge develop'
alias gclean='gk develop && git pull && git branch | grep -v "develop" | xargs git branch -d'
alias gstart='gk develop && git pull && gk -b '
alias gto='git checkout --track'

# Directory & File Aliases
alias vimrc='cd ~/Repos/config/vim/ && vim vimrc'
alias bashrc='cd ~/Repos/config/bash/ && vim bashrc.sh'
alias zshrc='vim ~/Repos/config/zsh/.zshrc'
alias blog='cd ~/Repos/dp-starter-blog/content/blog && git pull'
alias repos='cd ~/Repos'

# Sealed aliases
alias sss='cd ~/Repos/s3'
alias dv='devcontainer --workspace-folder=.'
alias dv-s3='docker exec -it --user vscode s3_devcontainer-app-1 bash'
alias dv-ds3='docker exec -it --user vscode data-services_devcontainer-app-1 bash'
alias sngrok='ngrok http --domain=imp-awaited-caribou.ngrok-free.app 8080'

# Docker aliases
alias dockup='dc up -d'
alias dockdown='dc down'
alias dockbuild='dockup --build'
alias dockboot='dockdown; dockup'
alias dockvolumes='dockdown --volumes'
alias dockwipe='dockvolumes; dockbuild; sleep 5; dockdown; dockup;'
alias dockrun='dc run --rm '

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# gdircolors https://github.com/gibbling/dircolors
eval $(gdircolors ~/.dircolors/dircolors.256dark)

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bennettgarner/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bennettgarner/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bennettgarner/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bennettgarner/google-cloud-sdk/completion.zsh.inc'; fi

# Git ssh
if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `cat $HOME/.ssh/ssh-agent` > /dev/null
   ssh-add $HOME/.ssh/id_ed25519 2> /dev/null
fi
