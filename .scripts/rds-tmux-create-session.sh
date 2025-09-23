#!/usr/bin/env bash
set -eo pipefail
IFS=$'\n\t'

# Inspired (and I mean copy-pasted hehe) from https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-sessionizer
# I hope to update/change this to my needs some day
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$((find ~/Desktop/projects/ ~/Desktop/projects/personal/ -mindepth 1 -maxdepth 1 -type d -exec sh -c "echo {} | cut -d '/' -f 6-" \;; echo '.dotfiles') | fzf)
fi

function get_absolute_path() {
    if [[ "$1" == ".dotfiles" ]]; then
        echo "$HOME/$1"
    else
        echo "$HOME/Desktop/projects/$selected"
    fi
}

if [[ -z "$(get_absolute_path $selected)" ]]; then
    exit 0
fi

tmux_running=$(pgrep tmux)

if ! tmux has-session -t="$selected" 2> /dev/null; then
    tmux new-session -ds "$selected" -c "$(get_absolute_path $selected)"
fi

tmux switch-client -t $(echo "$selected" | tr . _)
if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$selected"
else
    tmux attach-session -t "$selected"
fi
