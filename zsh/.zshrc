ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh
ZSH_THEME="ingvij"
HIST_STAMPS="dd/mm/yyyy"

plugins=(gitfast git-extras jsontools sudo systemd python docker archlinux catimg common-aliases fabric web-search ssh-agent)

source $ZSH/oh-my-zsh.sh

# exports
export EDITOR='nvim'
export UPDATE_ZSH_DAYS=13

unset GREP_OPTIONS

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities ingvij_rsa

alias vim=$(which nvim)

source ~/.vars

if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  export EDITOR='nvr'

  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'
  alias _='nvr -c'
  alias _pwd='nvr -c "tcd `pwd`"'
else

  export EDITOR='nvim'

fi

export GIT_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
