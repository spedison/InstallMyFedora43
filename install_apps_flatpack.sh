#!/bin/bash

echo "Adicionando e mostrando os repositórios" 

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak remote-list --show-details

echo "Instalando as aplicações"

#Visualiza Qualquer tipo de vídeo
flatpak -y install flathub org.videolan.VLC

#Conversor de tipos de vídeo
flatpak -y install flathub fr.handbrake.ghb

#Editor de arquivos Latex
flatpak -y install flathub org.texmacs.TeXmacs

#Ferramenta de programação com matrizes
flatpak -y install flathub org.octave.Octave

#Gerador de gráficos com dados
flatpak -y install flathub org.kde.labplot

#Mais um cara para trabalhar com dados / gráficos
flatpak -y install flathub org.kde.cantor

#Gráficos com dados
flatpak -y install flathub se.sjoerd.Graphs

#Editor de imagens vetoriais
flatpak -y install flathub org.inkscape.Inkscape

#Mapear Drives remotos de maneira local.
flatpak -y install flathub io.github.zarestia_dev.rclone-manager

#Editor de Audio
flatpak -y install flathub org.audacityteam.Audacity

#Ferramentas para administração de banco de dados
flatpak -y install flathub io.dbeaver.DBeaverCommunity

#Editor de Código
flatpak -y install flathub com.visualstudio.code

#Navegador Web Muito Bom
flatpak -y install flathub com.vivaldi.Vivaldi

#navegador Web Bem Usado
flatpak -y install flathub com.google.Chrome

#Chave de senhas
flatpak -y install flathub org.keepassxc.KeePassXC

# 2 Leitores de e-books
flatpak -y install flathub com.github.johnfactotum.Foliate
flatpak -y install flathub org.kde.arianna

#Editor de imagens bem razoável para um amador na área de edição
flatpak -y install flathub org.kde.krita

#Para trabalhar com mesa digitalizadora e/ou mouse para 
# Para apresentações / aulas
flatpak -y install flathub com.github.xournalpp.xournalpp

#Editor para ajustar páginas dos pdfs
flatpak -y install fedora com.github.jeromerobert.pdfarranger

#Comparador de diretórios para fazer merge de fontes.
flatpak -y install fedora org.gnome.Meld
