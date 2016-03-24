#!/bin/bash


for x in $(cat AUR_list.txt); do yaourt --noconfirm -S $x; done
yaourt -Syyu --noconfirm
