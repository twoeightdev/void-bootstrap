#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream

# Install dots
gitbarerepo() {
    cd ~
    echo "dots" >> .gitignore
    git clone --bare https://github.com/hoaxdream/void-dots.git $HOME/.config/dots
    git --git-dir=$HOME/.config/dots/ --work-tree=$HOME checkout
    git --git-dir=$HOME/.config/dots/ --work-tree=$HOME config --local status.showUntrackedFiles no
}

# Dwm,st,dmenu,startpage
gitclonerepo() {
    # Clone the repositories
    git clone https://github.com/hoaxdream/void-dwm ~/.config/dwm
    git clone https://github.com/hoaxdream/void-st ~/.config/st
    git clone https://github.com/hoaxdream/void-dmenu ~/.config/dmenu
    git clone https://github.com/hoaxdream/void-slock ~/.config/slock
    git clone https://github.com/hoaxdream/startpage ~/.config/startpage
    # Make install
    cd ~/.config/dwm
    make && sudo make install
    cd ~/.config/st
    make && sudo make install
    cd ~/.config/dmenu
    make && sudo make install
    cd ~/.config/slock
    make && sudo make install
}

echo 'dotfiles'
gitbarerepo

echo 'repositories'
gitclonerepo

echo 'Run sudo ./2a_partcore.sh then sudo ./2b_partdata.sh for fresh disk, otherwise just run sudo ./3_postinstall.sh'
