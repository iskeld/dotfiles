export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

plugins=(git zsh-nvm)

source $ZSH/oh-my-zsh.sh

alias vim=nvim

alias gdto='git difftool -d'
alias gdtos='git difftool -d --staged'

export VISUAL='nvim'
export EDITOR=$VISUAL
export ERL_FLAGS='-kernel shell_history enabled'

if [ -d "$HOME/go" ]
then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

if [ -d "$HOME/.cargo/bin" ]
then
    export PATH=$PATH:$HOME/.cargo/bin
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
