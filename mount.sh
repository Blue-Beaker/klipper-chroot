#! /bin/bash
DISPLAY=:0
xhost +local:
sudo mount -t proc proc ./rootfs/proc
sudo mount -t sysfs sys ./rootfs/sys

bind_chroot() {
    sudo mount --bind $1 ./rootfs/$1
}
bind_chroot /dev
bind_chroot /dev/pts
bind_chroot /etc/hosts
bind_chroot /etc/resolv.conf
