#!/bin/bash
tmux new-session -d '/obsr/bin/startup.sh'
tmux split-window -v 'sleep 5 && tail -F logs/obs_context*'
tmux attach-session -d
