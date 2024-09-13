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

bindkey "^F" forward-word
bindkey "^B" backward-word
bindkey "^D" backward-kill-word

# jenv stuff
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# fuzzy finder stuff
source <(fzf --zsh)

cbonsai -p
