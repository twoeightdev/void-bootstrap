#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream

postremove() {
    cat >/etc/xbps.d/99-ignore.conf <<'EOF'
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
    sudo xbps-remove -Ryco $pkgs
}

# Set ignore pkg list
postremove

# Uninstall ignore pkg list
pkg

echo '\033[0;32mDone and reboot.'
