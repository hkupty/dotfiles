# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias vim=$(which nvim)

if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  export EDITOR='nvr'

  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'
  alias _='nvr -c'
  alias _pwd='nvr -c "tcd `pwd`"'

fi

zle -N sudo-command-line
bindkey "\e\e" sudo-command-line


