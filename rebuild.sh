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
_autoinst() {
autoinst fonts/opentype/$vend/$font/$1-* \
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
}
_autoinst ComicNeue
_autoinst ComicNeueAngular

# Move the generated file and the hand-written one back
rm tex/latex/$font/$fontname.sty tex/latex/comicneue/${fontname}Angular.sty
mv tex/latex/$font/$font.sty.tmp tex/latex/$font/$font.sty

# Remove empty directories
find . -type d -empty -delete

