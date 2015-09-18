#PACKAGES
for x in $(cat HOME/package_list.txt); do sudo pacman --noconfirm -S $x; done

#VIDEO CARD DRIVERS
sudo pacman -S --noconfirm xf86-video-ati xf86-video-intel xf86-video-nouveau

#HOME
cat HOME/.xinitrc > ~/.xinitrc
cat HOME/.bashrc > ~/.bashrc
cat HOME/.Xresources > ~/.Xresources
cat HOME/.vimrc > ~/.vimrc
cat HOME/.tmux.conf > ~/.tmux.conf

#CONF FILES
sudo cp ETC/httpd/httpd.conf /etc/httpd/conf/httpd.conf
sudo cp ETC/php/php.ini /etc/php/php.ini

#YAOURT
chmod u+x install_yaourt.sh
~/bin/install_yaourt.sh

#VIM 
cp -r HOME/.vim ~/.vim

#php extensions
sudo pacman -S php-gd php-mcrypt
yaourt -S php-imagick
