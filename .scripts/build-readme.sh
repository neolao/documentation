#!/bin/bash

cat .scripts/README.header
find . -name "*.md" -execdir sh -c 'filename=${0##*/}; printf "%s [%s](%s)\n" "-" "${filename%.*}" "$filename"' {} ';'
cat .scripts/README.footer

