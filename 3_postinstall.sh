#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream

# Change the value according to your hdd/sdd.
CORE_UUID=$(blkid -s UUID -o value /dev/nvme1n1p1)
DATA_UUID=$(blkid -s UUID -o value /dev/sda1)

setdirectory() {
    cd /media
    mkdir core data
}

getuuid() {
echo "# /dev/nvme1n1p1
UUID=$CORE_UUID /media/core ext4 rw,user,exec 0 0

# /dev/sda1
UUID=$DATA_UUID /media/data ext4 rw,user,exec 0 0" | tee -a /etc/fstab >/dev/null
}

# Make directory for other hdd/sdd.
setdirectory

# Set UUID of other hdd/sdd in fstab.
getuuid

echo '\033[0;32mRun ./4_fmanager.sh and reboot.'
