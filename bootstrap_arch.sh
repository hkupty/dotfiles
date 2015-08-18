#!/bin/env bash

# hkupty's environment bootstraping

# Functions
function dname {
    echo $1 | awk -F '[/.]' '{print $6}'
}

# Vars
# PACKAGES="alsa-firmware alsa-tools alsa-utils autoconf automake awesome baobab bash binutils bison bzip2 clusterssh coreutils cryptsetup dconf-editor device-mapper dhcpcd diffutils docker e2fsprogs efibootmgr empathy eog epiphany evince fakeroot ffmpeg file filesystem findutils firefox flex gawk gcc gcc-libs gdm gettext git glibc gnome-backgrounds gnome-calculator gnome-contacts gnome-control-center gnome-desktop gnome-dictionary gnome-disk-utility gnome-font-viewer gnome-keyring gnome-power-manager gnome-screenshot gnome-session gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-system-log gnome-system-monitor gnome-terminal gnome-themes-standard gnome-tweak-tool gnome-user-docs gnome-user-share gnumeric graphviz grep grilo-plugins gucharmap gzip htop imagemagick inetutils iproute2 iputils jfsutils less libtool licenses linux logrotate lvm2 m4 make man-db man-pages mdadm mousetweaks mumble mutter mysql-python nano nautilus netctl nodejs npm openssh pacman patch pciutils pcmciautils perl pkg-config procps-ng psmisc pulseaudio pulseaudio-alsa python python-pip python-virtualenv python2-pip python2-virtualenv reiserfsprogs s-nail sed shadow stow sudo sushi sysfsutils systemd-sysvcompat tar task termite texinfo the_silver_searcher tmux totem tracker ttf-anonymous-pro ttf-dejavu unclutter usbutils util-linux vi vim vino vte3-ng which xclip xdg-user-dirs-gtk xf86-input-libinput xf86-input-synaptics xf86-video-intel xfsprogs xorg-server xorg-server-utils xorg-xinit yelp zsh"
PACKAGES="git zsh base-devel"

DOTFILES=/opt/dotfiles

USRN=${USRN:-hkupty}
HOME_DIR=/home/$USRN
AUR_DIR=${AUR_DIR:-$HOME_DIR/aur}

NEOVIM_URL="https://aur4.archlinux.org/neovim-git.git/"
NEOVIM_DEPS=("https://aur4.archlinux.org/unibilium.git/" /
             "https://aur4.archlinux.org/libtermkey-bzr.git/" /
             "https://aur4.archlinux.org/libvterm-bzr.git/" /
             "https://aur4.archlinux.org/lua-messagepack.git/")

# Packages
pacman -Sy $PACKAGES --noconfirm

# Dotfiles
mkdir -p $DOTFILES
git clone https://github.com/hkupty/dotfiles $DOTFILES || exit 1

# Useradd
useradd -m -s $(which zsh) -g wheel $USRN || exit 2
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
cat /etc/sudoers

# AUR Stuff
mkdir -p $AUR_DIR
git clone https://aur4.archlinux.org/neovim-git.git/ $AUR_DIR/neovim-git 
chown -R $USRN:users $AUR_DIR && cd $AUR_DIR/neovim-git/ || exit 3

for MOD in ${NEOVIM_DEPS[@]}
do
    git submodule add -f $MOD
    SUB_PATH=`dname $MOD`
    chown -R $USRN:users $SUB_PATH && cd $SUB_PATH 
    su $USRN -c 'makepkg -sic --noconfirm'
    cd -
done

su $USRN -c 'makepkg -sic --noconfirm'
