#!/bin/sh

clang -target x86_64-pc-win32-coff -mno-red-zone -fno-stack-protector -fshort-wchar -Wall -c hello.c

lld-link-10 /subsystem:efi_application /entry:EfiMain /out:BOOTX64.EFI hello.o
