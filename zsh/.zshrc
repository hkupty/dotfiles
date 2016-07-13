#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
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

sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line
