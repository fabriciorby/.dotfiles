#!/usr/bin/env bash
set -eo pipefail
IFS=$'\n\t'

# Inspired (and I mean copy-pasted hehe) from https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-sessionizer
# I hope to update/change this to my needs some day
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$((find ~/Desktop/projects/ ~/Desktop/projects/waes -mindepth 1 -maxdepth 1 -type d -exec sh -c "echo {} | cut -d '/' -f 6-" \;; echo 'dotfiles') | fzf)
fi

function get_absolute_path() {
    if [[ "$1" == "dotfiles" ]]; then
        echo "$HOME/.$1"
    else
        echo "$HOME/Desktop/projects/$selected"
    fi
}

path="$(get_absolute_path "$selected")"
tmux_running=$(pgrep tmux || true)

# echo "DEBUG:"
# echo "  selected = $selected"
# echo "  path     = $path"
# echo "  tmux_running = $tmux_running"

if [[ -z "$path" ]]; then
    echo "path vazio"
    exit 0
fi

tmuxinator start project -n $selected workspace=$path
exit 0

if [[ -z "$tmux_running" ]]; then
    # echo "Nenhum tmux rodando → criando e entrando na sessão $selected"
    exec tmux new-session -s "$selected" -c "$path"
fi

if ! tmux has-session -t="$selected" 2>/dev/null; then
    # echo "Sessão não existe → criando $selected"
    tmux new-session -ds "$selected" -c "$path"
fi

if [[ -n "$TMUX" ]]; then
    # echo "Dentro do tmux → switch-client para $selected"
    tmux switch-client -t "$selected"
else
    # echo "Fora do tmux → attach na sessão $selected"
    exec tmux attach-session -t "$selected"
fi
