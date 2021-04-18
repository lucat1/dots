if [ -z "${DISPLAY}" ]; then sx; fi

### exports
export HISTFILE=$HOME/.mksh_history
export HISTSIZE=4200
export GOPATH="$HOME/go"
export EDITOR=nvim
export BROWSER=chromium

export _JAVA_AWT_WM_NONREPARENTING=1
export GPG_TTY=$(tty)
export CHROME_FLAGS="--enable-features=WebUIDarkMode --force-dark-mode"

export PATH="$HOME/.bin:$GOPATH/bin:$PATH"

### aliases
alias ls=exa
alias ll="exa -al" # make gpg work
alias gpg=gpg2 # make gpg work
alias scrcln='rm -rf $HOME/Pictures/screens'
alias sxiv='devour sxiv'
alias zathura='devour zathura'
alias vi="nvim"
alias vim="nvim"

# git alias to manage dotfiles
# see: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# vi:syntax=sh
