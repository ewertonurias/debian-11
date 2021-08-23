#!/bin/bash

### Habilita suporte multi-arquitetura
printf "\nEtapa 1/8: Habilitando arquitetura i386... \n"
dpkg --add-architecture i386

### Atualiza repositórios e pacotes
printf "\nEtapa 2/8: Atualizando o sistema... \n\n"
apt update && apt upgrade

### Driver proprietário NVIDIA
printf "\nEtapa 3/8: Instalando driver proprietário NVIDIA... \n\n"
apt install nvidia-driver

### Fontes TrueType da Microsoft
printf "\nEtapa 4/8: Instalando Fontes TrueType Microsoft... \n\n"
apt install ttf-mscorefonts-installer

# Minha seleção de pacotes
printf "\nEtapa 5/8: Instalando softwares diversos... \n\n"
apt install k{ate,df,denlive,rita,colorchooser,get,calc} l{ibreoffice,ibreoffice-l10n-pt-br,ibreoffice-qt5,ibreoffice-kde5} i{nkscape,nxi} p{artitionmanager,7zip-full,7zip-rar} s{ynaptic,weeper} ark f{eh,irefox-esr,irefox-esr-l10n-pt-br} neofetch qbittorrent ristretto telegram-desktop vokoscreen-ng vlc youtube-dl

### Pacotes referentes a jogos
printf "\nEtapa 6/8: Instalando pacotes de jogos... \n\n"
apt install lutris steam obs-studio jstest-gtk

### Baixa e instalar o pacote do Discord
printf "\nEtapa 7/8: Instalando o Discord... \n\n"
wget -cO discord.deb "https://discord.com/api/download?platform=linux&format=deb"
apt install ./discord.deb

### Instala o Flatpak e adiciona o repositório Flathub
printf "\nEtapa 8/8: Adicionando Repositório Flathub... \n\n"
apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

### End of the script.
printf "\nFIM DO SCRIPT \n\n"
