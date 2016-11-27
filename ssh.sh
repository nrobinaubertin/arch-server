#!/bin/sh
sudo pacman -S openssh
sudo systemctl enable sshd.socket
sudo systemctl start sshd.socket
