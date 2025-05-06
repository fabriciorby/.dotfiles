#!/usr/bin/env bash
set -eo pipefail
IFS=$'\n\t'

# Inspired (and I mean copy-pasted hehe) from https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-sessionizer
# I hope to update/change this to my needs some day
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Desktop/projects/ ~/Desktop/projects/personal/ -mindepth 1 -maxdepth 1 -type d -exec sh -c "echo {} | cut -d '/' -f 6-" \; | fzf)
fi

absolute_path="$HOME/Desktop/projects/$selected"

if [[ -z $absolute_path ]]; then
    exit 0
fi

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected" -c "$absolute_path"
    exit 0
fi

if ! tmux has-session -t="$selected" 2> /dev/null; then
    tmux new-session -ds "$selected" -c "$absolute_path"
fi

tmux switch-client -t "$selected"
