#! /bin/bash --

set -ex
FLAGS=$([[ "$OSTYPE" == "darwin"* ]] && echo "" || echo "-s -static")
${CC:-gcc} $FLAGS -O2 -D_FILE_OFFSET_BITS=64 -DUSE_LZMA2 -DUSE_CHMODW -DUSE_INSTALLER \
    -W -Wall -Wextra -Werror=implicit -Werror=implicit-function-declaration -Werror=implicit-int -Werror=pointer-sign -Werror=pointer-arith \
    -o tiny7zx "$@" \
    7zAlloc.c 7zCrc.c 7zDec.c 7zIn.c 7zMain.c 7zStream.c Bcj2.c Bra.c Bra86.c Lzma2Dec.c LzmaDec.c
ls -ld tiny7zx
strip tiny7zx
ls -ld tiny7zx
upx -9 tiny7zx
: compile.sh OK.
