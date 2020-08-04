set fish_greeting
fish_vi_key_bindings

# basic prompt
set PROMPT '%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

# make gpg work
alias gpg=gpg2
set -x GPG_TTY '$(tty)'

# configure favourite editor
set -x EDITOR nvim
alias vim=$EDITOR
alias vi=$EDITOR

# git alias to manage config filed
# see: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# always run alpine' package manager as root
alias apk="doas apk"

set -x PATH $PATH:$HOME/.bin
