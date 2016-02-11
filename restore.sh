#PACKAGES
for x in $(cat package_list.txt); do sudo pacman --noconfirm -S $x; done

#VIDEO CARD DRIVERS
#sudo pacman -S --noconfirm xf86-video-ati xf86-video-intel xf86-video-nouveau

#DWM
#cd dwm
#sudo make clean install
#cd ../

#YAOURT
./install_yaourt.sh

#AUR
./install_aur.sh

# GENERAL UPDATE
sudo pacman -Syyu

#PERSONAL
cp -r -t ~/ HOME/*
cp -r -t ~/ HOME/.*

#CONF FILES
#sudo mkdir -p /etc/httpd/conf
#sudo cp ETC/httpd/httpd.conf /etc/httpd/conf/httpd.conf
#sudo mkdir -p /etc/php
#sudo cp ETC/php/php.ini /etc/php/php.ini
