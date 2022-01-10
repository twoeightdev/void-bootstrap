#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream

# Void packages installation
inst_pkgs()
  {
    # Xorg
    pkgs="xorg-minimal xorg-server-devel xwininfo xprop xdpyinfo xset xsetroot xrdb xterm"
    # Nvidia
    pkgs="$pkgs nvidia-libs-32bit vulkan-loader vulkan-loader-32bit"
    # Core
    pkgs="$pkgs xcape setxkbmap mlocate readline-devel lm_sensors pkg-config man-db wget zip unzip unrar "
    pkgs="$pkgs dosfstools ntfs-3g xdg-user-dirs xtools xdg-utils xclip xdo xdotool mediainfo elogind bc tree"
    # Audio
    pkgs="$pkgs pulseaudio alsa-plugins-pulseaudio pulsemixer pamixer"
    # Fonts
    pkgs="$pkgs dejavu-fonts-ttf noto-fonts-ttf noto-fonts-emoji"
    pkgs="$pkgs liberation-fonts-ttf font-inconsolata-otf font-awesome"
    # Others
    pkgs="$pkgs calcurse yt-dlp ffmpeg maim sxiv xwallpaper ImageMagick"
    pkgs="$pkgs newsboat picom mpd mpc mpv ncmpcpp"
    pkgs="$pkgs zathura zathura-pdf-mupdf poppler python3-adblock cronie"
    pkgs="$pkgs dunst libnotify gucharmap htop transmission tremc moreutils"
    pkgs="$pkgs qutebrowser qrencode steam Signal-Desktop lf upower"
    pkgs="$pkgs base-devel libXrandr-devel libX11-devel libXft-devel libXinerama-devel"
    # Mail
    pkgs="$pkgs neomutt notmuch isync msmtp"
    # lib32's needed for lutris
    pkgs="$pkgs wine giflib-32bit libpng-32bit gnutls-32bit libmpg123-32bit libopenal-32bit"
    pkgs="$pkgs v4l-utils-32bit libpulseaudio-32bit libjpeg-turbo-32bit libXcomposite-32bit"
    pkgs="$pkgs libgcrypt-32bit libXinerama-32bit ocl-icd ocl-icd-32bit"
    pkgs="$pkgs libxslt-32bit libva-32bit gst-plugins-base1-32bit lutris"
    # Install pkgs
    sudo xbps-install -Syu $pkgs
    # Services
    sudo ln -sf /etc/sv/cronie /var/service
  }

echo 'install packages'
inst_pkgs

echo 'Packages installation completed please reboot and run ./dotsetup'
