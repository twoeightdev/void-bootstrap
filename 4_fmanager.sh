#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream
USER=$(whoami)

# Cron
copycronjob() {
    mkdir ~/.config/cron
    cp ~/.config/work/backups/cronsaved ~/.config/cron/cronsaved
}

# Services
setservice() {
    sudo ln -sf /etc/sv/dbus /var/service
}

# Cleanup
finalize() {
    rm /home/$USER/.bash_logout
    rm /home/$USER/.bash_profile
    rm /home/$USER/.bashrc
    rm /home/$USER/.zshrc
    rm /home/$USER/.inputrc
    rm -rf /home/$USER/.fontconfig
    mkdir -p /home/$USER/.local/share/mail/hoaxdream
    mkdir -p /home/$USER/.local/var/service
    mkdir -p /home/$USER/.config/work/repos
    mkdir -p /home/$USER/.config/dl/torrent/completed
    mkdir -p /home/$USER/.config/dl/torrent/incomplete
    mkdir -p /home/$USER/.config/dl/others
    mkdir -p /home/$USER/.config/dl/pics
    mkdir -p /home/$USER/.config/dl/docs
}

echo 'cron'
copycronjob

echo 'services'
setservice

echo 'clean up'
finalize

echo 'Installation completed, please reboot.'
