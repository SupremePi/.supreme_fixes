#!/bin/bash
#!/bin/sh

echo "$1;$3" > /tmp/lastplayed
/home/pi/.attract/scripts/amlastplayed.sh

### Begin VideoLoading Screens Function
enablevideolaunch="true"
videoloadingscreens="/home/pi/RetroPie/videoloadingscreens/supremeteam"
if [[ $enablevideolaunch == "true" ]]; then
	# Extract file name from called ROM
	gname="$(basename "$3")"
	# build path to file and remove extension from ROM to add mp4 extension
	# $HOME variable will help users that are not stick to raspberry ;)
	ifgame="$videoloadingscreens/$1/${gname%.*}.mp4"
	ifsystem="$videoloadingscreens/$1.mp4"
	default="$videoloadingscreens/default.mp4"
	# If condition to check filename with -f switch, f means regular file
	if [[ -f $ifgame ]]; then
		omxplayer --vol 250 --amp 250 -b "$ifgame" > /dev/null 2>&1
	elif [[ -f $ifsystem ]]; then
		omxplayer --vol 250 --amp 250 -b "$ifsystem" > /dev/null 2>&1
	elif [[ -f $default ]]; then
		omxplayer --vol 250 --amp 250 -b "$default" > /dev/null 2>&1
	fi
fi
### End VideoLoading Screens Function

[[ $2 == openbor-6xxx ]] && filename=$(basename "$3") && cp "/opt/retropie/configs/ports/openbor/Saves/default.cfg" "/opt/retropie/configs/ports/openbor/Saves/${filename%.*}.cfg"
[[ $2 == openbor ]] && filename=$(basename "$3") && cp "/opt/retropie/configs/ports/openbor/Saves/default.cfg" "/opt/retropie/configs/ports/openbor/Saves/${filename%.*}.cfg"
[[ $2 == openbor-v6510-RPI4 ]] && filename=$(basename "$3") && cp "/opt/retropie/configs/ports/openbor/Saves/default.cfg" "/opt/retropie/configs/ports/openbor/Saves/${filename%.*}.cfg"
# source /opt/retropie/configs/all/xboxdrvstart.sh > /dev/null 2>&1
pkill -f -STOP BGM.py
pgrep -f pngview | xargs sudo kill -9 > /dev/null 2>&1
