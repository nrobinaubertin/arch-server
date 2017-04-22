#!/bin/bash

if [[ "$1" == "--full" ]] || [[ "$1" == "--install" ]]
then
    # PACKAGES
    for x in $(cat package_list.txt); do sudo pacman --noconfirm -S $x; done
fi

if [[ "$1" == "--full" ]] || [[ "$1" == "--ssh" ]]
then
    sudo pacman --noconfirm -S openssh
    sudo systemctl enable sshd.socket
    sudo systemctl start sshd.socket

    echo ""
    echo "you can now ssh at : $(ip add | grep "192.168" | awk '{print $2}' | cut -d'/' -f1)"
    echo ""
fi

if [[ "$1" == "--full" ]] || [[ "$1" == "--docker" ]]
then
    sudo pacman --noconfirm -S docker
    sudo systemctl enable docker
    sudo systemctl start docker

    #TODO
    # confirm using docker info
fi

# bin
mkdir -p $HOME/bin
cp -t $HOME/bin bin/*

# dotFiles
cp -r -f -t $HOME/ HOME/.config
cp -t $HOME/ HOME/.bashrc
cp -t $HOME/ HOME/.tmux.conf
