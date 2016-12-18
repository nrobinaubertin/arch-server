# PACKAGES
for x in $(cat package_list.txt); do sudo pacman --noconfirm -S $x; done

# bin
mkdir -p ~/bin
cp -t ~/bin bin/*

# dotFiles
cp -r -t ~/ HOME/.config
cp -t ~/ HOME/.bashrc
cp -t ~/ HOME/.tmux.conf
#cp -r -t ~/ HOME/*
#cp -r -t ~/ HOME/.*
