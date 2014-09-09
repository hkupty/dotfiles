ZSH=$HOME/.oh-my-zsh
ZSH_THEME="flazz"
HIST_STAMPS="dd/mm/yyyy"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode gitfast git-extras jsontools sudo systemd python docker archlinux catimg common-aliases fabric web-search)

source $ZSH/oh-my-zsh.sh

alias tmx=~/scripts/tmx.sh

# exports
export PATH=$HOME/bin:$HOME/.gem/ruby/2.1.0/bin:/usr/local/bin:$PATH
export EDITOR='vim'
export UPDATE_ZSH_DAYS=13
