#!/bin/sh
# remove all non ASCII character from file/folder names in a file tree
cd "$1"
convmv -f utf8 -t ASCII -r . 2>&1 | grep ascii |  perl -pe "s/ascii doesn't cover all needed characters for: //g" | awk '{system("mv "$0" \"$(echo "$0" | uconv -t ASCII -x nfd -c )\"")}'

