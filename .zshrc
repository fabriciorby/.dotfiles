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

export FZF_ALT_C_OPTS="--preview 'lsd -aa --tree --depth 3 {} | head -200'"
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview '(highlight -O ansi -l {} 2> /dev/null || bat -n --color=always {} || lsd --tree --depth 3 {}) 2> /dev/null | head -200'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# zoxide stuff
eval "$(zoxide init zsh)"
alias cd="z"

cbonsai -p

export PATH="/Users/fyamamoto/Desktop/projects/utils:$PATH"
export PATH="/Applications/Intellij IDEA CE.app/Contents/MacOS:$PATH"

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

defaults write .GlobalPreferences com.apple.mouse.scaling -1

### TizenStudio shit
export TIZEN_HOME=~/tizen-studio
export PATH=${PATH}:~/tizen-studio/tools
export PATH=${PATH}:~/tizen-studio/tools/ide/bin
export ANDROID_HOME=/opt/homebrew/share/android-commandlinetools

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

