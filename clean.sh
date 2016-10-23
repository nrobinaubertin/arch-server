#!/bin/sh

# This script should be used to clean an arch system without reformatting it.

# remove all but base
pacman -R $(comm -23 <(pacman -Qq | sort) <((for i in $(pacman -Qqg base); do pactree -ul "$i"; done) | sort -u))
