ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh
ZSH_THEME="ingvij"
HIST_STAMPS="dd/mm/yyyy"

plugins=(gitfast git-extras jsontools sudo systemd python docker archlinux catimg common-aliases fabric web-search ssh-agent)

source $ZSH/oh-my-zsh.sh

# exports
export PATH=/usr/local/heroku/bin:$HOME/Scripts:$HOME/bin:$HOME/.gem/ruby/2.2.0/bin:$PATH
export EDITOR='nvim'
export UPDATE_ZSH_DAYS=13

unset GREP_OPTIONS

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities ingvij_rsa

alias vim=$(which nvim)

source ~/.vars
