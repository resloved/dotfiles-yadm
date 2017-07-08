[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xrandr --output DVI-D-0 --mode 1920x1080 --output HDMI-0 --mode 1920x1080 --left-of DVI-D-0
exec i3
