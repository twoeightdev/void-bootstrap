#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream
USER=$(whoami)

setservice() {
    sudo ln -sf /etc/sv/dbus /var/service
}

finalize() {
    rm /home/$USER/.bash_logout
    rm /home/$USER/.bash_profile
    rm /home/$USER/.bashrc
    rm /home/$USER/.zshrc
    rm /home/$USER/.inputrc
    rm -rf /home/$USER/.fontconfig
    mkdir -p /home/$USER/.local/share/mail/hoaxdream
    mkdir -p /home/$USER/.local/var/service
    mkdir -p /home/$USER/.config/dl/torrent/completed
    mkdir -p /home/$USER/.config/dl/torrent/incomplete
    mkdir -p /home/$USER/.config/dl/others
    mkdir -p /home/$USER/.config/dl/pics
    mkdir -p /home/$USER/.config/dl/docs
}

# Enable service.
setservice

# Final script, delte and make directories.
finalize

echo '\033[0;32mInstallation completed, please reboot.'
