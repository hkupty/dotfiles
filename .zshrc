# Source/Load zinit
source /usr/share/zinit/zinit.zsh

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light joshskidmore/zsh-fzf-history-search
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
# zinit snippet OMZP::kubectx ## Perhaps?
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt prompt_subst
unsetopt autocd
unsetopt beep

bindkey -e
bindkey '^p' history-search-forward
bindkey '^n' history-search-backward
bindkey '^y' autosuggest-accept

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

export EDITOR='nvb'

export STOA_SESSION="$(~/.local/bin/stoa-session)"
export PROMPT="$(~/.local/bin/stoa-prompt)"
export RPROMPT="$(~/.local/bin/stoa-rprompt)"
function __transient_exec() { ~/.local/bin/stoa-transient }
function __record_status() { ~/.local/bin/stoa-status $? }
function __cleanup() { rm $STOA_SESSION }
add-zsh-hook preexec __transient_exec
add-zsh-hook zshexit __cleanup
add-zsh-hook precmd __record_status

function sd() { pushd "$(~/.local/bin/sd_locate "$1")" > /dev/null || return }

source /etc/profile
compctl -/ -W $CODE sd

MAX_MEMORY_UNITS=MB

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M '$MAX_MEMORY_UNITS''$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'
