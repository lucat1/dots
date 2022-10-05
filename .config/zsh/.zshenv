# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Custom scripts
export PATH="$PATH:$HOME/.local/bin"
# Go binaries
export PATH="$PATH:$HOME/go/bin"
# Rust binaries
export PATH="$PATH:$HOME/.cargo/bin"

# Open the gpg password prompt in the current terminal
export GPG_TTY=$(tty)

# Default programs
export EDITOR=nvim
export BROWSER=firefox

# https://github.com/swaywm/sway/issues/595
if [ "$XDG_SESSION_DESKTOP" = "sway" ] ; then
    export _JAVA_AWT_WM_NONREPARENTING=1
fi
