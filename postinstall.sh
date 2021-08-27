#!/bin/bash

function sources_list(){
### Habilita pacotes não-livre e de contribuintes
printf "\nEtapa 1/10: Adicionando contrib non-free na sources.list... \n\n"
sudo sed -i 's/main/main contrib non-free/' /etc/apt/sources.list
cat /etc/apt/sources.list
}

### Habilita suporte multi-arquitetura
printf "\nEtapa 2/10: Habilitando arquitetura i386... \n"
sudo dpkg --add-architecture i386
printf "\nFeito!\n"

### Atualiza repositórios e pacotes
printf "\nEtapa 3/10: Atualizando o sistema... \n\n"
sudo apt update && sudo apt upgrade

### Instala o ambiente mínimo do KDE Plasma
printf "\nEtapa 4/10: Instalando o KDE Plasma mínimo... \n"
sudo apt install kde-plasma-desktop

### Driver proprietário NVIDIA
printf "\nEtapa 5/10: Instalando driver proprietário NVIDIA... \n\n"
sudo apt install nvidia-driver

### Minha seleção de pacotes
printf "\nEtapa 6/10: Instalando softwares diversos... \n\n"
sudo apt install ark bash-completion f{eh,irefox-esr,irefox-esr-l10n-pt-br} i{nkscape,nxi} k{ate,calc,colorchooser,denlive,df,get,rita} l{ibreoffice,ibreoffice-l10n-pt-br,ibreoffice-qt5,ibreoffice-kde5} neofetch p{artitionmanager,lasma-browser-integration,7zip-full,7zip-rar} qbittorrent ristretto s{weeper,ynaptic} telegram-desktop vlc vokoscreen-ng youtube-dl

### Pacotes referentes a jogos
printf "\nEtapa 7/10: Instalando pacotes de jogos... \n\n"
sudo apt install lutris steam obs-studio jstest-gtk

### Pacotes de emuladores
printf "\nEtapa 8/10: Instalando emuladores... \n"
sudo apt install pcsx2 retroarch

### Baixa e instala o pacote Discord
printf "\nEtapa 9/10: Instalando o Discord... \n"
wget -cO discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz"
sudo tar -xvzf discord.tar.gz -C /opt
sudo ln -sf /opt/Discord/Discord /usr/bin/Discord
printf '
[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that is free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=/usr/bin/Discord
Icon=/opt/Discord/discord.png
Type=Application
Categories=Network;InstantMessaging;
Path=/usr/bin
' > /usr/share/applications/discord.desktop
printf "\nDiscord instalado com sucesso!\n"

### Instala o Flatpak e adiciona o repositório Flathub
printf "\nEtapa 10/10: Adicionando Repositório Flathub... \n\n"
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
printf "\nFeito!\n\n"

### Fim do script.
printf "\nFIM DO SCRIPT \n\n"
