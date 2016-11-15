
#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $HOME/.gem/ruby/2.3.0/bin
  $HOME/scripts
  $path
)

source /etc/profile.d/fzf.zsh
