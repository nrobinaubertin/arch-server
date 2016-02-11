#!/bin/bash

# wipe previous save
rm -rf HOME ETC CONFIG APPS package_list AUR_list fcrontab.back

# list ll installed packages
./listPackages > package_list.txt
pacman -Qem | cut -d' ' -f1 > AUR_list.txt

# get the dotFiles (not good, gets the .config and i don't want all of it)
#cp -r -t HOME `echo ~/.??*`

# get the dotFiles
mkdir -p HOME/
cp ~/.bashrc HOME/
cp ~/.zshrc HOME/
cp ~/.bash_profile HOME/
cp ~/.tmux.conf HOME/
cp -r ~/.vim HOME/
cp ~/.vimrc HOME/
cp ~/.xinitrc HOME/
cp ~/.Xresources HOME/

# fcron
fcrontab -l > fcrontab.back

# get some server config files
mkdir -p ETC/
cat /etc/httpd/conf/httpd.conf > ETC/httpd.conf
cat /etc/php/php.ini > ETC/php.ini
