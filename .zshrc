ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bureau"
HIST_STAMPS="dd/mm/yyyy"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python docker catimg fabric sudo web-search)

source $ZSH/oh-my-zsh.sh

alias tmx=~/scripts/tmx.sh

# exports
export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='vim'
export UPDATE_ZSH_DAYS=13
