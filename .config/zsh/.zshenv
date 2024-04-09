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
# Yarn binaries
export PATH="$PATH:$HOME/.yarn/bin"
# Haskell binaries
export PATH="$PATH:$HOME/.cabal/bin:$HOME/.ghcup/bin"
# Google cloud binaries
export PATH="$PATH:/opt/google-cloud-cli/bin"

# Open the gpg password prompt in the current terminal
export GPG_TTY=$(tty)

# Wayland variables
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# Default programs
export EDITOR=nvim
export BROWSER=firefox

# Attach to the ssh agent
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
