#!/bin/bash

# Criando os container com Arth Linux
distrobox create --yes --nvidia --name Arch-ScrCpy --image  docker.io/library/archlinux:latest

# Instala o App
distrobox enter Arch-ScrCpy -- sudo pacman -S scrcpy
