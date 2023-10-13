#! /usr/bin/env bash

# Terminate already running bar instances
pkill polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar
polybar example

echo "Bars launched..."
