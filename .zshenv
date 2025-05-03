# No need to export anything here, as .zshenv is sourced for 
# _every_ shell (unless invoked with `zsh -f`).

# Assign these only if they don't have value yet. 
: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_CACHE_HOME:=$HOME/.cache}

# Set $ZDOTDIR here to be able to store your other Zsh dotfiles 
# outside of $HOME. 
ZDOTDIR="$XDG_CONFIG_HOME/zsh"
NVM_DIR="$XDG_CONFIG_HOME/nvm"
ZDOTDIR="$XDG_CONFIG_HOME/zsh"

NVM_DIR="$XDG_CONFIG_HOME/nvm"
