#!/bin/sh

file="$1"
w="$2"
h="$3"

# ширина превью = половина колонки lf
pw=$((w / 2))
# высота как и раньше (можно подрезать, чтобы не упираться в рамки)
ph=$((h - 2))

mime=$(file -Lb --mime-type -- "$file")

case "$mime" in
  image/*)
    chafa \
      --symbols=block \
      --fill=block \
      --size="${pw}x${ph}" \
      -- "$file"
    exit 1
    ;;
  application/x-tar|application/zip|application/gzip|application/x-7z-compressed|application/x-xz|application/x-lzma|application/x-bzip|application/x-bzip2|application/x-bzip3|application/x-lz4|application/x-snappy|application/x-snappy-framed|application/zstd|application/x-zstd|application/vnd.rar|application/x-rar|application/x-rar-compressed|application/x-brotli|application/brotli*)
    ouch list --tree -- "$file"
    ;;
  *)
    cat -- "$file"
    ;;
esac
