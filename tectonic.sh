#!/bin/bash

sed -i '1 s/^.*$/\\documentclass[10pt]{article}/' tmpfile.tex
tectonic -Z shell-escape -Z shell-escape-cwd="$(pwd)" --keep-logs tmpfile.tex
inkscape --export-area-drawing --export-type=svg --pdf-poppler tmpfile.pdf
touch tmpfile.dvi
sed -i ':a; N; s/\n/ /; ta' tmpfile.svg
sed -i -e "s/\"/\'/g" tmpfile.svg
sed -i -e "s/>/>\n/g" tmpfile.svg

