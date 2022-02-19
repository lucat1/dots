# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# aliases
alias ls="exa --header --git"
alias ll="exa -a --long --header --git"
alias vi="nvim"
alias ssh="TERM=xterm-256color ssh"
alias pass="gopass"
