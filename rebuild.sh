#!/bin/bash
# Simple Script to rebuild the fonts in this package.

# Parameters
fontname="ComicNeue"
vend="rozynski"

# Remove capitals from font
font=${fontname,,}

# Backup the hand-written package
mv tex/latex/$font/$font.sty tex/latex/$font/$font.sty.tmp

# Convert the OpenType fonts
autoinst fonts/opentype/$vend/$font/*   \
    -sanserif                           \
    -target=.                           \
    -vendor="$vend"                     \
    -typeface="$font"                   \
    -encoding=OT1,T1,LY1,TS1            \
    -ts1                                \
    -nosmallcaps                        \
    -nosuperiors                        \
    -noinferiors                        \
    -nofractions                        \
    -noswash                            \
    -notitling                          \
    -noornaments                        \
    -noupdmap

# Move the generated file and the hand-written one back
rm tex/latex/$font/$fontname.sty
mv tex/latex/$font/$font.sty.tmp tex/latex/$font/$font.sty

# Remove empty directories
find . -type d -empty -delete

