#!/usr/bin/env bash

active_pane="$(tmux display-message -p '#{pane_id}')"

tmux list-panes -F '#{pane_id}' |
while IFS= read -r pane; do
    if [ "$pane" != "$active_pane" ]; then
        tmux resize-pane -t "$pane" -y 1
    fi
done

# Активному pane отдать всё оставшееся пространство.
tmux resize-pane -t "$active_pane" -y 9999
