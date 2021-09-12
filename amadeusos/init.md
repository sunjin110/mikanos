# init

シンボリックリンクをはる  
```sh
cd edk2
ln -s ../amadeusos/AmadeusLoaderPkg ./
```

# edk
edkのConf/target.txtを下記のようにする
```
# build amadeus os
BUILD_RULE_CONF = Conf/build_rule.txt
ACTIVE_PLATFORM = AmadeusLoaderPkg/AmadeusLoaderPkg.dsc
TARGET = DEBUG
TARGET_ARCH = X64
TOOL_CHAIN_TAG = CLANG38
3 = 0x3
```