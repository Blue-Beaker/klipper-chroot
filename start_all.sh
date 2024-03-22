#! /bin/bash
sudo chroot ./rootfs /bin/sudo -u klippy bash -c "cd /home/klippy/scripts/;bash start_all.sh"
sudo chroot ./rootfs /bin/bash -c "cd /home/klippy/scripts/;bash nginx.sh stop;bash nginx.sh start"
