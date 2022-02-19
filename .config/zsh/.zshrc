#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# start river on login
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
  # exec river
fi

# aliases
alias ls="exa --header --git"
alias ll="exa -a --long --header --git"
alias vi="nvim"
alias ssh="TERM=xterm-256color ssh"
alias pass="gopass"

export EDITOR=nvim

# git alias to manage dotfiles
# see: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
