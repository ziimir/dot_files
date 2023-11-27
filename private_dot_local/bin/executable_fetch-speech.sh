#!/bin/bash

# anki export file assumed
file="$1"

if [ ! -f "$1" ]; then
    echo "ERROR: no file provided"
    exit 1
fi

if [ ! $(npm list -g --depth=0 | grep -ic pronunciation-finder) -eq 1 ]; then
    echo "pronunciation-finder package was not found, see: https://github.com/lkazberova/pronunciation-finder"
    exit 1
fi

filename=$(basename "$file")
filename="${filename%%.*}" # https://stackoverflow.com/a/965069
out_dir="$filename.d"

rm -rf "./$out_dir"
mkdir "./$out_dir"

echo "FETCHING FILES"

cat "$file" \
    | sed '/^#/d' \
    | sed 's/\t.*//' \
    | sed 's/(.*)//' \
    | sed 's/^\ *//' \
    | sed 's/\ *$//' \
    | sed "s/['?]*//g" \
    | sed 's/\ /\\ /g' \
    | xargs pronunciation-finder --dictionary oxford --path "./$out_dir"

echo "RENAMING FILES"

cd "$out_dir"

for file in *
do
    original=$(basename "$file")
    renamed=$(echo "$original" | sed 's/\ \|.*\././')

    escaped_original=$(echo "$original" | sed 's/^..*$/"&"/')
    escaped_renamed=$(echo "$renamed" | sed 's/^..*$/"&"/')

    cmd=$(echo "mv $escaped_original $escaped_renamed")
    eval $cmd
done

echo "DONE"
