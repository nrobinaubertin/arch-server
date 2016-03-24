# PACKAGES
for x in $(cat package_list.txt); do sudo pacman --noconfirm -S $x; done

# YAOURT
./install_yaourt.sh

# AUR
./install_aur.sh

# OTHER
./install_other.sh

# GENERAL UPDATE
yaourt -Syyu --noconfirm

# bin
cp -r bin ~/bin

# dotFiles
cp -r -t ~/ HOME/*
cp -r -t ~/ HOME/.*

# SERVER

sudo cp -t /etc/php SERVER/php/*
sudo cp -t /etc/nginx SERVER/nginx/*
