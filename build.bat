@echo off

@rem This script convert a current directory with markdown files to HTML.
@rem The output files are named after the source files.

pandoc index.md -f markdown -t html -s -o index.html -c style.css