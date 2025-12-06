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
  *)
    cat -- "$file"
    ;;
esac
