#!/bin/bash

cat .scripts/README.header
find . -name "*.md" -execdir sh -c 'filename=${0##*/}; printf "%s [%s](%s)\n" "-" "${filename%.*}" "$filename"' {} ';' | sort -t '\0' -n
cat .scripts/README.footer

