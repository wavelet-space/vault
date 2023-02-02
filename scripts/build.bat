@echo off

@rem This script convert a current directory with markdown files to HTML.
@rem The output files are named after the source files.

pandoc source/index.md -f markdown -t html -s -o index.html -c style.css --metadata title="David Landa"