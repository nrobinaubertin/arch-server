cd ~
mkdir -p AUR
cd AUR
sudo pacman -S --noconfirm base-devel
wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz .
tar -xvf package-query.tar.gz
cd package-query
makepkg -si --noconfirm
cd ..
wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz .
tar -xvf yaourt.tar.gz
cd yaourt
makepkg -si --noconfirm
