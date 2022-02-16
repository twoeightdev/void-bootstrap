#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream

postremove() {
    cat >~/ignore.conf <<'EOF'
ignorepkg=btrfs-progs
ignorepkg=f2fs-tools
ignorepkg=ipw2100-firmware
ignorepkg=ipw2200-firmware
ignorepkg=linux-firmware-amd
ignorepkg=linux-firmware-broadcom
ignorepkg=rtkit
ignorepkg=zd1211-firmware
EOF
}

pkg() {
    pkgs="btrfs-progs f2fs-tools ipw2100-firmware ipw2200-firmware"
    pkgs="$pkgs linux-firmware-amd linux-firmware-broadcom rtkit zd1211-firmware"
}

# Set ignore pkg list
postremove

# Uninstall ignore pkg list
pkg
