#
# Defines environment variables.
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# firefox & wayland bullshit
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

# custom scripts
export PATH="$PATH:$HOME/.local/bin"
# go binaries
export PATH="$PATH:$HOME/go/bin"

# java bullshit
export JDTLS_HOME=$HOME/.local/java
export WORKSPACE=$JDTLS_HOME/workspace
