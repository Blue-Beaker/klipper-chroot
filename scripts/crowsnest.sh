#! /bin/bash

LOGDIR=/home/klippy/logs
cd /home/klippy/crowsnest
source /home/klippy/printer_data/systemd/crowsnest.env
/usr/local/bin/crowsnest $CROWSNEST_ARGS > $LOGDIR/crowsnest_latest.log &
echo "Crowsnest pid:"$!
