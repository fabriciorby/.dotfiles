#zmodload zsh/zprof

source ~/.dotfiles/.scripts/zsh-defer/zsh-defer.plugin.zsh

# Defer completion setup to after the prompt
autoload -Uz compinit

# Use a cache (~/.zcompdump) and only rebuild once a day
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  zsh-defer compinit -C   # skip security checks if cache < 24h old
else
  zsh-defer compinit
fi

eval "$(starship init zsh)"

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
zsh-defer source "$HOME/.dotfiles/.scripts/alias.zsh"

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
zsh-defer eval "$(zoxide init zsh)"
alias cd="z"

if [[ -o login ]]; then
  cbonsai -p
fi

export PATH="/Users/fyamamoto/Desktop/projects/utils:$PATH"
export PATH="/Applications/Intellij IDEA CE.app/Contents/MacOS:$PATH"

alias k="kubectl"
zsh-defer source <(kubectl completion zsh)

### copy line to clipboard
function copy_line_to_x_clipboard() {
    echo -n $BUFFER | pbcopy
    zle kill-whole-line
    zle reset-prompt
}
zle -N copy_line_to_x_clipboard
bindkey '^U' copy_line_to_x_clipboard

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

# Powerline
# export PATH="$HOME/Library/Python/3.13/bin:$HOME/.local/bin:$PATH"
# . $HOME/Library/Python/3.13/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#zprof
