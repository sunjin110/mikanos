#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd ../edk2

souce edksetup.sh

build
