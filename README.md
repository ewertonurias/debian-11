# debian-11

Meu script pessoal de pós instalação focado em Debian 11 KDE Plasma (Netinst)

1. Durante a instalação, deixe em branco a senha do root, assim seu usuário será adicionado automaticamente ao sudoers.
2. Desmarque todas as opções do `Tasksel`.
3. Após logar no TTY, instale o git com o comando `sudo apt install git`.
4. Inicie o script com `cd debian-11 && sudo chmod +x postinstall.sh && ./postinstall`.

Por questões de segurança, o apt não acompanha o argumento -y, é necessário confirmar tudo quando perguntado.

# Habilita suporte multi-arquitetura (i386)?
Sim.

# Driver proprietário NVIDIA será oferecido?
Sim.

# Fontes TrueType Microsoft serão oferecidas?
Sim.

# Quais repositórios serão adicionados?
Somente o Flathub.

# Pacotes referentes a jogos que serão instalados
- lutris
- steam
- discord
- obs-studio
- pcsx2
- retroarch

# Outros pacotes que serão instalados
- ark
- feh
- firefox-esr
- flatpak
- inkscape
- inxi
- kate
- kcalc
- kcolorchooser
- kdenlive
- kdf
- kget
- krita
- libreoffice
- neofetch
- partitionmanager
- p7zip-full
- p7zip-rar
- qbittorent
- ristretto
- sweeper
- synaptic
- telegram-desktop
- vlc
- vokoscreen-ng
- youtube-dl

# Pacotes que serão removidos
Nenhum.
