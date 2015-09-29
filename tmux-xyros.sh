#!/bin/bash

DIR=$1
SESSION="gaiaos"

echo $#
if [ $# -eq 0 ]; then
	echo "Usage: $0 <directory>"
	exit 0
fi

function tmux_gaiaos {
    echo $DIR
    cd $DIR
    tmux start-server
    tmux new-session -s $SESSION -n Lam -d
    tmux new-window -n "manifest"
    tmux send-keys -t $SESSION "cd $DIR/manifest/" C-m
    tmux new-window -n "Base"
    tmux send-keys -t $SESSION "cd $DIR/platform_build" C-m

	tmux attach-session -t $SESSION
}

tmux_gaiaos
