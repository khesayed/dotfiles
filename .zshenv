export XDG_CONFIG_HOME="$HOME/.config"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$HOME/.cache/.zsh_history"
export SHELL_SESSION_DIR="$HOME/.cache/.zsh_sessions"
# Create session dir if not exists
mkdir -m 700 -p "$SHELL_SESSION_DIR"

export HISTSIZE=10000
export SAVEHIST=10000
export HISTIGNORE="exit:clear"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

