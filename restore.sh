# PACKAGES
for x in $(cat package_list.txt); do sudo pacman --noconfirm -S $x; done

# bin
cp -r bin ~/bin

# dotFiles
#cp -r -t ~/ HOME/*
#cp -r -t ~/ HOME/.*
