#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream

me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
name="$USER"
repodir="$HOME/.config/dev"
dwmdir="$HOME/.config/dev/void-dwm"
stdir="$HOME/.config/dev/void-st"
dwmblocksdir="$HOME/.config/dev/void-dwmblocks"
dmenudir="$HOME/.config/dev/void-dmenu"
slockdir="$HOME/.config/dev/void-slock"

menu() {
    echo    "usage:         " $me "[OPTION]"
    echo    " "
    echo    "dot:           install my dotfiles"
    echo    "pkg:           install packages"
    echo    " "
    echo    "dwm:           git clone dwm"
    echo    "st:            git clone st"
    echo    "dwmblocks:     git clone dwmblocks"
    echo    "dmenu:         git clone dmenu"
    echo    "slock:         git clone slock"
    echo    "startpage:     git clone startpage"
    echo    "mkdwm:         install dwm"
    echo    "mkst:          install st"
    echo    "mkdwmblocks:   install dwmblocks"
    echo    "mkdmenu:       install dmenu"
    echo    "mkslock:       install slock"
    echo    " "
    echo    "all:           git clone all suckless repo"
    echo    "mkall:         install all suckless"
    echo    "finalize       clean up"
    echo    " "
    echo    "NOTE:  install dot first then finalize after everything else."
}

dot() {
    cd ~
    git clone --bare https://github.com/hoaxdream/void-dots.git $HOME/.config/dots
    git --git-dir=$HOME/.config/dots/ --work-tree=$HOME checkout
}

pkg() {
    # xorg
    pkgs="xorg-minimal xorg-server-devel xwininfo xprop xdpyinfo xset xsetroot xrdb xterm"
    # nvidia
    pkgs="$pkgs nvidia-libs-32bit vulkan-loader vulkan-loader-32bit"
    # core
    pkgs="$pkgs xcape setxkbmap efivar mlocate readline-devel lm_sensors pkg-config man-db wget zip unzip unrar "
    pkgs="$pkgs dosfstools ntfs-3g xdg-user-dirs xtools xdg-utils xclip xdo xdotool mediainfo elogind bc tree"
    # audio
    pkgs="$pkgs pulseaudio alsa-plugins-pulseaudio pulsemixer pamixer"
    # fonts
    pkgs="$pkgs dejavu-fonts-ttf noto-fonts-ttf noto-fonts-emoji"
    pkgs="$pkgs liberation-fonts-ttf font-inconsolata-otf"
    # others
    pkgs="$pkgs calcurse yt-dlp ffmpeg maim sxiv xwallpaper ImageMagick"
    pkgs="$pkgs rsync newsboat picom mpd mpc mpv ncmpcpp"
    pkgs="$pkgs pandoc tectonic zathura zathura-pdf-mupdf poppler python3-adblock cronie"
    pkgs="$pkgs dunst libnotify gucharmap htop transmission tremc moreutils jq"
    pkgs="$pkgs qutebrowser qrencode steam Signal-Desktop lf upower unclutter-xfixes"
    pkgs="$pkgs base-devel libXrandr-devel libX11-devel libXft-devel libXinerama-devel"
    # mail
    pkgs="$pkgs neomutt notmuch isync msmtp"
    # lib32's needed for lutris
    pkgs="$pkgs wine wine-32bit wine-devel wine-devel-32bit wine-mono wine-gecko libmpg123-32bit"
    pkgs="$pkgs libopenal-32bit v4l-utils-32bit libpulseaudio-32bit libjpeg-turbo-32bit libXcomposite-32bit"
    pkgs="$pkgs libXinerama-32bit giflib-32bit ocl-icd ocl-icd-32bit libgpg-error-devel libgpg-error-devel-32bit"
    pkgs="$pkgs sqlite-32bit libpng-32bit gnutls-devel gnutls-32bit gnutls-devel-32bit"
    pkgs="$pkgs Vulkan-Headers Vulkan-Tools Vulkan-ValidationLayers Vulkan-ValidationLayers-32bit"
    pkgs="$pkgs libwine-32bit libgcrypt-32bit libxslt-32bit libva-32bit gst-plugins-base1-32bit lutris"
    # install pkgs
    sudo xbps-install -Syu $pkgs
}

all() {
    dwm
    st
    dwmblocks
    dmenu
    slock
    startpage
}

mkall() {
    cd $dwmdir >/dev/null 2>&1 && make && sudo make install || echo "Clone the repo first."
    cd $stdir >/dev/null 2>&1 && make && sudo make install || echo "Clone the repo first."
    cd $dwmblocksdir >/dev/null 2>&1 && make && sudo make install || echo "Clone the repo first."
    cd $dmenudir >/dev/null 2>&1 && make && sudo make install || echo "Clone the repo first."
    cd $slockdir >/dev/null 2>&1 && make && sudo make install || echo "Clone the repo first."
}

dwm() {
    cd $repodir
    git clone --depth 1 https://github.com/hoaxdream/void-dwm.git
}

st() {
    cd $repodir
    git clone --depth 1 https://github.com/hoaxdream/void-st.git
}

dwmblocks() {
    cd $repodir
    git clone --depth 1 https://github.com/hoaxdream/void-dwmblocks.git
}

dmenu() {
    cd $repodir
    git clone --depth 1 https://github.com/hoaxdream/void-dmenu.git
}

slock() {
    cd $repodir
    git clone --depth 1 https://github.com/hoaxdream/void-slock.git
}

startpage() {
    cd $repodir
    git clone --depth 1 https://github.com/hoaxdream/startpage.git
}

mkdwm() {
    cd $dwmdir >/dev/null 2>&1 && make && sudo make install || echo "Clone the repo first."
}

mkst() {
    cd $stdir >/dev/null 2>&1 && make && sudo make install || echo "Clone the repo first."
}

mkdwmblocks() {
    cd $dwmblocksdir >/dev/null 2>&1 && make && sudo make install || echo "Clone the repo first."
}

mkdmenu() {
    cd $dmenudir >/dev/null 2>&1 && make && sudo make install || echo "Clone the repo first."
}

mkslock() {
    cd $slockdir >/dev/null 2>&1 && make && sudo make install || echo "Clone the repo first."
}

finalize() {
    rm /home/$name/.bash_logout
    rm /home/$name/.bash_profile
    rm /home/$name/.bashrc
    rm /home/$name/.zshrc
    rm /home/$name/.inputrc
    mkdir -p /home/$name/.config/cron
    mkdir -p /home/$name/.local/share/mail/hoaxdream
    mkdir -p /home/$name/.local/var/service
    mkdir -p /home/$name/.config/dev/rsync/notes
    mkdir -p /home/$name/.config/dl/torrent/completed
    mkdir -p /home/$name/.config/dl/torrent/incomplete
    mkdir -p /home/$name/.config/dl/others
    mkdir -p /home/$name/.config/dl/pics
    mkdir -p /home/$name/.config/dl/docs
    cp /home/$name/.config/dev/cronsaved /home/$name/.config/cron/cronsaved
    echo '\033[0;32mRun sudo ./root.sh'
}

if [ -n "$1" ]; then
    $1
else
    menu
fi
