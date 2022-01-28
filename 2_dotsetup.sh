#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream

repodir="$HOME/.config/dev"

gitbarerepo() {
    cd ~
    echo "dots" >> .gitignore
    git clone --bare https://github.com/hoaxdream/void-dots.git $HOME/.config/dots
    git --git-dir=$HOME/.config/dots/ --work-tree=$HOME checkout
    git --git-dir=$HOME/.config/dots/ --work-tree=$HOME config --local status.showUntrackedFiles no
}

gitclonerepo() {
    cd $repodir
    echo void-dwm void-st void-dmenu void-dwmblocks void-slock startpage | xargs -n1 |
        xargs -I{} git clone https://github.com/hoaxdream/{} && echo "Successful"
}

gitinstall() {
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

# Make and install.
gitinstall

echo '\033[0;32mRun sudo ./2a_partcore.sh then sudo ./2b_partdata.sh for fresh disk, otherwise just run sudo ./3_postinstall.sh'
