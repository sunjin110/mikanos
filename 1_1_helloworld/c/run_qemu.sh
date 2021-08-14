#!/bin/sh

DISK_IMG=./disk.img

# make image
qemu-img create -f raw $DISK_IMG 200M
mkfs.fat -n 'SUN MIKAN OS' -s 2 -f 2 -R 32 -F 32 $DISK_IMG

# mount image
