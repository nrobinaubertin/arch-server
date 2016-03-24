#!/bin/bash
cd ~
mkdir -p AUR
cd AUR
sudo pacman -S --noconfirm base-devel
git clone https://aur.archlinux.org/package-query.git 
cd package-query
makepkg -sri --noconfirm
cd ..
git clone https://aur.archlinux.org/yaourt.git 
cd yaourt
makepkg -sri --noconfirm
