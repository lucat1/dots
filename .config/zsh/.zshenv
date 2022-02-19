#
# Defines environment variables.
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# custom scripts
export PATH="$PATH:$HOME/.local/bin"
# go binaries
export PATH="$PATH:$HOME/go/bin"

# default programs
export EDITOR=nvim
