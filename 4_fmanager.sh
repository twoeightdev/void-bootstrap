#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream
USER=$(whoami)

# Cron
int_cron()
  {
    mkdir ~/.config/cron
    cp ~/.config/work/backups/cronsaved ~/.config/cron/cronsaved
  }
# Chown /media
int_chown()
  {
    sudo chown -R $USER:$USER /media/core/
    sudo chown -R $USER:$USER /media/data/
  }
# Cleanup
int_cleanup()
  {
    rm /home/$USER/.bash_logout
    rm /home/$USER/.bash_profile
    rm /home/$USER/.bashrc
    rm /home/$USER/.zshrc
    rm /home/$USER/.inputrc
    rm -rf /home/$USER/.fontconfig
    mkdir -p /home/$USER/.local/share/mail/hoaxdream
    mkdir -p /home/$USER/.local/var/service
    mkdir -p /home/$USER/.config/work/gitbuild
    mkdir -p /home/$USER/.config/dl/torrent/completed
    mkdir -p /home/$USER/.config/dl/torrent/incomplete
    mkdir -p /home/$USER/.config/dl/others
    mkdir -p /home/$USER/.config/dl/music
    mkdir -p /home/$USER/.config/dl/vids
    mkdir -p /home/$USER/.config/dl/docs
  }

echo 'cron'
int_cron
echo 'chown'
int_chown
echo 'clean up'
int_cleanup
