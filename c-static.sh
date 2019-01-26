#! /bin/bash --

set -ex
LDFLAGS=$([[ "$OSTYPE" == "darwin"* ]] && echo "" || echo "-s")
${CC:-gcc} $LDFLAGS -static -O2 -D_FILE_OFFSET_BITS=64 -DUSE_LZMA2 -DUSE_CHMODW -DUSE_INSTALLER \
    -W -Wall -Wextra -Werror=implicit -Werror=implicit-function-declaration -Werror=implicit-int -Werror=pointer-sign -Werror=pointer-arith \
    -o tiny7zx.static "$@" \
    7zAlloc.c 7zCrc.c 7zDec.c 7zIn.c 7zMain.c 7zStream.c Bcj2.c Bra.c Bra86.c Lzma2Dec.c LzmaDec.c
ls -ld tiny7zx.static
upx -9 tiny7zx.static
: c-static.sh OK.
