#!/bin/env bash

# hkupty's environment bootstraping

# Functions
function dname {
    echo $1 | awk -F '[/.]' '{print $6}'
}

# Vars
MINIMAL_PACK="git zsh the_silver_searcher python python2"

PACKAGES="base base-devel $MINIMAL_PACK"
EXTRA_PACKAGES="docker python-pip python-virtualenv python2-pip python2-virtualenv"
GUI_PACKAGES="termite xsel firefox awesome"

if [ ! -z "$INSTALL_EXTRA"]; then
 PACKAGES="$PACKAGES $EXTRA_PACKAGES"
fi
if [ ! -z "$INSTALL_GUI"]; then
 PACKAGES="$PACKAGES $GUI_PACKAGES"
fi

DOTFILES=/opt/dotfiles

USRN=${USRN:-ingvij}
HOME_DIR=/home/$USRN

# Packages
if [ -f /.dockerinit ]; then  # Inside a Docker container
  pacman -Sy $MINIMAL_PACK --noconfirm
else
  pacman -Sy $PACKAGES --noconfirm
fi

# Dotfiles
mkdir -p $DOTFILES
git clone https://github.com/hkupty/dotfiles $DOTFILES || exit 1

# Useradd
useradd -m -s $(which zsh) -g wheel $USRN || exit 2
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
cat /etc/sudoers

# AUR Stuff
NEOVIM_AUR_DIR=$AUR_DIR/neovim-git
NEOVIM_URL="https://aur.archlinux.org/neovim-git.git/"
AUR_DIR=${AUR_DIR:-/opt/aur}

mkdir -p $NEOVIM_AUR_DIR

git clone $NEOVIM_URL $NVIM_AUR_DIR
chown -R $USRN:users $AUR_DIR && cd $AUR_DIR/neovim-git/ || exit 3

pushd $NVIM_AUR_DIR >> /dev/null

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
