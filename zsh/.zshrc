# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_hst
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory nomatch
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ingvij/.zshrc'

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select=2
# End of lines added by compinstall

alias vim=$(which nvim)

if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  export EDITOR='nvr'

  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'
  alias _='nvr -c'
  alias _pwd='nvr -c "tcd `pwd`"'

fi

source <(antibody init)
antibody bundle < ~/.plugins

source ~/.vars
source ~/.fns
source /etc/profile.d/fzf.zsh

zstyle :omz:plugins:ssh-agent identities id_rsa

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$HOME/scripts:$PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
export PATH="$PATH:$HOME/.gem/ruby/2.4.0/bin"

unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export TERM=xterm-256color

bindkey '^n' autosuggest-accept

compctl -/ -W $PROJ_DIR sd
setopt PROMPT_SUBST
