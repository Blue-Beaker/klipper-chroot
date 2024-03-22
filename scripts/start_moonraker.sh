#! /bin/bash
LOGDIR=/home/klippy/logs
cd /home/klippy/moonraker
source /home/klippy/printer_data/systemd/moonraker.env
/home/klippy/moonraker-env/bin/python $MOONRAKER_ARGS > $LOGDIR/moonraker_latest.log &
echo "Moonraker pid:"$!
