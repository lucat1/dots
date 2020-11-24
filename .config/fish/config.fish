set fish_greeting
fish_vi_key_bindings

if test (uname) = "Linux"; and test -z "$DISPLAY"
  sx
end

### globals 
set -gx VOLTA_HOME "$HOME/.volta"
set -gx GOPATH $HOME/go
set -gx EDITOR nvim
if test "(uname)" = "Linux"
  set -gx BROWSER chromium
  set -gx GPG_TTY '$(tty)'
end

### lemonbar configs
set -gx BARS_FONT "LigaOperatorMono Nerd Font:size=12"
set -gx BARS_MARGIN 15
set -gx BARS_HEIGHT 50
set -gx BARS_BG "#1D2021"
set -gx BARS_FG "#EBDBB2"

### modify global $PATH
if test "(uname)" != "Linux"
  set -U fish_user_paths /usr/local/opt/openjdk/bin $fish_user_paths
  set -U fish_user_paths /usr/local/opt/llvm/bin $fish_user_paths
end
set -gx PATH "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" $PATH
set -gx PATH "$HOME/.bin" $PATH
set -gx PATH "$GOPATH/bin" $PATH
set -gx PATH "$VOLTA_HOME/bin" $PATH


### aliases
alias gpg=gpg2 # make gpg work
alias scrcln='rm -rf $HOME/Pictures/screens'
alias sxiv='devour sxiv'
alias zathura='devour zathura'

# configure favourite editor
alias vim=$EDITOR
alias vi=$EDITOR

# git alias to manage config filed
# see: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# always run package managers(apk,pacman) as root
alias apk="doas apk"
alias xbps-install="sudo xbps-install"

# color palette
set -gx BACKGROUND "#282828"
set -gx FOREGROUND "#ebdbb2"
set -gx BG_1 "#32302f"

set -gx BLACK "#282828"
set -gx RED "#cc241d"
set -gx GREEN "#98971a"
set -gx YELLOW "#xd79921"
set -gx BLUE "#458588"
set -gx MAGENTA "#b16286"
set -gx CYAN  "#689d6a"
set -gx WHITE "#a89984"

set -gx LIGHT_BLACK "#928374"
set -gx LIGHT_RED "#fb4934"
set -gx LIGHT_GREEN "#b8bb26"
set -gx LIGHT_YELLOW "#fabd2f"
set -gx LIGHT_BLUE "#83a598"
set -gx LIGHT_MAGENTA "#d3869b"
set -gx LIGHT_CYAN "#8ec07c"
set -gx LIGHT_WHITE "#ebdbb2"

set -gx FONT "LigaOperatorMono Nerd Font:style=Book,Regular:antialias=true:pixelsize=16"
