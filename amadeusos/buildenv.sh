
# usage source buildenv.sh

# 必ずこのディレクトリに移動して実行すること(pathの問題)

# SCRIPT_DIR=$(cd $(dirname $0); pwd)
SCRIPT_DIR=$(pwd)
echo $SCRIPT_DIR
cd $SCRIPT_DIR

BASEDIR="${SCRIPT_DIR}/../x86_64-elf"
EDK2DIR="${SCRIPT_DIR}/../edk2"

if [ ! -d ${BASEDIR} ];then
    cd ..

    # 対象の物がない場合
    # ダウンロード
    wget https://github.com/uchan-nos/mikanos-build/releases/download/v2.0/x86_64-elf.tar.gz

    # 解凍
    tar -xvf ./x86_64-elf.tar.gz

    rm ./x86_64-elf.tar.gz
fi

export CPPFLAGS="\
    -I${BASEDIR}/include/c++/v1 -I${BASEDIR}/include -I${BASEDIR}/include/freetype2 \
    -I${EDK2DIR}/MdePkg/Include -I${EDK2DIR}/MdePkg/Include/X64 \
    -nostdlibinc -D__ELF__ -D_LDBL_EQ_DBL -D_GNU_SOURCE -D_POSIX_TIMERS \
    -DEFIAPI='__attribute__((ms_abi))'"

export LDFLAGS="-L${BASEDIR}/lib"