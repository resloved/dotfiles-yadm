[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xrandr --output HDMI-0 --mode 1920x1080 --output DVI-D-0 --mode 1680x1050 --above HDMI-0 --output DP-1 --mode 1920x1080 --left-of HDMI-0
exec i3
