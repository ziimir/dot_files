#!/usr/bin/env bash
set -eu

# 1-й аргумент — алиас сервера из ~/.ssh/config
remote="${1}"

# 2-й аргумент - корень, откуда искать директории на удалёнке
remote_root="${2}"

shift 2  # убрали remote и remote_root из списка

# Остальные аргументы — файлы из lf
if [ "$#" -eq 0 ]; then
  echo "No files selected" >&2
  exit 1
fi

dest_dir="$(
  ssh "$remote" "find ${remote_root} -maxdepth 10 -type d 2>/dev/null" \
    | fzf --prompt="dest> "
)"

# Ничего не выбрали в fzf → тихо выходим
[ -z "$dest_dir" ] && exit 0

echo ">>> rsync → $remote:$dest_dir/"
rsync -avh --progress "$@" "$remote:$dest_dir/"
