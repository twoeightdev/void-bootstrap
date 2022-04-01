#### Post script installation

This is my personal script used after a fresh arch linux installation.

- **Bootstrap script**
```
  - $ xbps-install -Syu git
  - $ git clone https://github.com/hoaxdream/void-bootstrap.git
  - $ cd void-bootstrap
  - $ sudo ./opt.sh     # Needs to be run as root configured for my system
  - $ sudo ./hhd.sh     # Run only for fresh disk configured for my system
  - $ sudo ./ssd.sh     # Run only for fresh disk configured for my system
  - $ ./setup.sh        # You only need this, install dot first
  - $ sudo ./root.sh    # Needs to be run as root configured for my system
  - $ sudo reboot
```
