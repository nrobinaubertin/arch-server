#!/bin/bash

if [[ $EUID -ne 0 ]]
then
	echo "This script must be run as root" 1>&2
	exit 1
fi

curl -o /etc/pacman.d/mirrorlist https://www.archlinux.org/mirrorlist/all/
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist
tmp=$(mktemp)
rankmirrors -n 10 /etc/pacman.d/mirrorlist > "$tmp"
cat "$tmp" > /etc/pacman.d/mirrorlist
