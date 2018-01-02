#!/bin/sh

if [ "$1" = "--full" ] || [ "$1" = "--install" ]; then
    while IFS= read -r LINE; do
        sudo pacman --noconfirm -S "$LINE"
    done < base_list.txt
fi

if [ "$1" = "--full" ] || [ "$1" = "--utils" ]; then
    while IFS= read -r LINE; do
        sudo pacman --noconfirm -S "$LINE"
    done < utils_list.txt
fi

if [ "$1" = "--full" ] || [ "$1" = "--ssh" ]; then
    sudo pacman --noconfirm -S openssh
    sudo systemctl enable sshd.socket
    sudo systemctl start sshd.socket

    echo ""
    echo "you can now ssh at : $(ip add | grep "192.168" | awk '{print $2}' | cut -d'/' -f1)"
    echo ""
fi

if [ "$1" = "--full" ] || [ "$1" = "--docker" ]; then
    sudo pacman --noconfirm -S docker docker-compose
    sudo printf "{\\n\"storage-driver\": \"overlay2\"\\n}" | sudo tee /etc/docker/daemon.json
    sudo systemctl enable docker
    sudo systemctl start docker

    docker -v
    docker-compose -v
fi
