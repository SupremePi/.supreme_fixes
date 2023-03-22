#!/bin/bash
(nohup python /home/pi/.tamoplus/BGM.py > /dev/null 2>&1) &
#isdual=`tvservice -l |grep "2 attached device" |wc -l`
if [[ $isdual == "1" ]]; then
fbset -fb /dev/fb0 -g 1920 1080 1920 1080 16
/usr/bin/python /opt/retropie/configs/all/PieMarquee2/PieMarquee2.py &
fi
#/home/pi/scripts/themerandom.sh
#/opt/retropie/configs/all/attractmode/ambootcheck/amromcheck.sh
emulationstation #auto
#/opt/retropie/configs/all/emulationstation/scripts/shutdown/exit-splash
pgrep -f "BGM.py" |xargs sudo kill -9 > /dev/null 2>&1 &
pgrep -f pngview|xargs sudo kill -9 > /dev/null 2>&1 &
