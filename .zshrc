ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ingvij"
HIST_STAMPS="dd/mm/yyyy"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast git-extras jsontools sudo systemd virtualenv python docker archlinux catimg common-aliases fabric)

source $ZSH/oh-my-zsh.sh

# exports
export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='vim'
export UPDATE_ZSH_DAYS=13
