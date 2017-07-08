#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar
MONITOR=HDMI-0 polybar main_bar &
MONITOR=DVI-D-0 polybar main_bar &

echo "Bars launched..."
