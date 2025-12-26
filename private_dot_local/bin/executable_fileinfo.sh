#!/bin/sh

path="$1"

name="$(basename -- "$path")"
printf 'name: %s\n' "$name"
printf '\n'

ftype=$(stat -f '%HT' -- "$path")   # “Symbolic Link”, “Directory”, “Regular File”, etc.
link_target=""
if [ -L "$path" ]; then
  link_target=$(readlink -- "$path")
fi

printf 'type: %s\n' "$ftype"
[ -n "$link_target" ] && printf 'link: %s\n' "$link_target"

file_mime=$(file --brief --mime-type "$path")
printf 'mime: %s\n' "$file_mime"

size=$(du -hs "$path" | awk '{print $1}') # размер на диске
bytes=$(stat -f %z -- "$path") # байт в данных (для каталога - размер метаданных)
human=$(awk -v b="$bytes" 'BEGIN{
  split("B KB MB GB TB PB EB",u," ");
  i=1;
  while (b>=1024 && i<7) { b/=1024; i++ }
  if (i==1) printf "%.0f %s", b, u[i];
  else      printf "%.1f %s", b, u[i];
}')

printf 'size: %s (disk)\nbytes: %s (%s)\n' "$size" "$bytes" "$human"
printf '\n'
