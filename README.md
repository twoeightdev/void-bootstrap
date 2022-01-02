#### Post script installation

This is my personal script used after a fresh arch linux installation.

- **Bootstrap script**
```
  - $ xbps-install -Syu git
  - $ git clone https://github.com/hoaxdream/void-bootstrap
  - $ cd bootstrap
  - $ ./pkgsinstall
  - $ ./dotsetup
  - $ sudo ./partcore   # Run only for fresh disk
  - $ sudo ./partdata   # Run only for fresh disk
  - $ sudo ./postinstall
  - $ ./fmanager
  - $ reboot
```
