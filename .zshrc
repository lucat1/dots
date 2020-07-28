# basic prompt
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

# make gpg work
alias gpg=gpg2
export GPG_TTY=$(tty)

# configure favourite editor
export EDITOR=nvim
alias vim=$EDITOR
alias vi=$EDITOR

# git alias to manage config filed
# see: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=/home/luca/.cfg/ --work-tree=/home/luca'

# always run alpine' package manager as root
alias apk="doas apk"
