#/bin/sh

find ./ -name "*.c" | xargs clang-format -i

