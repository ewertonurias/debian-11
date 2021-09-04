#!/bin/bash

function install(){
    apt install -y $*
}

function print(){
    printf "\n$*\n\n"
}

function sources_list(){
    ### Habilita pacotes não-livre e de contribuintes
    print "Etapa 1/10: Adicionando contrib non-free na sources.list..."
    cp -v /etc/apt/sources.list{,.bkp}
    sed -i 's/main$/main contrib non-free/' /etc/apt/sources.list
    cat /etc/apt/sources.list

}

function multi_arch(){
    ### Habilita suporte multi-arquitetura
    print "Etapa 2/10: Habilitando arquitetura i386..."
    dpkg --add-architecture i386
    print "Feito!"

}

function update_system(){
    ### Atualiza repositórios e pacotes
    print "Etapa 3/10: Atualizando o sistema..."
    apt update && apt upgrade

}

function kde_minimal(){
    ### Instala o ambiente mínimo do KDE Plasma
    print "Etapa 4/10: Instalando o KDE Plasma mínimo..."
    install kde-plasma-desktop

}

function nvidia_driver(){
    ### Driver proprietário NVIDIA
    print "Etapa 5/10: Instalando driver proprietário NVIDIA..."
    install nvidia-driver

}

function apps(){
    ### Minha seleção de pacotes
    print "Etapa 6/10: Instalando softwares diversos..."
    install ark bash-completion f{eh,irefox-esr{-l10n-pt-br}} i{nkscape,nxi} k{ate,calc,colorchooser,denlive,df,get,rita} libreoffice{-l10n-pt-br,-qt5,-kde5} neofetch p{artitionmanager,lasma-browser-integration,7zip-{full,rar}} qbittorrent ristretto s{weeper,ynaptic} telegram-desktop vlc vokoscreen-ng wget youtube-dl

}

function games(){
    ### Pacotes referentes a jogos
    print "Etapa 7/10: Instalando pacotes de jogos..."
    install lutris steam obs-studio jstest-gtk

}

function emulators(){
    ### Pacotes de emuladores
    print "Etapa 8/10: Instalando emuladores..."
    install pcsx2 retroarch

}

function discord(){
    ### Baixa e instala o pacote Discord
    print "Etapa 9/10: Instalando o Discord..."
    install wget
    wget -cO discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz"
    tar -xvzf discord.tar.gz -C /opt
    ln -sf /opt/Discord/Discord /usr/bin/Discord
 
    printf "
[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=/usr/bin/Discord
Icon=/opt/Discord/discord.png
Type=Application
Categories=Network;InstantMessaging;
Path=/usr/bin
    " > /usr/share/applications/discord.desktop
    print "Discord instalado com sucesso!"

}

function flatpak(){
    ### Instala o Flatpak e adiciona o repositório Flathub
    print "Etapa 10/10: Adicionando Repositório Flathub..."
    install flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    print "Feito!"

}

function mscorefonts(){
    ### Fontes TrueType da Microsoft
    print "Etapa Opcional: Instalando Fontes TrueType Microsoft..."
    install ttf-mscorefonts-installer

}


if [[ "$1" == "exec" ]] && [[ $UID -eq 0 ]]; then
    sources_list
    multi_arch
    update_system
    kde_minimal
    nvidia_driver
    apps
    games
    emulators
    discord
    flatpak
    #mscorefonts
elif [[ $UID -eq 0 ]]; then
    # Corrige o timeout do sudo.
    # Se a conexão do usuário for lenta,
    # o script demorará mais que o tempo permitido
    # para a execução do SUDO. Para evitar o timeout,
    # chamamos o script novamente mudando os poderes do sudo.
    sudo su -c "$0 exec"
else
    printf 'Precisa ser root!\n'
    exit 255
fi

### Fim do script.
printf "\nFIM DO SCRIPT \n\n"
