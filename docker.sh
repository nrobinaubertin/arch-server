#!/bin/sh
sudo pacman --noconfirm -S docker
sudo systemctl enable docker
sudo systemctl start docker

#TODO
# confirm using docker info
