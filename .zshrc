export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshrc="nvim ~/.zshrc"
alias zshsrc="source ~/zshr"
alias vim="nvim"
alias vi="nvim"
alias ll="ls -lash"
alias c="clear"

# jenv stuff
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# fuzzy finder stuff
source <(fzf --zsh)

cbonsai -p
