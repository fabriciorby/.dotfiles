export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias e="nvim ~/.zshrc"
alias r="source ~/.zshrc"
alias vim="nvim"
alias vi="nvim"
alias ls="lsd"
alias ll="ls -la"
alias lt="ls -aa --tree"
alias c="clear"
alias cat="bat"
alias uri="jq -srR @uri"
alias urid="jq -srR @urid" #will only work with jq > 1.7.1
alias html="jq -srR @html"

bindkey "^F" forward-word
bindkey "^B" backward-word
bindkey "^D" backward-kill-word

# jenv stuff
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# fuzzy finder stuff
source <(fzf --zsh)
source ~/.dotfiles/.scripts/fzf-git.sh/fzf-git.sh

# zoxide stuff
eval "$(zoxide init zsh)"
alias cd="z"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/fyamamoto/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

export PATH="/Users/fyamamoto/Desktop/projects/find-my-namespace:$PATH"
export PATH="/Users/fyamamoto/Desktop/projects/utils:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
