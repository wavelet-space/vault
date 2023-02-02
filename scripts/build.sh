#!/usr/bin/env bash

# This script convert a current directory with markdown files to HTML.
# The output files are named after the source files.

SOURCES=*.md

for file in ${SOURCES}; do 
    # extension="${f##*.}"
    name="${file%.*}"
    echo The file ${file} converted to ${name}.html
    `pandoc ${file} -f markdown -t html -s -o ${name}.html -c style.css`
    # `pandoc $f -t rst -o ${name}.rst`
done