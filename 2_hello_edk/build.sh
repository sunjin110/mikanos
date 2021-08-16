#!/bin/sh

# pwdを取得
pwd=$(cd $(dirname $0); pwd)

# シンボリックリンクを貼る
cd ../edk2
ln -s ${pwd}/MikanLoaderPkg ./

source ./edksetup.sh

# Conf/target.txtでMikanLoaderPkgを対象としてbuildするようにする

# TARGET = DEBUG
# TARGET_ARCH = X64
# TOOL_CHAIN_TAG = CLANG38
# 3 = 0x3

build
