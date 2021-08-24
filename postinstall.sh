#!/bin/bash

### Habilita suporte multi-arquitetura
printf "\nEtapa 1/9: Habilitando arquitetura i386... \n"
dpkg --add-architecture i386

### Atualiza repositórios e pacotes
printf "\nEtapa 2/9: Atualizando o sistema... \n\n"
apt update && apt upgrade

### Driver proprietário NVIDIA
printf "\nEtapa 3/9: Instalando driver proprietário NVIDIA... \n\n"
apt install nvidia-driver

### Fontes TrueType da Microsoft
printf "\nEtapa 4/9: Instalando Fontes TrueType Microsoft... \n\n"
apt install ttf-mscorefonts-installer

### Minha seleção de pacotes
printf "\nEtapa 5/9: Instalando softwares diversos... \n\n"
apt install ark f{eh,irefox-esr,irefox-esr-l10n-pt-br} i{nkscape,nxi} k{ate,calc,colorchooser,denlive,df,get,rita} l{ibreoffice,ibreoffice-l10n-pt-br,ibreoffice-qt5,ibreoffice-kde5} neofetch p{artitionmanager,7zip-full,7zip-rar} qbittorrent ristretto s{weeper,ynaptic} telegram-desktop vlc vokoscreen-ng youtube-dl

### Pacotes referentes a jogos
printf "\nEtapa 6/9: Instalando pacotes de jogos... \n\n"
apt install lutris steam obs-studio jstest-gtk

### Pacotes de emuladores
printf "\nEtapa 7/9: Instalando emuladores... \n"
apt install pcsx2 retroarch

### Baixa e instala o pacote Discord
printf "\nEtapa 8/9: Instalando o Discord... \n\n"
wget -cO discord.deb "https://discord.com/api/download?platform=linux&format=deb"
apt install ./discord.deb

### Instala o Flatpak e adiciona o repositório Flathub
printf "\nEtapa 9/9: Adicionando Repositório Flathub... \n\n"
apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

### End of the script.
printf "\nFIM DO SCRIPT \n\n"
