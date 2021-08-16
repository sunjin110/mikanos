#!/bin/sh -ex

EFI_FILE=BOOTX64.EFI
DISK_IMG=./disk.img
MOUNT_POINT=./mnt

# make image
rm -f $DISK_IMG
qemu-img create -f raw $DISK_IMG 200M
mkfs.fat -n 'MIKAN OS' -s 2 -f 2 -R 32 -F 32 $DISK_IMG

# mount image
sudo rm -rf $MOUNT_POINT
mkdir -p $MOUNT_POINT
sudo mount -o loop -t fat $DISK_IMG $MOUNT_POINT

# make image
sudo mkdir -p $MOUNT_POINT/EFI/BOOT 
sudo cp $EFI_FILE $MOUNT_POINT/EFI/BOOT/BOOTX64.EFI
if [ "$ANOTHER_FILE" != "" ]
then
    sudo cp $ANOTHER_FILE $MOUNT_POINT/
fi
sudo umount $MOUNT_POINT

# 起動
# qemu-system-x86_64 -m 1G -drive -if=pflash
