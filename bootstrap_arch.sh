#!/bin/env bash

# hkupty's environment bootstraping

# Functions
function dname {
    echo $1 | awk -F '[/.]' '{print $6}'
}

# Vars
PACKAGES="base base-devel"
MINIMAL_PACK="git zsh the_silver_searcher python python2"
EXTRA_PACKAGES="$MINIMAL_PACK docker python-pip python-virtualenv python2-pip python2-virtualenv"
GUI_PACKAGES="termite xclip firefox gnome"

DOTFILES=/opt/dotfiles

USRN=${USRN:-hkupty}
HOME_DIR=/home/$USRN
AUR_DIR=${AUR_DIR:-$HOME_DIR/aur}

NEOVIM_URL="https://aur.archlinux.org/neovim-git.git/"
NEOVIM_DEPS=("https://aur.archlinux.org/unibilium.git/" /
             "https://aur.archlinux.org/libtermkey-bzr.git/" /
             "https://aur.archlinux.org/libvterm-bzr.git/" /
             "https://aur.archlinux.org/lua-messagepack.git/")

# Packages
if [ -f /.dockerinit ]; then  # Inside a Docker container
    pacman -Sy $MINIMAL_PACK --noconfirm
else
    pacman -Sy $PACKAGES --noconfirm

    if [ ! -z "$INSTALL_EXTRA"]; then
     pacman -S $EXTRA_PACKAGES --noconfirm
    fi

    if [ ! -z "$INSTALL_GUI"]; then
     pacman -S $GUI_PACKAGES --noconfirm
    fi
fi

# Dotfiles
mkdir -p $DOTFILES
git clone https://github.com/hkupty/dotfiles $DOTFILES || exit 1

# Useradd
useradd -m -s $(which zsh) -g wheel $USRN || exit 2
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
cat /etc/sudoers

# AUR Stuff
NVIM_AUR_DIR=$AUR_DIR/neovim-git

mkdir -p $AUR_DIR

git clone https://aur.archlinux.org/neovim-git.git/ $NVIM_AUR_DIR
chown -R $USRN:users $AUR_DIR && cd $AUR_DIR/neovim-git/ || exit 3

pushd $NVIM_AUR_DIR >> /dev/null

for MOD in ${NEOVIM_DEPS[@]}
do
    git submodule add -f $MOD
    SUB_PATH=`dname $MOD`
    echo $SUB_PATH
    chown -R $USRN:users $SUB_PATH

    cd $SUB_PATH
    su $USRN -c 'makepkg -sic --noconfirm'
    cd -
done

su $USRN -c 'makepkg -sic --noconfirm'

# Install project helpers
export TGT_INSTALL=$HOME_DIR/.swissknife/
curl -L https://raw.githubusercontent.com/hkupty/swissknife/master/install-me | bash

$TGT_INSTALL/feature-switch turn-on addproj
$TGT_INSTALL/feature-switch turn-on new-proj
$TGT_INSTALL/feature-switch turn-on bootstrap
$TGT_INSTALL/feature-switch turn-on sd

echo "#!/bin/env bash" >> ~/.vars
echo "source $TGT_INSTALL/tools" >> ~/.vars
