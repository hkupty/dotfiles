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

md(){
  pandoc --to=plain $1 | less
}

alias vim=$(which nvim)

if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  export EDITOR="nvr -cc vnew -c 'set bh=delete' --remote-wait"

  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'
  alias _='nvr -c'
  alias _pwd='nvr -c "tcd `pwd`"'
else
  alias v='nvim'
fi

zstyle :omz:plugins:ssh-agent identities hk_klarna_rsa hkupty_ed25519

#source /etc/profile.d/fzf.zsh

source $HOME/scripts/_fns
export TERM=xterm-256color
export PURE_PROMPT_SYMBOL=τ

compctl -/ -W $CODE sd
compctl -/ -W $AUR_DIR aur up

eval $(gpg-agent --daemon 2>/dev/null)

setopt PROMPT_SUBST

source <(antibody init)
antibody bundle < ~/.plugins

source $HOME/.vars
source $HOME/.profile
source $HOME/.nix-profile/etc/profile.d/nix.sh

bindkey '^n' autosuggest-accept

fpath+=~/.zfunc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
