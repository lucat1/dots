set fish_greeting
fish_vi_key_bindings

if test -z "$DISPLAY" -a $XDG_VTNR = 1
  sx 
end

# basic prompt
set PROMPT '%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

# make gpg work
alias gpg=gpg2
set -gx GPG_TTY '$(tty)'

# configure favourite editor
set -gx EDITOR nvim
alias vim=$EDITOR
alias vi=$EDITOR

# git alias to manage config filed
# see: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# always run alpine' package manager as root
alias apk="doas apk"

set -gx PF_COL2 0 # make pfetch text use background color
set -gx PATH $PATH:$HOME/.bin

# volta paths
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# golang paths
set -gx GOPATH $HOME/go
set -gx PATH $PATH:$GOPATH/bin
