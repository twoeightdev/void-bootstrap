#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream
# Change the value of User in int_transmission
CORE_UUID=$(blkid -s UUID -o value /dev/nvme1n1p1)
DATA_UUID=$(blkid -s UUID -o value /dev/sda1)

# Make dir for games and data
setdirectory() {
    cd /media
    mkdir core data
}

# Dump UUID to fstab
getuuid() {
echo "# /dev/nvme1n1p1
UUID=$CORE_UUID /media/core ext4 rw,user,exec 0 0

# /dev/sda1
UUID=$DATA_UUID /media/data ext4 rw,user,exec 0 0" | tee -a /etc/fstab >/dev/null
}

echo 'directory created'
setdirectory

echo 'uuid'
getuuid

echo 'Run ./4_fmanager.sh and reboot'
