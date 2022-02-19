# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Custom scripts
export PATH="$PATH:$HOME/.local/bin"
# Go binaries
export PATH="$PATH:$HOME/go/bin"

# Default programs
export EDITOR=nvim
