#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd ../edk2

~/develop/mikanos/qemu/run_qemu.sh Build/AmadeusLoaderX64/DEBUG_CLANG38/X64/Loader.efi