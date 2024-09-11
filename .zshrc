export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias e="nvim ~/.zshrc"
alias r="source ~/.zshrc"
alias vim="nvim"
alias vi="nvim"
alias ll="ls -lash"
alias c="clear"

# jenv stuff
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# fuzzy finder stuff
source <(fzf --zsh)

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/fyamamoto/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

export PATH="/Users/fyamamoto/Desktop/projects/find-my-namespace:$PATH"
export PATH="/Users/fyamamoto/Desktop/projects/utils:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
