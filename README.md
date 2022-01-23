#### Post script installation

This is my personal script used after a fresh arch linux installation.

- **Bootstrap script**
```
  - $ xbps-install -Syu git
  - $ git clone https://github.com/hoaxdream/void-bootstrap
  - $ cd bootstrap
  - $ ./1_pkgsinstall
  - $ ./2_dotsetup
  - $ sudo ./2a_partcore   # Run only for fresh disk
  - $ sudo ./2b_partdata   # Run only for fresh disk
  - $ sudo ./3_postinstall
  - $ ./4_finalize
  - $ reboot
```
