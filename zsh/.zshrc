# HISTFILE is used by interactive shells only. Plus, 
# non-interactive shells & external commands don't need this var. 
# Hence, we put it in your .zshrc file, since that's sourced for 
# each interactive shell, and don't export it.
HISTFILE="$XDG_CACHE_HOME/zsh/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
HISTIGNORE="exit:clear"

export XDG_CONFIG_HOME XDG_CACHE_HOME

# Completion official documentations
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Completion-System
# Enable autocomplete and loads a function only when needed instead of at startup
autoload -Uz compinit vcs_info
# faster Zsh startup by caching auto completion
compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"

# Use cache for faster autocomplete suggestions
zstyle ':completion:*' use-cache on
# Ensures that Zsh automatically refreshes its command cache when using tab completion for executables
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompdump"

# Sync other sessions with installed or updated plugins
zstyle ':completion:*' rehash true

# Allow menu selection
zstyle ':completion:*' menu select

# Files and directories are sorted by modification time, newest first instead of alphabetical order
zstyle ':completion:*' file-sort modification

# case senstive correction and complete partial words
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:*' check-for-changes true

# Prompt formatting
# %b the current branch name
# %u are there any unstaged changes
# %c are there any staged changes
# %a the current Git action being performed (this only makes sense in actionformats)

zstyle ':vcs_info:git:*' formats '%F{180}on  %b%f %F{11}%u%c%f'
zstyle ':vcs_info:git:*' actionformats '%F{180}on  %b%f %F{9}%a%f %F{11}%u%c%f'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
# -----------
# OPTIONS
# https://zsh.sourceforge.io/Doc/Release/Options.html#Options
# -----------
# Spelling correction
setopt CORRECT
# Remove duplicate commands from history
setopt HIST_IGNORE_ALL_DUPS
# Remove duplicate comvcs_info_mgs_0_mands
setopt HIST_SAVE_NO_DUPS
#By default, Zsh overwrites the history file when closing a session. To append new history instead Prevent history loss when multiple terminal sessions are open
setopt APPEND_HISTORY
# By default each terminal has it's own history this shares all history across all terminals
setopt SHARE_HISTORY
# Ignores commands start with space from history
setopt HIST_IGNORE_SPACE
setopt PROMPT_SUBST
# -----------
# ALIASES
# -----------
# [[ -f "$ZDOTDIR/aliases" ]] && source "$ZDOTDIR/aliases"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias rm='rm -rf -i'
alias v='vim'
alias ll='ls -A -lh --color=always | awk '\''{printf "\033[0m%-10s %-20s %s\n", $5, $6" "$7" "$8, $9}'\'''

# -----------
# KEYBINDING
# -----------
# Activate vim mode
#bindkey -v


# Functions
precmd() {
	vcs_info
}
# -----------
# PROMPTs
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
# -----------
PROMPT='%F{195} %n%f%F{250} in%f%F{115} %1~ %f${vcs_info_msg_0_}
%F{155}❯ %f'


# -----------
# PLUGINS
# -----------
# Source zsh-autosuggestions
[[ -f "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
# Source zsh-syntax-highlighting
[[ -f "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
