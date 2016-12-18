# PACKAGES
for x in $(cat package_list.txt); do sudo pacman --noconfirm -S $x; done

# bin
mkdir -p $HOME/bin
cp -t $HOME/bin bin/*

# dotFiles
cp -r -f -t $HOME/ HOME/.config
cp -t $HOME/ HOME/.bashrc
cp -t $HOME/ HOME/.tmux.conf
