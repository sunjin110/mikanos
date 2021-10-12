#!/bin/sh -e

# EFI_FILE=BOOTX64.EFI
EFI_FILE=$1
ANOTHER_FILE=$2
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
        sleep 0.5
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
        sleep 0.5
        sudo umount $MOUNT_POINT
    ;;
esac

# OVMFファイルを取得
curl -O https://raw.githubusercontent.com/uchan-nos/mikanos-build/master/devenv/OVMF_CODE.fd
curl -O https://raw.githubusercontent.com/uchan-nos/mikanos-build/master/devenv/OVMF_VARS.fd

# 起動
qemu-system-x86_64 \
    -m 1G \
    -drive if=pflash,format=raw,readonly=on,file=./OVMF_CODE.fd \
    -drive if=pflash,format=raw,file=./OVMF_VARS.fd \
    -drive if=ide,index=0,media=disk,format=raw,file=$DISK_IMG \
    -device nec-usb-xhci,id=xhci \
    -device usb-mouse -device usb-kbd \
    -monitor stdio \
    $QEMU_OPTS

