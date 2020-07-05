if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx
fi

export LOCALE=en_US.utf8

export ZSH="/home/luca/.oh-my-zsh"

source ~/.oh-my-zsh/custom/themes/geometry/geometry.zsh
ZSH_THEME=""

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# setup golang paths
export PATH=$PATH:$HOME/go/bin

alias chrome=chromium --force-dark-mode --force-device-scale-factor=1.1 %U
alias code=code-oss

# alias open=xdg-open
alias gpg=gpg2
export GPG_TTY=$(tty)

export VOLTA_HOME=$HOME/.volta
export PATH=$PATH:$VOLTA_HOME/bin
export EDITOR="nvim"

# git alias to manage config filed
# see: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=/home/luca/.cfg/ --work-tree=/home/luca'
