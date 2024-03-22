#! /bin/bash
LOGDIR=/home/klippy/logs
cd /home/klippy/klipper
source /home/klippy/printer_data/systemd/klipper.env
/home/klippy/klippy-env/bin/python $KLIPPER_ARGS > $LOGDIR/klipper_latest.log &
echo "Klipper pid:"$!
