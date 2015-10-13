ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=/opt/dotfiles/zsh
ZSH_THEME="gallois"
HIST_STAMPS="dd/mm/yyyy"

plugins=(gitfast git-extras jsontools sudo systemd python docker archlinux catimg common-aliases fabric web-search ssh-agent)

source $ZSH/oh-my-zsh.sh

# exports
export PATH=$HOME/scripts:$HOME/bin:$HOME/.gem/ruby/2.2.0/bin:$PATH
export EDITOR='vim'
export UPDATE_ZSH_DAYS=13
export NVIM_CONFIG_HOME=/opt/shared/dotfiles/nvim/

unset GREP_OPTIONS

alias vim=/usr/bin/nvim
alias vi=/usr/bin/vim

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities titans_rsa

source ~/.vars
