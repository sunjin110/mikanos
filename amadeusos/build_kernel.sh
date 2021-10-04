#!/bin/sh

cd kernel
# clang++ -O2 -Wall -g --target=x86_64-efl -ffreestanding -mno-red-zone -fno-exceptions -fno-rtti -std=c++17 -c main.cpp

# ld.lld --entry KernelMain -z norelro --image-base 0x100000 --static -o kernel.elf main.o


# clang++ $CPPFLAGS -O2 -Wall -g --target=x86_64-efl -ffreestanding -mno-red-zone -fno-exceptions -fno-rtti -std=c++17 -c main.cpp

clang++ $CPPFLAGS -O2 --target=x86_64-elf -fno-exceptions -ffreestanding -c main.cpp

ld.lld $LDFLAGS --entry KernelMain -z norelro --image-base 0x100000 --static -o kernel.elf main.o
