set fish_greeting
fish_vi_key_bindings

if test -z "$DISPLAY"
  sx 
end

### globals 
set -gx VOLTA_HOME "$HOME/.volta"
set -gx GOPATH $HOME/go
set -gx PF_COL2 0 # make pfetch text use background color
set -gx EDITOR nvim
set -gx GPG_TTY '$(tty)'

### modify global $PATH
set -gx PATH "/sbin" $PATH
set -gx PATH "/usr/sbin" $PATH
set -gx PATH "$HOME/.bin" $PATH
set -gx PATH "$GOPATH/bin" $PATH
set -gx PATH "$VOLTA_HOME/bin" $PATH


### aliases
alias gpg=gpg2 # make gpg work

# configure favourite editor
alias vim=$EDITOR
alias vi=$EDITOR

# git alias to manage config filed
# see: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# always run package managers(apk,pacman) as root
alias apk="doas apk"
alias pacman="sudo apk"
