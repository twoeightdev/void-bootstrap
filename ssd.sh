#!/bin/sh
# Change the value of line 11 and 13 to your corresponding disk value

(
echo g
echo n
echo
echo
echo
echo w
) | fdisk /dev/nvme1n1

mkfs.ext4 /dev/nvme1n1p1

echo '\033[0;32m/dev/nvme1n1 parition done'
