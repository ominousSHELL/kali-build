#!/bin/zsh

#^Timer
function startTimer {
        if [[ $1 == "" ]]; then
                echo "Usage: timer [min]"
                return
        fi
        #Check if tmux is running
        tmux list-sessions 2>&1 >/dev/null
        if [[ $? == 1 ]];then
                echo "Tmux not running..."
                echo "Exiting..."
                return
        fi

        echo "Starting timer for $1 minutes..."
        python ~/ominousSHELL/scripts/python/timer.py $1&disown
}
#$Timer

