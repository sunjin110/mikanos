#!/bin/sh

# USB

# 今回は/dev/sdd1だった

sudo umount /dev/sdd1
sudo mkfs.fat /dev/sdd1
sudo mkdir -p /mnt/usbmem
sudo mount /dev/sdd1 /mnt/usbmem
sudo mkdir -p /mnt/usbmem/EFI/BOOT
sudo cp ./BOOTX64.EFI /mnt/usbmem/EFI/BOOT
sudo umount /mnt/usbmem