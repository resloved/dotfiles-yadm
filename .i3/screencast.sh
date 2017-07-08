#!/bin/bash

#This is the ffmpeg command that the screencast shortcut in i3 will run.

#Picks a file name for the output file based on availability:

if [[ -f ~/output.mkv ]]
	then
		n=1
		while [[ -f ~/output_$n.mkv ]]
		do
			n=$((n+1))
		done
		filename="output_$n.mkv"
		echo $n
	else
		filename="output.mkv"
fi

#The actual ffmpeg command:

ffmpeg -y \
-f x11grab \
-s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
-i :0.0 \
 -f alsa -i default \
 -c:v ffvhuff -r 30 -c:a flac $filename
