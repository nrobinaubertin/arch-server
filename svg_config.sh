#!/bin/bash

# wipe previous save
rm -rf HOME SERVER package_list AUR_list fcrontab.back bin

# list ll installed packages
./listPackages.sh > package_list.txt
pacman -Qem | cut -d' ' -f1 > AUR_list.txt

# get the dotFiles (not good, gets the .config and i don't want all of it)
#cp -r -t HOME `echo ~/.??*`

# get the bin directory
cp -r ~/bin bin

# get the dotFiles
mkdir -p HOME/

cp ~/.bash_profile HOME/
cp ~/.tmux.conf HOME/
cp -r ~/.vim HOME/
cp ~/.vimrc HOME/

# fcron
fcrontab -l > fcrontab.back

# get some server config files
mkdir -p SERVER/

mkdir -p SERVER/php
cat /etc/php/php.ini > SERVER/php/php.ini

mkdir -p SERVER/nginx
cat /etc/nginx/nginx.conf > SERVER/nginx/nginx.conf
