#!/bin/bash

prefix=${1%%.*}
suffix=${1##*.}

echo $prefix
echo $suffix

inkscape --file=$1 --export-pdf=${prefix}.pdf
pstoedit -f mpost ${prefix}.pdf ${prefix}.mp
mptopdf ${prefix}.mp
