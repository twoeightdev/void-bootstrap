#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream

postefi() {
    sed -i 's|Void Linux with kernel ${major_version}|Void|g' /etc/kernel.d/post-install/50-efibootmgr
    sed -i 's|Void Linux with kernel ${major_version}|Void|g' /etc/kernel.d/post-remove/50-efibootmgr
}

# Efibootmgr post install and remove
postefi
