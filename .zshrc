# Lines configured by zsh-newuser-install
HISTFILE=~/.shellhistory
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory nomatch
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ingvij/.zshrc'

autoload bashcompinit
autoload -Uz compinit

bashcompinit
compinit
zstyle ':completion:*' menu select=2
# End of lines added by compinstall

md(){
  pandoc --to=plain $1 | less
}

alias vim=$(which nvim)
alias svim="sudo $(which nvim)"

export EDITOR="nvr -s -cc vnew -c 'set bh=delete' --remote-wait"

alias h='nvr -o'
alias v='nvr -O'
alias t='nvr --remote-tab'
alias _='nvr -c'
alias _pwd='nvr -c "tcd `pwd`"'

export TERM=xterm-256color

compctl -/ -W $CODE sd
compctl -/ -W $AUR_DIR aur up

eval $(gpg-agent --daemon 2>/dev/null)

setopt PROMPT_SUBST

source /etc/profile
source ~/.local/bin/_fns

source <(antibody init)
antibody bundle < ~/.plugins

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

bindkey '^n' autosuggest-accept

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source <(helm completion zsh)

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
