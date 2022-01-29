#### Post script installation

This is my personal script used after a fresh arch linux installation.

- **Bootstrap script**
```
  - $ xbps-install -Syu git
  - $ git clone https://github.com/hoaxdream/void-bootstrap
  - $ cd bootstrap
  - $ ./setup.sh        # Install dot first
  - $ sudo ./root.sh    # Needs to be run as root
  - $ sudo ./ssd.sh     # Run only for fresh disk
  - $ sudo ./hhd.sh     # Run only for fresh disk
  - $ reboot
```
