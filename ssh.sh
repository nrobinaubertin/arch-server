#!/bin/sh
sudo pacman --noconfirm -S openssh
sudo systemctl enable sshd.socket
sudo systemctl start sshd.socket

echo ""
echo "you can now ssh at : $(ip add | grep "192.168" | awk '{print $2}' | cut -d'/' -f1)"
echo ""
