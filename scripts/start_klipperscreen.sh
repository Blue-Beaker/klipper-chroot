#! /bin/bash
LOGDIR=/home/klippy/logs
DISPLAY=:0
cd /home/klippy/KlipperScreen
/home/klippy/.KlipperScreen-env/bin/python /home/klippy/KlipperScreen/screen.py > $LOGDIR/klipperscreen_latest.log &
echo "KlipperScreen pid:"$!
