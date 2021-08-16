#!/bin/sh -e

EFI_FILE=BOOTX64.EFI
DISK_IMG=./disk.img
MOUNT_POINT=./mnt
OS=`uname`
echo $OS

# make image
rm -f $DISK_IMG
qemu-img create -f raw $DISK_IMG 200M
mkfs.fat -n 'MIKAN OS' -s 2 -f 2 -R 32 -F 32 $DISK_IMG

sudo rm -rf $MOUNT_POINT
mkdir -p $MOUNT_POINT

case "$OS" in
    "Darwin" ) 
        # mount image
        sudo hdiutil attach -mountpoint $MOUNT_POINT $DISK_IMG
        sudo mkdir -p $MOUNT_POINT/EFI/BOOT 
        sudo cp $EFI_FILE $MOUNT_POINT/EFI/BOOT/BOOTX64.EFI
        if [ "$ANOTHER_FILE" != "" ]
        then
            sudo cp $ANOTHER_FILE $MOUNT_POINT/
        fi
        sudo hdiutil detach $MOUNT_POINT
    ;;
    "Linux" )
        # mount image
        sudo mount -o loop $DISK_IMG $MOUNT_POINT
        sudo mkdir -p $MOUNT_POINT/EFI/BOOT 
        sudo cp $EFI_FILE $MOUNT_POINT/EFI/BOOT/BOOTX64.EFI
        if [ "$ANOTHER_FILE" != "" ]
        then
            sudo cp $ANOTHER_FILE $MOUNT_POINT/
        fi
        sudo umount $MOUNT_POINT
    ;;
esac


# 起動
# qemu-system-x86_64 -m 1G -drive -if=pflash
