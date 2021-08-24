# debian-11

Meu script pessoal de pós instalação focado em Debian 11 KDE Plasma (Netinst)

Esta instalação deve ser feita com a ISO Netinst, e com nenhuma opção marcada no `Tasksel`.

Após logar no TTY, instalar o KDE Plasma Mínimal, com o comando `apt install kde-plasma-desktop`.

Após instalar o DE e reiniciar, o script `postinstall.sh` poderá ser executado.

Por motivos de segurança, o apt não acompanha o argumento -y, é necessário confirmar tudo quando perguntando.

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
