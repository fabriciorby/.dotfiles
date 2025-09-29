#zmodload zsh/zprof

# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# plugins=(git)
#
source ~/.dotfiles/.scripts/zsh-defer/zsh-defer.plugin.zsh

eval "$(starship init zsh)"

# Carrega autocompletion do zsh
autoload -Uz compinit
compinit

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
zsh-defer eval "$(jenv init -)"

# fuzzy finder stuff (don't defer)
source <(fzf --zsh)
source ~/.dotfiles/.scripts/fzf-git.sh/fzf-git.sh
source "$HOME/.dotfiles/alias.zsh"

export FZF_ALT_C_OPTS="--preview 'lsd -aa --tree --depth 3 {} | head -200'"
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview '(highlight -O ansi -l {} 2> /dev/null || bat -n --color=always {} || lsd --tree --depth 3 {}) 2> /dev/null | head -200'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"


export EDITOR=nvim

# zoxide stuff
eval "$(zoxide init zsh)"
alias cd="z"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/fabricioyamamoto/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

zsh-defer source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
zsh-defer source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

export PATH="$HOME/Desktop/projects/find-my-namespace:$PATH"
export PATH="$HOME/Desktop/projects/utils:$PATH"
export PATH="/Applications/Intellij IDEA.app/Contents/MacOS:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias k="kubectl"
source <(kubectl completion zsh)

### copy line to clipboard
function copy_line_to_x_clipboard() {
    echo -n $BUFFER | pbcopy
    zle kill-whole-line
    zle reset-prompt
}
zle -N copy_line_to_x_clipboard
bindkey '^U' copy_line_to_x_clipboard

export PATH=$PATH:/Users/fabricioyamamoto/.spicetify

#zprof
