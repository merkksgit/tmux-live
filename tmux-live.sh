#!/bin/bash
# Default port
port=5050

# Check if first argument is a number (port)
if [[ $1 =~ ^[0-9]+$ ]]; then
    port="$1"
    selected="$(find ~/Koulu ~/github_repositories/ ~/projects -mindepth 1 -maxdepth 1 -type d | fzf-tmux -p 50% --header='Open live server:')"
elif [[ $# -eq 1 ]]; then
    selected="$1"
else
    selected="$(find ~/Koulu ~/github_repositories/ ~/projects -mindepth 1 -maxdepth 1 -type d | fzf-tmux -p 50% --header='Open live server:')"
fi

if [[ -z "$selected" ]]; then
    exit 0
fi

selected_name="$(basename "$selected" | tr . _)"
tmux_running="$(pgrep tmux)"

if [[ -z "$tmux_running" ]]; then
    # Create new session and start live-server without attaching
    tmux new-session -d -s "$selected_name" -c "$selected" "echo 'Starting live-server...'; live-server --port=$port --no-browser"
    sleep 1
    xdg-open "http://localhost:$port"
    exit 0
fi

if ! tmux has-session -t="$selected_name" 2> /dev/null; then
    # Create new detached session and start live-server
    tmux new-session -d -s "$selected_name" -c "$selected" "echo 'Starting live-server...'; live-server --port=$port --no-browser"
    sleep 1
    xdg-open "http://localhost:$port"
fi
