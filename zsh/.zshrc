ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=/opt/dotfiles/zsh
ZSH_THEME="gallois"
HIST_STAMPS="dd/mm/yyyy"

plugins=(gitfast git-extras jsontools sudo systemd python docker archlinux catimg common-aliases fabric web-search ssh-agent)

source $ZSH/oh-my-zsh.sh

# exports
export PATH=/usr/local/heroku/bin:$HOME/Scripts:$HOME/bin:$HOME/.gem/ruby/2.2.0/bin:$PATH
export EDITOR='nvim'
export UPDATE_ZSH_DAYS=13

unset GREP_OPTIONS

alias vim=/usr/bin/nvim

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities ingvij_rsa

source ~/.vars
