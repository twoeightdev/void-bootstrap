#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream

gitbarerepo() {
    cd ~
    echo "dots" >> .gitignore
    git clone --bare https://github.com/hoaxdream/void-dots.git $HOME/.config/dots
    git --git-dir=$HOME/.config/dots/ --work-tree=$HOME checkout
    git --git-dir=$HOME/.config/dots/ --work-tree=$HOME config --local status.showUntrackedFiles no
}

gitclonerepo() {
    # clone the repositories
    cd $HOME/.config/dev
    git clone https://github.com/hoaxdream/void-dwm.git
    git clone https://github.com/hoaxdream/void-st.git
    git clone https://github.com/hoaxdream/void-dmenu.git
    git clone https://github.com/hoaxdream/void-dwmblocks.git
    git clone https://github.com/hoaxdream/void-slock.git
    git clone https://github.com/hoaxdream/startpage.git
    # cd to each directory and install
    cd $HOME/.config/dev/void-dwm
    make && sudo make install
    cd $HOME/.config/dev/void-st
    make && sudo make install
    cd $HOME/.config/dev/void-dmenu
    make && sudo make install
    cd $HOME/.config/dev/void-dwmblocks
    make && sudo make install
    cd $HOME/.config/dev/void-slock
    make && sudo make install
}

# Clone dotfiles using git bare.
gitbarerepo

# Clone all suckless and startpage for qutebrowser.
gitclonerepo

echo 'Run sudo ./2a_partcore.sh then sudo ./2b_partdata.sh for fresh disk, otherwise just run sudo ./3_postinstall.sh'
