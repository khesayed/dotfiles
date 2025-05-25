# No need to export anything here, as .zshenv is sourced for 
# _every_ shell (unless invoked with `zsh -f`).

# Assign these only if they don't have value yet. 
: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_CACHE_HOME:=$HOME/.cache}

# Set $ZDOTDIR here to be able to store your other Zsh dotfiles 
# outside of $HOME. 
ZDOTDIR="$XDG_CONFIG_HOME/zsh"
NVM_DIR="$XDG_CONFIG_HOME/nvm"
GIT_CONFIG="$XDG_CONFIG_HOME/git/.gitconfig"
VIMINIT='source $XDG_CONFIG_HOME/vim/.vimrc'
FONTCONFIG_FILE="$XDG_CONFIG_HOME/.config/fontconfig/fonts.conf"

# The following have to go in .zprofile, because they are used by 
# macOS's /etc/zshrc file, which is sourced _before_ your`.zshrc` 
# file.
SHELL_SESSION_DIR=$XDG_CACHE_HOME/zsh/sessions
SHELL_SESSION_FILE=$SHELL_SESSION_DIR/$TERM_SESSION_ID

