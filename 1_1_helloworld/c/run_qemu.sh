#!/bin/sh

EFI_FILE=BOOTX64.EFI
DISK_IMG=./disk.img
MOUNT_POINT=./mnt

# make image
rm -f $DISK_IMG
qemu-img create -f raw $DISK_IMG 200M
mkfs.fat -n 'MIKAN OS' -s 2 -f 2 -R 32 -F 32 $DISK_IMG

# mount image
mkdir -p $MOUNT_POINT
sudo mount -o loop $DISK_IMG $MOUNT_POINT

# 

# 起動
qemu-system-x86_64 -m 1G -drive -if=pflash
