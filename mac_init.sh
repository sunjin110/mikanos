#!/bin/sh

brew install dosfstools qemu llvm nasm

git clone --recurse-submodules https://github.com/tianocore/edk2.git edk2
cd edk2/BaseTools/Source/C
