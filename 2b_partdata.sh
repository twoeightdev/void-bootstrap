#!/bin/sh
# Change the value of line 11 and 13 to your corresponding disk value

(
echo g
echo n
echo
echo
echo
echo w
) | fdisk /dev/sda

mkfs.ext4 /dev/sda1

echo '/dev/sda partition done'
