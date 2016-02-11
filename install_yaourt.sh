cd ~
mkdir -p AUR
cd AUR
sudo pacman -S --noconfirm base-devel
git clone https://aur.archlinux.org/package-query.git 
cd package-query
makepkg -si --noconfirm
cd ..
git clone https://aur.archlinux.org/yaourt.git 
cd yaourt-1.7
makepkg -si --noconfirm
